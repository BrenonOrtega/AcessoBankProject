using System;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using FundTransfer.Domain.Models;
using FundTransfer.Infra.Helpers.Rabbitmq;
using FundTransfer.Domain.Repositories.Commands;
using Microsoft.Extensions.Options;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace FundTransfer.Infra.Services
{
    public class TransferOrderConsumerService : BackgroundService
    {
        private readonly RabbitmqConfiguration _rabbitmqConfig;

        private readonly IServiceScopeFactory _serviceScopeFactory;

        private readonly ILogger<TransferOrderConsumerService> _logger;

        private readonly ConnectionFactory _factory;

        private readonly IConnection _connection;

        private readonly IModel _channel;

        public TransferOrderConsumerService(
            IOptions<RabbitmqConfiguration> option,
            ILogger<TransferOrderConsumerService> logger,
            IServiceScopeFactory serviceScopeFactory)
        {
            _rabbitmqConfig = option.Value;
            _serviceScopeFactory = serviceScopeFactory;
            _logger = logger;

            _factory = new()
            {
                HostName = _rabbitmqConfig.Hostname,
                Port = _rabbitmqConfig.Port,
                UserName = _rabbitmqConfig.Username,
                Password = _rabbitmqConfig.Password,
                DispatchConsumersAsync = true,
                NetworkRecoveryInterval = TimeSpan.FromSeconds(_rabbitmqConfig.NetworkRecoveryIntervalInSeconds)
            };

            _connection = _factory.CreateConnection();

            _channel = _connection.CreateModel();
            _channel.QueueDeclare(
                queue: _rabbitmqConfig.QueueName,
                durable: false,
                exclusive: false,
                autoDelete: false,
                arguments: null
            );
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            stoppingToken.ThrowIfCancellationRequested();

            var consumer = new AsyncEventingBasicConsumer(_channel);

            consumer.Received += async (sender, eventArgs) =>
            {
                var contentArray = eventArgs.Body.ToArray();
                var contentString = Encoding.UTF8.GetString(contentArray);
                var receivedOrder = JsonSerializer.Deserialize<TransferOrder>(contentString);

                var _orderCommander = _serviceScopeFactory.CreateScope().ServiceProvider.GetRequiredService<ITransferOrderCommandRepository>();
                var _balanceCommander = _serviceScopeFactory.CreateScope().ServiceProvider.GetRequiredService<IBalanceAdjustmentCommandRepository>();

                try
                {
                    await StartsProcessing(receivedOrder);
                    await TransferValue(receivedOrder);
                    FinishTransaction(receivedOrder);
                }
                catch (Exception ex)
                {
                    await HandleTransactionException(receivedOrder, ex);
                }

                async Task StartsProcessing(TransferOrder order)
                {
                    order.SetProcessingStatus();
                    await _orderCommander.Update(order.TransactionId, order);
                }

                async Task TransferValue(TransferOrder order)
                {
                    order.ConfirmStatus();

                    await _balanceCommander.PostDebitAdjustment(order.SourceAccountNumber, order.Value);
                    await _balanceCommander.PostCreditAdjustment(order.DestinationAccountNumber, order.Value);

                    await _orderCommander.Update(order.TransactionId, order);
                }

                void FinishTransaction(TransferOrder order)
                {
                    _logger.LogInformation(
                        "Transfer Order {orderId} executed between accounts {sourceAccount} - {destinationAccount}",
                        order.TransactionId,
                        order.SourceAccountNumber,
                        order.DestinationAccountNumber);

                    _channel.BasicAck(eventArgs.DeliveryTag, false);
                }

                async Task HandleTransactionException(TransferOrder order, Exception ex)
                {
                    receivedOrder.SetErrorStatus(ex.Message);
                    await _orderCommander.Update(order, order);

                    _logger.LogError(
                        ex,
                        "Error while executing transfer operation on message {TransactionId} {errorMessage}",
                        order.TransactionId,
                        ex.Message
                    );

                    _channel.BasicNack(eventArgs.DeliveryTag, false, true);
                }
            };

            string tag = _channel.BasicConsume(_rabbitmqConfig.QueueName, false, consumer);
            await Task.CompletedTask;
        }
    }
}

using System;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Infra.Helpers.Rabbitmq;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace FundTransfer.Application.Services
{
    public class TransferOrderConsumerService : BackgroundService
    {
        private readonly RabbitmqConfiguration _rabbitmqConfig;

        private readonly ConnectionFactory _factory;

        private readonly IConnection _connection;

        private readonly IModel _channel;

        private readonly ITransferOrderCommandRepository _orderCommander;

        private readonly IBalanceAdjustmentCommandRepository _balanceCommander;

        public TransferOrderConsumerService(
            IOptions<RabbitmqConfiguration> option,
            ITransferOrderCommandRepository orderCommander,
            IBalanceAdjustmentCommandRepository balanceCommander
        ){
            _rabbitmqConfig = option.Value;

            _orderCommander = orderCommander;
            _balanceCommander = balanceCommander;

            _factory = new()
            {
                HostName = _rabbitmqConfig.Hostname,
                Port = _rabbitmqConfig.Port,
                UserName = _rabbitmqConfig.Username,
                Password = _rabbitmqConfig.Password
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

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            var consumer = new EventingBasicConsumer(_channel);

            consumer.Received += (sender, eventArgs) =>
            {
                var contentArray = eventArgs.Body.ToArray();
                var contentString = Encoding.UTF8.GetString(contentArray);
                var message = JsonSerializer.Deserialize<TransferOrderConsumerService>(contentString);

                

            };

            _channel.BasicConsume(
                queue: _rabbitmqConfig.QueueName,
                autoAck: false,
                consumer: consumer
            );

            return Task.CompletedTask;
        }

    }
}

using RabbitMQ.Client;
using System.Text;
using System.Text.Json;
using FundTransfer.Infra.Helpers.Rabbitmq;
using FundTransfer.Domain.Models;
using Microsoft.Extensions.Options;

namespace FundTransfer.Infra.Services
{
    public class TransferOrderPublisher
    {
        private readonly RabbitmqConfiguration _rabbitmqConfig;

        private readonly ConnectionFactory _factory;

        public TransferOrderPublisher(IOptions<RabbitmqConfiguration> options)
        {
            _rabbitmqConfig = options.Value;

            _factory = new ConnectionFactory()
            {
                HostName = _rabbitmqConfig.Hostname,
                Port = _rabbitmqConfig.Port,
                UserName = _rabbitmqConfig.Username,
                Password = _rabbitmqConfig.Password
            };
        }

        public void PostMessage(TransferOrder order)
        {
            using var cnn = _factory.CreateConnection();
            using var channel = cnn.CreateModel();

            channel.QueueDeclare(
                queue: _rabbitmqConfig.QueueName,
                durable: false,
                exclusive: false,
                autoDelete: false,
                arguments: null
            );


            var content = JsonSerializer.Serialize<TransferOrder>(order);
            var byteMessage = Encoding.UTF8.GetBytes(content);

            channel.BasicPublish(
                exchange: "",
                routingKey: _rabbitmqConfig.QueueName,
                basicProperties: null,
                body: byteMessage
            );
        }

    }
}
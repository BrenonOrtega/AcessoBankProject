namespace FundTransfer.Infra.Helpers.Rabbitmq
{
    public class RabbitmqConfiguration
    {
        public const string RabbitMQ = "rabbitmq";
        public string Hostname { get; set; }
        public int Port { get; set; }
        public string QueueName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int NetworkRecoveryIntervalInSeconds { get; set; }
    }
}

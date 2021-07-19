using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using FundTransfer.Infra.Data;
using FundTransfer.Infra.Services;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Commands;

namespace FundTransfer.Infra.Repositories.Commands
{
    public class TransferOrderCommandRepository : ITransferOrderCommandRepository
    {
        private readonly TransferOrderPublisher _publisher;

        private readonly FundTransferContext _context;

        private readonly ILogger<TransferOrderCommandRepository> _logger;

        public TransferOrderCommandRepository(TransferOrderPublisher publisher, FundTransferContext context, ILogger<TransferOrderCommandRepository> logger)
        {
            _publisher = publisher;
            _context = context;
            _logger = logger;
        }

        public async Task<bool> Create(TransferOrder model)
        {
            _context.TransferOrders.Add(model);
            _publisher.PostMessage(model);
            await _context.SaveChangesAsync();

            _logger.LogInformation("Creating and publishing Fund Transfer Order {order}", model);
            return true;
        }

        public async Task<bool> Update<Guid>(Guid id, TransferOrder model)
        {
            _context.TransferOrders.Update(model);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
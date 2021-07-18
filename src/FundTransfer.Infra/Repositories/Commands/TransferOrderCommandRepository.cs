using FundTransfer.Infra.Data;
using FundTransfer.Infra.Services;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Commands;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

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

        public async Task<bool> Create(TransferOrder order)
        {
            _context.TransferOrders.Add(order);
            _publisher.PostMessage(order);
            await _context.SaveChangesAsync();

            _logger.LogInformation("Creating and publishing Fund Transfer Order {order}", order);
            return true;            
        }

        public async Task<bool> Update<Guid>(Guid id, TransferOrder order)
        {
            _context.TransferOrders.Update(order);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
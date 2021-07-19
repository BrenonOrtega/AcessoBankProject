using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Queries;
using FundTransfer.Infra.Data;
using Microsoft.EntityFrameworkCore;

namespace FundTransfer.Infra.Repositories.Queries
{
    public class TransferOrderQueryRepository : ITransferOrderQueryRepository
    {
        FundTransferContext _context;

        public TransferOrderQueryRepository(FundTransferContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<TransferOrder>> GetAll()
        {
            return await _context.TransferOrders.ToListAsync();
        }

        public async Task<TransferOrder> GetByAccountNumber(string number)
        {
            throw new NotImplementedException();
        }

        public async Task<TransferOrder> GetById<V>(V id)
        {
            return await _context.TransferOrders.FirstOrDefaultAsync(order => order.TransactionId.Equals(id));
        }
    }
}

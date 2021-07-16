using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Shared;

namespace FundTransfer.Domain.Repositories.Queries
{
    public interface ITransferOrderQueryRepository : IQueryRepository<TransferOrder>
    {
        TransferOrder GetByAccountNumber(string number);
    }
}
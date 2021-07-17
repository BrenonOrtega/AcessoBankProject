using System.Threading.Tasks;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Shared;

namespace FundTransfer.Domain.Repositories.Queries
{
    public interface ITransferOrderQueryRepository : IQueryRepository<TransferOrder>
    {
        Task<TransferOrder> GetByAccountNumber(string number);
    }
}
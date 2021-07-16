using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Shared;

namespace FundTransfer.Domain.Repositories.Commands
{
    public interface ITransferOrderCommandRepository : ICommandRepository<TransferOrder>
    {
         
    }
}

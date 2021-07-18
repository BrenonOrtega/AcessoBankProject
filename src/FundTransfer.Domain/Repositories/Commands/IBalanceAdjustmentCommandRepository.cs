using System.Threading.Tasks;
using FundTransfer.Domain.Models;

namespace FundTransfer.Domain.Repositories.Commands
{
    public interface IBalanceAdjustmentCommandRepository
    {
        Task PostAdjustment(BalanceAdjustment adjustment);

        Task PostDebitAdjustment(string accountNumber, decimal Value);

        Task PostCreditAdjustment(string accountNumber, decimal Value);
    }
}
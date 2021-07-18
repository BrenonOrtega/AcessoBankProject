using System.Threading.Tasks;
using FundTransfer.Domain.Models;

namespace FundTransfer.Domain.Services
{
    public interface IBalanceAdjustmentService
    {
        Task PostAdjustmentAsync(BalanceAdjustment adjustment);
    }
}
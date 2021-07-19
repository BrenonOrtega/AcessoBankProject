using System.Threading.Tasks;

namespace FundTransfer.Domain.Services
{
    public interface IAccountService<T>
    {
        Task<T> GetAccounts();

        Task<T> GetByAccountNumber(string accountNumber);
    }
}
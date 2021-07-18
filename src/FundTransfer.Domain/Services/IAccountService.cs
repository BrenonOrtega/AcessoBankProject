using System.Collections.Generic;
using System.Threading.Tasks;
using FundTransfer.Domain.Models;

namespace FundTransfer.Domain.Services
{
    public interface IAccountService
    {
        Task<IEnumerable<Account>> GetAccounts();
        
        Task<Account> GetByAccountNumber(string accountNumber);
    }
}
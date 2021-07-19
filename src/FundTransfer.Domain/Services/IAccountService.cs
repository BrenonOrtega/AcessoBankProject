using System.Collections.Generic;
using System.Threading.Tasks;
using FundTransfer.Domain.Models;

namespace FundTransfer.Domain.Services
{
    public interface IAccountService<T>
    {
        Task<T> GetAccounts();
        
        Task<T> GetByAccountNumber(string accountNumber);
    }
}
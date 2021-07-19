using System.Threading.Tasks;
using System.Collections.Generic;
using FundTransfer.Domain.Models;

namespace FundTransfer.Domain.Repositories.Queries
{
    public interface IAccountQueryRepository
    {
        Task<IEnumerable<Account>> GetAll();

        Task<Account> GetByAccountNumber(string accountNumber);

    }
}
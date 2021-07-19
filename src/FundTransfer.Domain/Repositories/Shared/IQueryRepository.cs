using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundTransfer.Domain.Repositories.Shared
{
    public interface IQueryRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAll();

        Task<T> GetById<V>(V id);

    }
}
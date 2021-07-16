using System.Collections.Generic;

namespace FundTransfer.Domain.Repositories.Shared
{
    public interface IQueryRepository<T> where T : class
    {
        IEnumerable<T> GetAll();
        T GetById<V>(V id);

    }
}
using System.Threading.Tasks;

namespace FundTransfer.Domain.Repositories.Shared
{
    public interface ICommandRepository<T> where T : class
    {
        Task<bool> Create(T model);

        Task<bool> Update<VKey>(VKey id, T model);

    }
}
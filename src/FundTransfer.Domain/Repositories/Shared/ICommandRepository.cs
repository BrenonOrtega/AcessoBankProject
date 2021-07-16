namespace FundTransfer.Domain.Repositories.Shared
{
    public interface ICommandRepository<T> where T : class
    {
        bool Create(T model);
        bool Update(int Id, T model);

    }
}
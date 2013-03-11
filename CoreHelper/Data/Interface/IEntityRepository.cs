using System;
using System.Linq;
namespace CoreHelper.Data.Interface
{
    public interface IEntityRepository<T>
        where T : class, new()
    {
        void Commit();
        void Remove(T entity);
  
        IQueryable<T> GetAll();
        T Add(T entity);
        T Attach(T entity);
    }
}
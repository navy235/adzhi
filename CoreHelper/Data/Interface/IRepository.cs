using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using CoreHelper.Data.Specification;
namespace CoreHelper.Data.Interface
{
    public interface IRepository<TEntity> where TEntity : class
    {
        IEnumerable<TEntity> GetList(Expression<Func<TEntity, bool>> expression);
        IEnumerable<TEntity> GetList<S>(ISpecification<TEntity> spec, Expression<Func<TEntity, S>> orderBy, bool descending);
        IEnumerable<TEntity> GetPagedList<S>(ISpecification<TEntity> spec, int pageIndex, int pageSize, Expression<Func<TEntity, S>> orderBy, bool descending);
        TEntity GetSingle(ISpecification<TEntity> spec);
        TEntity GetSingle(Expression<Func<TEntity, bool>> expression);

        IQueryable<TEntity> Entities { get; }

        IUnitOfWork UnitOfWork { get; }
    }
}

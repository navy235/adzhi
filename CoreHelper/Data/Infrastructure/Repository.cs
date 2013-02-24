using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using CoreHelper.Data.Interface;
using CoreHelper.Data.Specification;

namespace CoreHelper.Data.Infrastructure
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        private IUnitOfWork _unitOfWork;

        private Repository()
        {
        }

        public Repository(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public IEnumerable<TEntity> GetList(Expression<Func<TEntity, bool>> expression)
        {
            return this.Entities.Where<TEntity>(expression).AsEnumerable<TEntity>();
        }

        public IEnumerable<TEntity> GetList<S>(ISpecification<TEntity> spec, Expression<Func<TEntity, S>> orderBy, bool descending)
        {
            IQueryable<TEntity> source = this.Entities.Where<TEntity>(spec.SatisfiedBy());
            source = descending ? source.OrderByDescending<TEntity, S>(orderBy) : source.OrderBy<TEntity, S>(orderBy);
            return source.AsEnumerable<TEntity>();
        }

        public IEnumerable<TEntity> GetPagedList<S>(ISpecification<TEntity> spec, int pageIndex, int pageSize, Expression<Func<TEntity, S>> orderBy, bool descending)
        {
            IQueryable<TEntity> source = this.Entities.Where<TEntity>(spec.SatisfiedBy());
            source = descending ? source.OrderByDescending<TEntity, S>(orderBy) : source.OrderBy<TEntity, S>(orderBy);
            return source.Skip<TEntity>(((pageIndex - 1) * pageSize)).Take<TEntity>(pageSize).AsEnumerable<TEntity>();
        }

        public TEntity GetSingle(ISpecification<TEntity> spec)
        {
            return this.Entities.Where<TEntity>(spec.SatisfiedBy()).FirstOrDefault<TEntity>();
        }

        public TEntity GetSingle(Expression<Func<TEntity, bool>> expression)
        {
            return this.Entities.Where<TEntity>(expression).FirstOrDefault<TEntity>();
        }

        public IQueryable<TEntity> Entities
        {
            get
            {
                return this._unitOfWork.Set<TEntity>();
            }
        }

        public IUnitOfWork UnitOfWork
        {
            get
            {
                return this._unitOfWork;
            }
        }
    }
}

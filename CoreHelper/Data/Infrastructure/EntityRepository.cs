using System;
using System.Data.Entity;
using System.Linq;
using CoreHelper.Data.Interface;
namespace CoreHelper.Data.Infrastructure
{
    public class EntityRepository<T> : IEntityRepository<T>
        where T : class,  new()
    {
        private readonly IUnitOfWork _entities;

        public EntityRepository(IUnitOfWork entities)
        {
            _entities = entities;
        }

        public void Commit()
        {
            _entities.Commit();
        }

        public void Remove(T entity)
        {
            _entities.Set<T>().Remove(entity);
        }


        public T Add(T entity)
        {
            _entities.Set<T>().Add(entity);

            return entity;
        }

        public T Attach(T entity)
        {
            return _entities.Set<T>().Attach(entity);
        }


        public IQueryable<T> GetAll()
        {
            return _entities.Set<T>();
        }
    }
}
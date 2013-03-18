using System;
using System.Data.Entity;
using System.Linq;
using CoreHelper.Data.Interface;

namespace CoreHelper.Data.Infrastructure
{

    public class BaseEfUnitOfWork : DbContext, IUnitOfWork, IDisposable
    {
        public BaseEfUnitOfWork(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {
        }

        TEntity IUnitOfWork.Add<TEntity>(TEntity entity)
        {
            return base.Set<TEntity>().Add(entity);
        }

        TEntity IUnitOfWork.Attach<TEntity>(TEntity entity)
        {
            return base.Set<TEntity>().Attach(entity);
        }

        void IUnitOfWork.Commit()
        {
            base.SaveChanges();
        }

        void IUnitOfWork.SetProxyCreationEnabledFlase()
        {
            base.Configuration.ProxyCreationEnabled = false;
        }

        TEntity IUnitOfWork.Remove<TEntity>(TEntity entity)
        {
            return base.Set<TEntity>().Remove(entity);
        }


        public new IQueryable<TEntity> Set<TEntity>() where TEntity : class
        {
            return base.Set<TEntity>();
        }


        void IDisposable.Dispose()
        {
            base.Dispose();
        }

        public int ExecuteSqlCommand(string sql, params object[] parameters)
        {
            return base.Database.ExecuteSqlCommand(sql, parameters);
        }
    }

}
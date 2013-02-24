using System;
using System.Linq;
using System.Linq.Expressions;

namespace CoreHelper.Data.Specification
{
    public abstract class Specification<TEntity> : ISpecification<TEntity> where TEntity : class
    {
        protected Specification()
        {
        }

        public static Specification<TEntity> operator &(Specification<TEntity> leftSideSpec, Specification<TEntity> rightSideSpec)
        {
            return new AndSpecification<TEntity>(leftSideSpec, rightSideSpec);
        }

        public static Specification<TEntity> operator |(Specification<TEntity> leftSideSpec, Specification<TEntity> rightSideSpec)
        {
            return new OrSpecification<TEntity>(leftSideSpec, rightSideSpec);
        }

        public static bool operator false(Specification<TEntity> specification)
        {
            return false;
        }

        public static Specification<TEntity> op_LogicalNot(Specification<TEntity> specification)
        {
            return new NotSpecification<TEntity>(specification);
        }

        public static bool operator true(Specification<TEntity> specification)
        {
            return true;
        }

        public abstract Expression<Func<TEntity, bool>> SatisfiedBy();
    }
}

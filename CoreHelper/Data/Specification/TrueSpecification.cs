using System;
using System.Linq.Expressions;

namespace CoreHelper.Data.Specification
{
    public sealed class TrueSpecification<TEntity> : Specification<TEntity> where TEntity : class
    {
        public override Expression<Func<TEntity, bool>> SatisfiedBy()
        {
            ParameterExpression expression2;
            bool result = true;
            return Expression.Lambda<Func<TEntity, bool>>(Expression.Constant(result), new ParameterExpression[] { expression2 = Expression.Parameter(typeof(TEntity), "t") });
        }
    }
}

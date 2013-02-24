using System;
using System.Linq;
using System.Linq.Expressions;

namespace CoreHelper.Data.Specification
{

    public sealed class NotSpecification<TEntity> : Specification<TEntity> where TEntity : class
    {
        private Expression<Func<TEntity, bool>> _OriginalCriteria;

        public NotSpecification(ISpecification<TEntity> originalSpecification)
        {
            if (originalSpecification == null)
            {
                throw new ArgumentNullException("originalSpecification");
            }
            this._OriginalCriteria = originalSpecification.SatisfiedBy();
        }

        public NotSpecification(Expression<Func<TEntity, bool>> originalSpecification)
        {
            if (originalSpecification == null)
            {
                throw new ArgumentNullException("originalSpecification");
            }
            this._OriginalCriteria = originalSpecification;
        }

        public override Expression<Func<TEntity, bool>> SatisfiedBy()
        {
            return Expression.Lambda<Func<TEntity, bool>>(Expression.Not(this._OriginalCriteria.Body), new ParameterExpression[] { this._OriginalCriteria.Parameters.Single<ParameterExpression>() });
        }
    }
}

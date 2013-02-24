using System;
using System.Linq;
using System.Linq.Expressions;


namespace CoreHelper.Data.Specification
{
    public sealed class DirectSpecification<TEntity> : Specification<TEntity> where TEntity : class
    {
        private Expression<Func<TEntity, bool>> _MatchingCriteria;

        public DirectSpecification(Expression<Func<TEntity, bool>> matchingCriteria)
        {
            if (matchingCriteria == null)
            {
                throw new ArgumentNullException("matchingCriteria");
            }
            this._MatchingCriteria = matchingCriteria;
        }

        public override Expression<Func<TEntity, bool>> SatisfiedBy()
        {
            return this._MatchingCriteria;
        }
    }
}

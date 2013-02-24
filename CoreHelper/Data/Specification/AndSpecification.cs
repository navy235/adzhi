using System;
using System.Linq.Expressions;
namespace CoreHelper.Data.Specification
{
    public class AndSpecification<TEntity> : CompositeSpecification<TEntity> where TEntity : class
    {
        private ISpecification<TEntity> _LeftSideSpecification;
        private ISpecification<TEntity> _RightSideSpecification;

        public AndSpecification(ISpecification<TEntity> leftSideSpec, ISpecification<TEntity> rightSideSpec)
        {
            if (leftSideSpec == null)
            {
                throw new ArgumentNullException("leftSideSpec");
            }
            if (rightSideSpec == null)
            {
                throw new ArgumentNullException("rightSideSpec");
            }
            this._LeftSideSpecification = leftSideSpec;
            this._RightSideSpecification = rightSideSpec;
        }

        public override Expression<Func<TEntity, bool>> SatisfiedBy()
        {
            return this._LeftSideSpecification.SatisfiedBy().And<TEntity>(this._RightSideSpecification.SatisfiedBy());
        }

        public override ISpecification<TEntity> LeftSideSpecification
        {
            get
            {
                return this._LeftSideSpecification;
            }
        }

        public override ISpecification<TEntity> RightSideSpecification
        {
            get
            {
                return this._RightSideSpecification;
            }
        }
    }
}

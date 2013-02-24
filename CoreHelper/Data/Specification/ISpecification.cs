using System;
using System.Linq.Expressions;
namespace CoreHelper.Data.Specification
{
    public interface ISpecification<TEnitity> where TEnitity : class
    {
        Expression<Func<TEnitity, bool>> SatisfiedBy();
    }
}

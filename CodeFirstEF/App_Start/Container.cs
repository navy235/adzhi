using System;
using Ninject;

namespace CodeFirstEF.App_Start
{
    public static class Container
    {
        private static readonly Lazy<IKernel> LazyKernel = new Lazy<IKernel>(() => new StandardKernel(new NinjectBinding()));

        public static IKernel Kernel
        {
            get { return LazyKernel.Value; }
        }
    }
}
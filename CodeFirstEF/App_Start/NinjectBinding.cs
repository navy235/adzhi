using System;
using Ninject;
using Ninject.Web.Common;
using CoreHelper.Data.Interface;
using CodeFirstEF.Concrete;

namespace CodeFirstEF.App_Start
{
    public class NinjectBinding
    {

        public static void Binding(IKernel kernel)
        {
            kernel.Bind<IUnitOfWork>().To<CodeFirstContext>();
        }
    }
}
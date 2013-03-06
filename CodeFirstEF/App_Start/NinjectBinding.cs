using System;
using Ninject;
using Ninject.Web.Common;
using CoreHelper.Data.Interface;
using CodeFirstEF.Concrete;
using CodeFirstEF.Serivces;
namespace CodeFirstEF.App_Start
{
    public class NinjectBinding
    {

        public static void Binding(IKernel kernel)
        {
            kernel.Bind<IUnitOfWork>().To<CodeFirstContext>();

            kernel.Bind<IMemberService>().To<MemberService>();
            kernel.Bind<IMember_ActionService>().To<Member_ActionService>();
            kernel.Bind<IAreaAttService>().To<AreaAttService>();

            kernel.Bind<IEmailService>().To<EmailService>();


        }
    }
}
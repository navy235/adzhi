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
            //kernel.Bind<IUnitOfWork>().To<CodeFirstContext>();
            kernel.Bind<IUnitOfWork>()
                .To<CodeFirstContext>()
                .InRequestScope();

            kernel.Bind<IMemberService>()
                .To<MemberService>()
                .InRequestScope();
            kernel.Bind<IMember_ActionService>()
                .To<Member_ActionService>()
                .InRequestScope();
            kernel.Bind<IAreaAttService>()
                .To<AreaAttService>()
                .InRequestScope();
            kernel.Bind<IOutDoorService>()
                .To<OutDoorService>()
                .InRequestScope();
            kernel.Bind<IOwnerCateService>()
                .To<OwnerCateService>()
                .InRequestScope();
            kernel.Bind<IEmailService>()
                .To<EmailService>()
                .InRequestScope();


        }
    }
}
using System;
using System.Web;
using System.Web.Mvc;
using Ninject;
using Ninject.Web.Common;
using CoreHelper.Data.Interface;
using CodeFirstEF.Filters;
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



            kernel.Bind<IDepartmentService>()
                .To<DepartmentService>()
                .InRequestScope();
            kernel.Bind<IPermissionService>()
                .To<PermissionService>()
                .InRequestScope();
            kernel.Bind<IRoleService>()
                .To<RoleService>()
                .InRequestScope();
            kernel.Bind<IGroupService>()
                .To<Groupervice>()
                .InRequestScope();



            kernel.Bind<IOwnerCateService>()
                .To<OwnerCateService>()
                .InRequestScope();
            kernel.Bind<IAreaService>()
                .To<AreaService>()
                .InRequestScope();
            kernel.Bind<ICompanyBussinessService>()
                .To<CompanyBussinessService>()
                .InRequestScope();
            kernel.Bind<ICompanyFundService>()
                .To<CompanyFundService>()
                .InRequestScope();
            kernel.Bind<ICompanyScaleService>()
                .To<CompanyScaleService>()
                .InRequestScope();
            kernel.Bind<IFormatCateService>()
                .To<FormatCateService>()
                .InRequestScope();
            kernel.Bind<IPeriodCateService>()
                .To<PeriodCateService>()
                .InRequestScope();
            kernel.Bind<IOutDoorMediaCateService>()
                .To<OutDoorMediaCateService>()
                .InRequestScope();
            //kernel.Bind<IOwnerService>()
            //    .To<OwnerService>()
            //    .InRequestScope();


            kernel.Bind<IEmailService>()
                .To<EmailService>()
                .InRequestScope();


        }
    }
}
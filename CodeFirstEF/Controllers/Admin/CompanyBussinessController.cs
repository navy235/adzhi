using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.Serivces;
using CodeFirstEF.Utils;
using CodeFirstEF.Filters;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    [Permission]
    public class CompanyBussinessController : Controller
    {
        //
        // GET: /CompanyBussiness/
        private ICompanyBussinessService CompanyBussinessService;
        public CompanyBussinessController(
             ICompanyBussinessService _CompanyBussinessService
          )
        {
            CompanyBussinessService = _CompanyBussinessService;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {
            ViewBag.PCateCode = Utilities.CreateSelectList(
                CompanyBussinessService.GetALL()
                .Where(x => x.PCateCode.Equals(null)).ToList()
                , item => item.CateCode
                , item => item.CateName, true);
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {

            var CompanyBussinesss = CompanyBussinessService.GetKendoALL().OrderBy(x => x.CateCode).ToList();
            return Json(CompanyBussinesss.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyBussiness> CompanyBussinesss)
        {
            var results = new List<CompanyBussiness>();

            if (CompanyBussinesss != null && ModelState.IsValid)
            {
                foreach (var CompanyBussiness in CompanyBussinesss)
                {
                    CompanyBussinessService.Create(CompanyBussiness);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyBussiness> CompanyBussinesss)
        {
            if (CompanyBussinesss != null && ModelState.IsValid)
            {
                foreach (var CompanyBussiness in CompanyBussinesss)
                {
                    CompanyBussinessService.Update(CompanyBussiness);
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyBussiness> CompanyBussinesss)
        {
            if (CompanyBussinesss.Any())
            {
                foreach (var CompanyBussiness in CompanyBussinesss)
                {
                    CompanyBussinessService.Delete(CompanyBussiness);
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


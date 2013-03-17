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
    public class CompanyScaleController : Controller
    {
        //
        // GET: /CompanyScale/
        private ICompanyScaleService CompanyScaleService;
        public CompanyScaleController(
             ICompanyScaleService _CompanyScaleService
          )
        {
            CompanyScaleService = _CompanyScaleService;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {
            ViewBag.PCateCode = Utilities.CreateSelectList(
                CompanyScaleService.GetALL()
                .Where(x => x.PCateCode.Equals(null)).ToList()
                , item => item.CateCode
                , item => item.CateName, true);
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {

            var CompanyScales = CompanyScaleService.GetKendoALL().OrderBy(x => x.CateCode).ToList();
            return Json(CompanyScales.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyScale> CompanyScales)
        {
            var results = new List<CompanyScale>();

            if (CompanyScales != null && ModelState.IsValid)
            {
                foreach (var CompanyScale in CompanyScales)
                {
                    CompanyScaleService.Create(CompanyScale);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyScale> CompanyScales)
        {
            if (CompanyScales != null && ModelState.IsValid)
            {
                foreach (var CompanyScale in CompanyScales)
                {
                    CompanyScaleService.Update(CompanyScale);
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyScale> CompanyScales)
        {
            if (CompanyScales.Any())
            {
                foreach (var CompanyScale in CompanyScales)
                {
                    CompanyScaleService.Delete(CompanyScale);
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


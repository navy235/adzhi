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
    public class PeriodCateController : Controller
    {
        //
        // GET: /PeriodCate/
        private IPeriodCateService PeriodCateService;
        public PeriodCateController(
             IPeriodCateService _PeriodCateService
          )
        {
            PeriodCateService = _PeriodCateService;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {
            ViewBag.PCateCode = Utilities.CreateSelectList(
                PeriodCateService.GetALL()
                .Where(x => x.PCateCode.Equals(null)).ToList()
                , item => item.CateCode
                , item => item.CateName, true);
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {

            var PeriodCates = PeriodCateService.GetKendoALL().OrderBy(x => x.CateCode).ToList();
            return Json(PeriodCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<PeriodCate> PeriodCates)
        {
            var results = new List<PeriodCate>();

            if (PeriodCates != null && ModelState.IsValid)
            {
                foreach (var PeriodCate in PeriodCates)
                {
                    PeriodCateService.Create(PeriodCate);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<PeriodCate> PeriodCates)
        {
            if (PeriodCates != null && ModelState.IsValid)
            {
                foreach (var PeriodCate in PeriodCates)
                {
                    PeriodCateService.Update(PeriodCate);
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<PeriodCate> PeriodCates)
        {
            if (PeriodCates.Any())
            {
                foreach (var PeriodCate in PeriodCates)
                {
                    PeriodCateService.Delete(PeriodCate);
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


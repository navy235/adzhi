using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Models;
using CodeFirstEF.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    public class PeriodCateController : Controller
    {
        //
        // GET: /PeriodCate/
        private IUnitOfWork DB_Service;

        public PeriodCateController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> PeriodCatesList = new List<SelectListItem>();
            PeriodCatesList = DB_Service.Set<PeriodCate>().Where(x => x.PCateCode == "").ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            PeriodCatesList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_PeriodCate.PeriodCates.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(PeriodCatesList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var PeriodCates = DB_Service.Set<PeriodCate>().OrderBy(x => x.CateCode).ToList();
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
                    PeriodCate.PCateCode = PeriodCate.PCateCode;
                    DB_Service.Add<PeriodCate>(PeriodCate);
                    DB_Service.Commit();
                    results.Add(PeriodCate);
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
                    var target = DB_Service.Set<PeriodCate>().Single(x => x.ID == PeriodCate.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<PeriodCate>(target);
                        target.CateCode = PeriodCate.CateCode;
                        target.CateName = PeriodCate.CateName;
                        target.PCateCode = PeriodCate.PCateCode;
                        DB_Service.Commit();
                    }
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
                    var target = DB_Service.Set<PeriodCate>().Single(x => x.ID == PeriodCate.ID);
                    DB_Service.Remove<PeriodCate>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


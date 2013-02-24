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
using System.Web.Script.Serialization;

namespace CodeFirstEF.Controllers
{
    public class CompanyScaleController : Controller
    {
        //
        // GET: /CompanyScale/
        private IUnitOfWork DB_Service;

        public CompanyScaleController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> CompanyScalesList = new List<SelectListItem>();
            CompanyScalesList = DB_Service.Set<CompanyScale>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            CompanyScalesList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_CompanyScale.CompanyScales.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(CompanyScalesList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var FormatCates = DB_Service.Set<CompanyScale>().OrderBy(x => x.CateCode).ToList();
            return Json(FormatCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyScale> CompanyScales)
        {
            var results = new List<CompanyScale>();

            if (CompanyScales != null && ModelState.IsValid)
            {
                foreach (var CompanyScale in CompanyScales)
                {
                    CompanyScale.PCateCode = CompanyScale.PCateCode;
                    DB_Service.Add<CompanyScale>(CompanyScale);
                    DB_Service.Commit();
                    results.Add(CompanyScale);
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
                    var target = DB_Service.Set<CompanyScale>().Single(x => x.ID == CompanyScale.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<CompanyScale>(target);
                        target.CateCode = CompanyScale.CateCode;
                        target.CateName = CompanyScale.CateName;
                        target.PCateCode = CompanyScale.PCateCode;
                        DB_Service.Commit();
                    }
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
                    var target = DB_Service.Set<CompanyScale>().Single(x => x.ID == CompanyScale.ID);
                    DB_Service.Remove<CompanyScale>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


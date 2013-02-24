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
    public class CompanyBussinessController : Controller
    {
        //
        // GET: /CompanyBussiness/
        private IUnitOfWork DB_Service;

        public CompanyBussinessController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> CompanyBussinesssList = new List<SelectListItem>();
            CompanyBussinesssList = DB_Service.Set<CompanyBussiness>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            CompanyBussinesssList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_CompanyBussiness.CompanyBussinesss.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(CompanyBussinesssList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var FormatCates = DB_Service.Set<CompanyBussiness>().OrderBy(x => x.CateCode).ToList();
            return Json(FormatCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyBussiness> CompanyBussinesss)
        {
            var results = new List<CompanyBussiness>();

            if (CompanyBussinesss != null && ModelState.IsValid)
            {
                foreach (var CompanyBussiness in CompanyBussinesss)
                {
                    CompanyBussiness.PCateCode = CompanyBussiness.PCateCode;
                    DB_Service.Add<CompanyBussiness>(CompanyBussiness);
                    DB_Service.Commit();
                    results.Add(CompanyBussiness);
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
                    var target = DB_Service.Set<CompanyBussiness>().Single(x => x.ID == CompanyBussiness.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<CompanyBussiness>(target);
                        target.CateCode = CompanyBussiness.CateCode;
                        target.CateName = CompanyBussiness.CateName;
                        target.PCateCode = CompanyBussiness.PCateCode;
                        DB_Service.Commit();
                    }
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
                    var target = DB_Service.Set<CompanyBussiness>().Single(x => x.ID == CompanyBussiness.ID);
                    DB_Service.Remove<CompanyBussiness>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


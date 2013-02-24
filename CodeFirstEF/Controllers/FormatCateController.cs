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
    public class FormatCateController : Controller
    {
        //
        // GET: /FormatCate/
        private IUnitOfWork DB_Service;

        public FormatCateController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> FormatCatesList = new List<SelectListItem>();
            FormatCatesList = DB_Service.Set<FormatCate>().Where(x => x.PCateCode == "").ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            FormatCatesList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_FormatCate.FormatCates.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(FormatCatesList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var FormatCates = DB_Service.Set<FormatCate>().OrderBy(x => x.CateCode).ToList();
            return Json(FormatCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<FormatCate> FormatCates)
        {
            var results = new List<FormatCate>();

            if (FormatCates != null && ModelState.IsValid)
            {
                foreach (var FormatCate in FormatCates)
                {
                    FormatCate.PCateCode = FormatCate.PCateCode;
                    DB_Service.Add<FormatCate>(FormatCate);
                    DB_Service.Commit();
                    results.Add(FormatCate);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<FormatCate> FormatCates)
        {
            if (FormatCates != null && ModelState.IsValid)
            {
                foreach (var FormatCate in FormatCates)
                {
                    var target = DB_Service.Set<FormatCate>().Single(x => x.ID == FormatCate.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<FormatCate>(target);
                        target.CateCode = FormatCate.CateCode;
                        target.CateName = FormatCate.CateName;
                        target.PCateCode = FormatCate.PCateCode;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<FormatCate> FormatCates)
        {
            if (FormatCates.Any())
            {
                foreach (var FormatCate in FormatCates)
                {
                    var target = DB_Service.Set<FormatCate>().Single(x => x.ID == FormatCate.ID);
                    DB_Service.Remove<FormatCate>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


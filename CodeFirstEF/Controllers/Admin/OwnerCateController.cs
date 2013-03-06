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
    public class OwnerCateController : Controller
    {
        //
        // GET: /OwnerCate/
        private IUnitOfWork DB_Service;

        public OwnerCateController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> OwnerCatesList = new List<SelectListItem>();
            OwnerCatesList = DB_Service.Set<OwnerCate>().Where(x => x.PCateCode == "").ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            OwnerCatesList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_OwnerCate.OwnerCates.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(OwnerCatesList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var OwnerCates = DB_Service.Set<OwnerCate>().OrderBy(x => x.CateCode).ToList();
            return Json(OwnerCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OwnerCate> OwnerCates)
        {
            var results = new List<OwnerCate>();

            if (OwnerCates != null && ModelState.IsValid)
            {
                foreach (var OwnerCate in OwnerCates)
                {
                    OwnerCate.PCateCode = OwnerCate.PCateCode ;
                    DB_Service.Add<OwnerCate>(OwnerCate);
                    DB_Service.Commit();
                    results.Add(OwnerCate);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OwnerCate> OwnerCates)
        {
            if (OwnerCates != null && ModelState.IsValid)
            {
                foreach (var OwnerCate in OwnerCates)
                {
                    var target = DB_Service.Set<OwnerCate>().Single(x => x.ID == OwnerCate.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<OwnerCate>(target);
                        target.CateCode = OwnerCate.CateCode;
                        target.CateName = OwnerCate.CateName;
                        target.PCateCode = OwnerCate.PCateCode ;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OwnerCate> OwnerCates)
        {
            if (OwnerCates.Any())
            {
                foreach (var OwnerCate in OwnerCates)
                {
                    var target = DB_Service.Set<OwnerCate>().Single(x => x.ID == OwnerCate.ID);
                    DB_Service.Remove<OwnerCate>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


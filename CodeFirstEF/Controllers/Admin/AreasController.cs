using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Models;
using CodeFirstEF.Filters;
using CodeFirstEF.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    [Permission]
    public class AreasController : Controller
    {
        //
        // GET: /Area/
        private IUnitOfWork DB_Service;

        public AreasController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> AreasList = new List<SelectListItem>();
            AreasList = DB_Service.Set<Area>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "省或直辖市"
            };
            AreasList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_Area.Areas.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(AreasList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var Areas = DB_Service.Set<Area>().OrderBy(x => x.CateCode).ToList();
            return Json(Areas.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Area> areas)
        {
            var results = new List<Area>();

            if (areas != null && ModelState.IsValid)
            {
                foreach (var area in areas)
                {
                    area.PCateCode = area.PCateCode;
                    DB_Service.Add<Area>(area);
                    DB_Service.Commit();
                    results.Add(area);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Area> areas)
        {
            if (areas != null && ModelState.IsValid)
            {
                foreach (var area in areas)
                {
                    var target = DB_Service.Set<Area>().Single(x => x.ID == area.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<Area>(target);
                        target.CateCode = area.CateCode;
                        target.CateName = area.CateName;
                        target.PCateCode = area.PCateCode;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Area> areas)
        {
            if (areas.Any())
            {
                foreach (var area in areas)
                {
                    var target = DB_Service.Set<Area>().Single(x => x.ID == area.ID);
                    DB_Service.Remove<Area>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


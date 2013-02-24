using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using UserProject.Models;
using UserProject.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace UserProject.Controllers
{
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
            AreasList = DB_Service.Set<Area>().Where(x => x.PCityCode == "" || x.PCityCode == null).ToList().Select(x => new SelectListItem()
            {
                Value = x.CityCode,
                Text = x.CityName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "省或直辖市"
            };
            AreasList.Insert(0, nullItem);

            //ViewBag.PCityCode = new SelectList(DB_Area.Areas.Where(x => x.PCityCode == ""), "CityCode", "CityName");

            ViewBag.PCityCode = new SelectList(AreasList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var Areas = DB_Service.Set<Area>();
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
                        target.CityCode = area.CityCode;
                        target.CityName = area.CityName;
                        target.PCityCode = area.PCityCode;
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


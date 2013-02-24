using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    public class AreaAttController : Controller
    {
        //
        // GET: /areaatt/

        private IUnitOfWork DB_Service;

        public AreaAttController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var AreaAtt = DB_Service.Set<AreaAtt>();
            return Json(AreaAtt.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<AreaAtt> AreaAtt)
        {
            var results = new List<AreaAtt>();

            if (AreaAtt != null && ModelState.IsValid)
            {
                foreach (var areaatt in AreaAtt)
                {
                    DB_Service.Add<AreaAtt>(areaatt);
                    DB_Service.Commit();
                    results.Add(areaatt);
                }
            }

            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<AreaAtt> AreaAtt)
        {
            if (AreaAtt != null && ModelState.IsValid)
            {
                foreach (var areaatt in AreaAtt)
                {
                    var target = DB_Service.Set<AreaAtt>().Single(x => x.ID == areaatt.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<AreaAtt>(target);
                        target.AttName = areaatt.AttName;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<AreaAtt> AreaAtt)
        {
            if (AreaAtt.Any())
            {
                foreach (var areaatt in AreaAtt)
                {
                    var target = DB_Service.Set<AreaAtt>().Single(x => x.ID == areaatt.ID);
                    DB_Service.Remove<AreaAtt>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

    }
}

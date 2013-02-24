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
    public class PermissionController : Controller
    {
        //
        // GET: /Permission/

        private IUnitOfWork DB_Service;

        public PermissionController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            List<SelectListItem> DepartmentList = new List<SelectListItem>();
            DepartmentList = DB_Service.Set<Department>().ToList().Select(x => new SelectListItem()
            {
                Value = x.DepartmentID.ToString(),
                Text = x.Name
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = "0",
                Text = "请选择部门"
            };
            DepartmentList.Insert(0, nullItem);

            ViewBag.DepartmentID = new SelectList(DepartmentList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var Permissions = DB_Service.Set<Permissions>();
            return Json(Permissions.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Permissions> permissions)
        {
            var results = new List<Permissions>();

            if (permissions != null && ModelState.IsValid)
            {
                foreach (var permission in permissions)
                {
                    DB_Service.Add<Permissions>(permission);
                    DB_Service.Commit();

                    results.Add(permission);
                }
            }

            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Permissions> permissions)
        {
            if (permissions != null && ModelState.IsValid)
            {
                foreach (var permission in permissions)
                {
                    var target = DB_Service.Set<Permissions>().Single(x => x.ID == permission.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<Permissions>(target);
                        target.Name = permission.Name;
                        target.Action = permission.Action;
                        target.Namespace = permission.Namespace;
                        target.Controller = permission.Controller;
                        target.Description = permission.Description;
                        target.DepartmentID = permission.DepartmentID;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Permissions> permissions)
        {
            if (permissions.Any())
            {
                foreach (var permission in permissions)
                {
                    var target = DB_Service.Set<Permissions>().Include(x => x.Roles).Single(x => x.ID == permission.ID);
                    DB_Service.Remove<Permissions>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

    }
}

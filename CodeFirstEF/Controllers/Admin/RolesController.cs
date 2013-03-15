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
    public class RolesController : Controller
    {
        //
        // GET: /role/
        private IUnitOfWork DB_Service;

        public RolesController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var roles = DB_Service.Set<Roles>();
            return Json(roles.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Roles> roles)
        {
            var results = new List<Roles>();

            if (roles != null && ModelState.IsValid)
            {
                foreach (var role in roles)
                {
                    DB_Service.Add<Roles>(role);
                    DB_Service.Commit();
                    results.Add(role);
                }
            }

            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Roles> roles)
        {
            if (roles != null && ModelState.IsValid)
            {
                foreach (var role in roles)
                {
                    var target = DB_Service.Set<Roles>().Single(x => x.ID == role.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<Roles>(target);
                        target.Name = role.Name;
                        target.Description = role.Description;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Roles> roles)
        {
            if (roles.Any())
            {
                foreach (var role in roles)
                {
                    var target = DB_Service.Set<Roles>()
                        .Include(x => x.Permissions)
                        .Include(x => x.Group).Single(x => x.ID == role.ID);
                    DB_Service.Remove<Roles>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }


        #endregion


        #region Create Edit

        public ActionResult Create()
        {
            var permissions = GetGroupForeignData();
            ViewBag.Data_Permissions = permissions;
            return View(new RoleModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(RoleModel model)
        {
            var permissions = GetGroupForeignData();
            ViewBag.Data_Permissions = permissions;
            if (ModelState.IsValid)
            {
                try
                {
                    Roles rls = new Roles();
                    rls.Name = model.Name;
                    rls.Description = model.Description;
                    var permissionsArray = model.Permissions.Split(',').Select(x => Convert.ToInt32(x)).ToList();
                    var PermissionList = DB_Service.Set<Permissions>().Where(x => permissionsArray.Contains(x.ID));
                    rls.Permissions.AddRange(PermissionList);
                    DB_Service.Add<Roles>(rls);
                    DB_Service.Commit();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    ViewBag.Message = ex.Message;
                    return View(model);
                }
            }
            else
            {
                return View(model);
            }


        }

        public ActionResult Edit(int id)
        {
            RoleModel rml = new RoleModel();
            Roles rs = new Roles();
            rs = DB_Service.Set<Roles>().Include(x => x.Permissions).Single(x => x.ID == id);
            rml.ID = rs.ID;
            rml.Name = rs.Name;
            rml.Description = rs.Description;
            List<int> PermissionsList = new List<int>();
            PermissionsList = rs.Permissions.Select(x => x.ID).ToList();
            var permissions = GetGroupForeignData(PermissionsList);
            ViewBag.Data_Permissions = permissions;
            return View(rml);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(RoleModel model)
        {
            var permissionsArray = model.Permissions.Split(',').Select(x => Convert.ToInt32(x)).ToList();
            var permissions = GetGroupForeignData(permissionsArray);
            ViewBag.Data_Permissions = permissions;
            if (ModelState.IsValid)
            {
                try
                {
                    Roles rls = DB_Service.Set<Roles>().Include(x => x.Permissions).Single(x => x.ID == model.ID);
                    DB_Service.Attach<Roles>(rls);
                    rls.Name = model.Name;
                    rls.Description = model.Description;
                    var PermissionList = DB_Service.Set<Permissions>().Where(x => permissionsArray.Contains(x.ID));
                    var currentPermissionArray = rls.Permissions.Select(x => x.ID).ToList();
                    foreach (Permissions ps in DB_Service.Set<Permissions>())
                    {
                        if (permissionsArray.Contains(ps.ID))
                        {
                            if (!currentPermissionArray.Contains(ps.ID))
                            {
                                rls.Permissions.Add(ps);
                            }
                        }
                        else
                        {
                            if (currentPermissionArray.Contains(ps.ID))
                            {
                                rls.Permissions.Remove(ps);
                            }
                        }
                    }

                    DB_Service.Commit();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    ViewBag.Message = ex.Message;
                    return View(model);
                }
            }
            else
            {
                return View(model);
            }

        }



        public Dictionary<string, List<SelectListItem>> GetGroupForeignData(List<int> selectIdList)
        {
            Dictionary<string, List<SelectListItem>> data = new Dictionary<string, List<SelectListItem>>();

            var parentList = DB_Service.Set<Department>().Include(x => x.Permissions);

            foreach (var p in parentList)
            {
                List<SelectListItem> clist = new List<SelectListItem>();
                clist = p.Permissions.Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.ID.ToString(),
                    Selected = selectIdList.Contains(x.ID)
                }).ToList();
                data.Add(p.Name, clist);
            }
            return data;
        }

        public Dictionary<string, List<SelectListItem>> GetGroupForeignData()
        {
            return GetGroupForeignData(new List<int>());
        }

        #endregion





    }
}


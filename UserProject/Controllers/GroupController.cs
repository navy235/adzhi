using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using UserProject.Concrete;
using UserProject.Models;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace UserProject.Controllers
{
    public class GroupController : Controller
    {
        //
        // GET: /Group/

        private IUnitOfWork DB_Service;

        public GroupController(IUnitOfWork _DB_Service)
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
            var groups = DB_Service.Set<Group>();
            return Json(groups.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Group> groups)
        {
            var results = new List<Group>();

            if (groups != null && ModelState.IsValid)
            {
                foreach (var group in groups)
                {
                    DB_Service.Add<Group>(group);
                    DB_Service.Commit();
                    results.Add(group);
                }
            }

            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Group> groups)
        {
            if (groups != null && ModelState.IsValid)
            {
                foreach (var group in groups)
                {
                    var target = DB_Service.Set<Group>().Single(x => x.GroupID == group.GroupID);
                    if (target != null)
                    {
                        DB_Service.Attach<Group>(target);
                        target.Name = group.Name;
                        target.Description = group.Description;
                        DB_Service.Commit();

                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Group> groups)
        {
            if (groups.Any())
            {
                foreach (var group in groups)
                {
                    var target = DB_Service.Set<Group>().Include(x => x.Roles).Single(x => x.GroupID == group.GroupID);
                    DB_Service.Remove<Group>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }


        #endregion



        #region Create Edit
        public ActionResult Create()
        {
            var roles = GetForeignData();
            ViewBag.Data_Roles = roles;
            return View(new GroupModel());
        }

        [HttpPost]
        public ActionResult Create(GroupModel model)
        {
            var roles = GetForeignData();
            ViewBag.Data_Roles = roles;

            if (ModelState.IsValid)
            {
                try
                {
                    Group gps = new Group();
                    gps.Name = model.Name;
                    gps.Description = model.Description;
                    var rolesArray = model.Roles.Split(',').Select(x => Convert.ToInt32(x));
                    var RoleList = DB_Service.Set<Roles>().Where(x => rolesArray.Contains(x.ID));
                    gps.Roles.AddRange(RoleList);
                    DB_Service.Add<Group>(gps);
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

            GroupModel gpm = new GroupModel();
            Group gps = new Group();
            gps = DB_Service.Set<Group>().Include(x => x.Roles).Single(x => x.GroupID == id);
            gpm.ID = gps.GroupID;
            gpm.Name = gps.Name;
            gpm.Description = gps.Description;
            List<int> RolesList = new List<int>();
            RolesList = gps.Roles.Select(x => x.ID).ToList();
            var roles = GetForeignData(RolesList);
            ViewBag.Data_RolesList = roles;
            return View(gpm);
        }

        [HttpPost]
        public ActionResult Edit(GroupModel model)
        {
            var rolesArray = model.Roles.Split(',').Select(x => Convert.ToInt32(x)).ToList();
            var roles = GetForeignData(rolesArray);
            ViewBag.Data_RolesList = roles;
            if (ModelState.IsValid)
            {
                try
                {
                    Group gps = DB_Service.Set<Group>().Include(x => x.Roles).Single(x => x.GroupID == model.ID);
                    DB_Service.Attach<Group>(gps);
                    gps.Name = model.Name;
                    gps.Description = model.Description;
                    var RoleList = DB_Service.Set<Roles>().Where(x => rolesArray.Contains(x.ID));
                    var currentroleArray = gps.Roles.Select(x => x.ID).ToList();
                    foreach (Roles rl in DB_Service.Set<Roles>())
                    {
                        if (rolesArray.Contains(rl.ID))
                        {
                            if (!currentroleArray.Contains(rl.ID))
                            {
                                gps.Roles.Add(rl);
                            }
                        }
                        else
                        {
                            if (currentroleArray.Contains(rl.ID))
                            {
                                gps.Roles.Remove(rl);
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

        public List<SelectListItem> GetForeignData(List<int> selectIdList)
        {
            List<SelectListItem> data = new List<SelectListItem>();
            data = DB_Service.Set<Roles>().ToList().Select(x => new SelectListItem
            {
                Text = x.Name,
                Value = x.ID.ToString(),
                Selected = selectIdList.Contains(x.ID)
            }).ToList();
            return data;
        }

        public List<SelectListItem> GetForeignData()
        {
            return GetForeignData(new List<int>());
        }

        #endregion
    }
}

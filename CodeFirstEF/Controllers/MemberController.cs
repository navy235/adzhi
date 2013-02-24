using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;


namespace CodeFirstEF.Controllers
{
    public class MemberController : Controller
    {
        //
        // GET: /Group/
        //
        // GET: /Permission/
        private IUnitOfWork DB_Service;

        public MemberController(IUnitOfWork _DB_Service)
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
            var members = DB_Service.Set<Member>();
            return Json(members.ToDataSourceResult(request));
        }

        #endregion


        #region KendoGrid Action
        public ActionResult Groups()
        {
            return View();
        }

        public ActionResult Editing_Group_Read([DataSourceRequest] DataSourceRequest request)
        {
            var members = DB_Service.Set<Member>();
            return Json(members.ToDataSourceResult(request));
        }

        #endregion


        //#region Create Edit
        public ActionResult Create()
        {
            var groups = GetForeignData();
            ViewBag.Data_GroupID = groups;
            return View(new DetailsModel());
        }

        [HttpPost]
        public ActionResult Create(DetailsModel model)
        {
            var groups = GetForeignData();
            ViewBag.Data_GroupID = groups;

            if (ModelState.IsValid)
            {
                try
                {
                    Member member = new Member();
                    member.Email = model.Email;
                    member.NickName = model.NickName;
                    member.GroupID = model.GroupID;
                    member.Password = CheckHelper.StrToMd5(model.Password);
                    member.Status = 1;//注册未激活，0为禁用
                    member.AddTime = DateTime.Now;
                    member.LastTime = DateTime.Now;
                    member.AddIP = HttpHelper.IP;
                    member.LastIP = HttpHelper.IP;
                    member.Member_Profile = new Member_Profile();
                    member.Member_Profile.AvtarUrl = model.AvtarUrl;
                    member.Member_Profile.Borthday = model.Borthday;
                    member.Member_Profile.CityCode = model.CityCode;
                    member.Member_Profile.Description = model.Description;
                    member.Member_Profile.Sex = model.Sex;
                    DB_Service.Add<Member>(member);
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

            EditModel model = new EditModel();
            Member member = DB_Service.Set<Member>().Include(x => x.Member_Profile).Single(x => x.MemberID == id);
            model.MemberID = member.MemberID;
            model.Email = member.Email;
            model.NickName = member.NickName;
            model.GroupID = member.GroupID;
            model.AvtarUrl = member.Member_Profile.AvtarUrl;
            model.CityCode = member.Member_Profile.CityCode;
            model.Sex = member.Member_Profile.Sex;
            model.Borthday = member.Member_Profile.Borthday;
            model.Description = member.Member_Profile.Description;
            List<int> GroupList = new List<int>();
            GroupList.Add(model.GroupID);
            ViewBag.Data_GroupID = GetForeignData(GroupList);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(EditModel model)
        {

            List<int> GroupList = new List<int>();
            GroupList.Add(model.GroupID);
            var groups = GetForeignData(GroupList);
            ViewBag.Data_GroupID = groups;
            if (ModelState.IsValid)
            {
                try
                {
                    Member member = DB_Service.Set<Member>().Include(x => x.Member_Profile).Single(x => x.MemberID == model.MemberID);
                    DB_Service.Attach<Member>(member);
                    member.GroupID = model.GroupID;
                    member.Member_Profile.AvtarUrl = model.AvtarUrl;
                    member.Member_Profile.CityCode = model.CityCode;
                    member.Member_Profile.Sex = model.Sex;
                    member.Member_Profile.Borthday = model.Borthday;
                    member.Member_Profile.Description = model.Description;
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
            data = DB_Service.Set<Group>().ToList().Select(x => new SelectListItem
            {
                Text = x.Name,
                Value = x.GroupID.ToString(),
                Selected = selectIdList.Contains(x.GroupID)
            }).ToList();
            return data;
        }

        public List<SelectListItem> GetForeignData()
        {
            return GetForeignData(new List<int>());
        }

        //#endregion

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CoreHelper.Enum;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Filters;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{

    [BaseAuthorize]
    public class PersonalController : Controller
    {
        private IUnitOfWork DB_Service;

        public PersonalController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = DB_Service.Set<Member>().Single(x => x.MemberID == memberID);
            return View(member);
        }

        public ActionResult BaseInfo()
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = DB_Service.Set<Member>()
                .Include(x => x.Member_Profile)
                .Single(x => x.MemberID == memberID);
            if (member.Member_Profile == null)
            {
                member.Member_Profile = new Member_Profile();
            }
            ProfileModel pm = new ProfileModel()
            {
                MemberID = member.MemberID,
                Borthday = member.Member_Profile.Borthday,
                Description = member.Member_Profile.Description,
                NickName = member.NickName,
                RealName = member.Member_Profile.RealName,
                CityCode = member.Member_Profile.CityCode,
                Sex = member.Member_Profile.Sex
            };
            return View(pm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult BaseInfo(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    Member member = DB_Service.Set<Member>()
                        .Include(x => x.Member_Profile)
                        .Single(x => x.MemberID == memberID);
                    DB_Service.Attach<Member>(member);
                    Member_Profile mp = new Member_Profile();
                    if (member.Member_Profile != null)
                    {
                        mp = member.Member_Profile;
                    }
                    mp.MemberID = model.MemberID;
                    mp.Borthday = model.Borthday;
                    mp.CityCode = model.CityCode;
                    mp.Description = model.Description;
                    member.NickName = model.NickName;
                    mp.RealName = model.RealName;
                    mp.Sex = model.Sex;
                    member.Member_Profile = mp;
                    DB_Service.Commit();
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
            }
            return View(model);
        }


        public ActionResult Avtar()
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = DB_Service.Set<Member>()
                .Include(x => x.Member_Profile)
                .Single(x => x.MemberID == memberID);
            AvtarModel pm = new AvtarModel()
            {
                MemberID = member.MemberID,
           
                AvtarUrl = member.Member_Profile != null ? member.Member_Profile.AvtarUrl : Url.Content("~/Content/avtar/avtar_default.jpg"),

            };
            return View(pm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Avtar(AvtarModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    Member member = DB_Service.Set<Member>()
                        .Include(x => x.Member_Profile)
                        .Single(x => x.MemberID == memberID);
                    DB_Service.Attach<Member>(member);
                    Member_Profile mp = new Member_Profile();
                    if (member.Member_Profile != null)
                    {
                        mp = member.Member_Profile;
                    }
                    mp.MemberID = member.MemberID;
                    mp.AvtarUrl = model.AvtarUrl;
                    member.Member_Profile = mp;
                    DB_Service.Commit();
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
            }
            return View(model);
        }


        public ActionResult Contact()
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = DB_Service.Set<Member>()
                .Include(x => x.Member_Profile)
                .Single(x => x.MemberID == memberID);
            if (member.Member_Profile == null)
            {
                member.Member_Profile = new Member_Profile();
            }

            ContactModel cm = new ContactModel()
            {
                MemberID = member.MemberID,
                Address = member.Member_Profile.Address,
            
                Email = member.Email,
                Mobile = member.Member_Profile.Mobile,
                Phone = member.Member_Profile.Phone,
                MSN = member.Member_Profile.MSN,
                Position = member.Member_Profile.Lat + "|" + member.Member_Profile.Lng,
                QQ = member.Member_Profile.QQ

            };
            return View(cm);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    Member member = DB_Service.Set<Member>()
                        .Include(x => x.Member_Profile)
                        .Single(x => x.MemberID == memberID);
                    DB_Service.Attach<Member>(member);
                    Member_Profile mp = new Member_Profile();
                    if (member.Member_Profile != null)
                    {
                        mp = member.Member_Profile;
                    }
                    mp.MemberID = member.MemberID;
                    mp.Address = model.Address;
                    mp.Phone = model.Phone;
                    mp.Mobile = model.Mobile;
                    mp.MSN = model.MSN;
                    mp.QQ = model.QQ;
                    if (model.Position.IndexOf("|") != -1)
                    {
                        mp.Lat = Convert.ToDouble(model.Position.Split('|')[0]);
                        mp.Lng = Convert.ToDouble(model.Position.Split('|')[1]);
                    }
                    member.Member_Profile = mp;
                    DB_Service.Commit();
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
            }
            return View(model);
        }
    }
}

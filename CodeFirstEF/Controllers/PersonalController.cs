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
using CodeFirstEF.Serivces;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{

    [BaseAuthorize]
    public class PersonalController : Controller
    {
        //
        // GET: /Login/

        //
        // GET: /Register/
        private IUnitOfWork DB_Service;
        private IMemberService memberService;

        public PersonalController(IUnitOfWork _DB_Service
            , IMemberService _memberService)
        {
            DB_Service = _DB_Service;
            memberService = _memberService;
        }

        public ActionResult Index()
        {
            ViewBag.MenuItem = "account";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.Find(memberID);
            return View(member);
        }

        public ActionResult BaseInfo()
        {
            ViewBag.MenuItem = "baseinfo";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.FindMemberWithProfile(memberID);

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
            ViewBag.MenuItem = "baseinfo";
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    memberService.SaveMemberBaseInfo(memberID, model);
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
            ViewBag.MenuItem = "avtar";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.FindMemberWithProfile(memberID);
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
            ViewBag.MenuItem = "avtar";
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    memberService.SaveMemberAvtar(memberID, model);
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
            ViewBag.MenuItem = "contact";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.Find(memberID);
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
            ViewBag.MenuItem = "contact";
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    memberService.SaveMemberContact(memberID, model);
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

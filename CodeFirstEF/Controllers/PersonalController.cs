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
            ProfileModel pm = new ProfileModel()
            {
                MemberID = member.MemberID,
                Borthday = member.Member_Profile != null ? member.Member_Profile.Borthday : DateTime.Now,
                Description = member.Member_Profile != null ? member.Member_Profile.Description : string.Empty,
                NickName = member.NickName,
                Sex = member.Member_Profile != null ? member.Member_Profile.Sex : true
            };
            return View(pm);
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
                NickName = member.NickName,
                AvtarUrl = member.Member_Profile != null ? member.Member_Profile.AvtarUrl : Url.Content("~/Content/avtar/avtar_default.jpg"),

            };
            return View(pm);
        }

        public ActionResult Contact()
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = DB_Service.Set<Member>().Single(x => x.MemberID == memberID);
            return View(member);
        }

    }
}

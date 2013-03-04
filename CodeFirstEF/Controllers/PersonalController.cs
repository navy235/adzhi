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
                //{
                //    MemberID = member.MemberID,
                //    Address = member.Member_Profile != null ? member.Member_Profile.Address : string.Empty,
                //    CityCode = member.Member_Profile != null ? member.Member_Profile.CityCode : string.Empty,
                //    Email = member.Email,
                //    Mobile = member.Member_Profile != null ? member.Member_Profile.Mobile : string.Empty,
                //    Phone = member.Member_Profile != null ? member.Member_Profile.Phone : string.Empty,
                //    MSN = member.Member_Profile != null ? member.Member_Profile.MSN : string.Empty,
                //    Position = member.Member_Profile != null ? member.Member_Profile.Lat + "|" + member.Member_Profile.Lng : string.Empty,
                //    QQ = member.Member_Profile != null ? member.Member_Profile.QQ : member.Member_Profile.QQ

                MemberID = member.MemberID,
                Address = member.Member_Profile.Address,
                CityCode = member.Member_Profile.CityCode,
                Email = member.Email,
                Mobile = member.Member_Profile.Mobile,
                Phone = member.Member_Profile.Phone,
                MSN = member.Member_Profile.MSN,
                Position = member.Member_Profile.Lat + "|" + member.Member_Profile.Lng,
                QQ = member.Member_Profile.QQ

            };
            return View(member);
        }

    }
}

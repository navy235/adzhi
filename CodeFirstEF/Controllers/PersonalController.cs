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
using CodeFirstEF.Config;
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
        private IEmailService emailService;
        private IMember_ActionService member_ActionService;
        private IAreaAttService areaAttService;

        public PersonalController(IUnitOfWork _DB_Service
            , IMemberService _memberService
            , IEmailService _emailService
            , IMember_ActionService _member_ActionService
            , IAreaAttService _areaAttService)
        {
            DB_Service = _DB_Service;
            memberService = _memberService;
            emailService = _emailService;
            member_ActionService = _member_ActionService;
            areaAttService = _areaAttService;
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
            Member member = memberService.Find(memberID);
            AvtarModel pm = new AvtarModel()
            {
                MemberID = member.MemberID,
                AvtarUrl = member.AvtarUrl ?? Url.Content(ConfigSetting.Default_AvtarUrl)
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
            Member member = memberService.FindMemberWithProfile(memberID);
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



        public ActionResult ChangePwd()
        {
            ViewBag.MenuItem = "changepwd";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.Find(memberID);
            return View(new ChangePasswordModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePwd(ChangePasswordModel model)
        {
            ViewBag.MenuItem = "changepwd";
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);
                    if (memberService.ChangePassword(memberID, model.OldPassword, model.NewPassword))
                    {

                    }
                    else
                    {
                        ViewBag.Error = "旧密码错误";
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
            }
            return View(model);
        }


        public ActionResult BindEmail()
        {
            ViewBag.MenuItem = "email";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.Find(memberID);
            if (member.Status <= (int)MemberStatus.Registered)
            {
                int actionEmailActive = (int)MemberActionType.EmailActvie;
                int limitMins = Convert.ToInt32(ConfigSetting.GetBindEmailTimeDiffMin);
                if (member_ActionService.HasActionByActionTypeInLimiteTime(memberID, actionEmailActive, limitMins))
                {
                    ViewBag.HasSendEmail = true;
                }
                else
                {
                    ViewBag.HasSendEmail = false;
                }
                ViewBag.Actived = false;
            }
            else
            {
                ViewBag.Actived = true;
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult BindEmail(string email = null)
        {
            ViewBag.MenuItem = "email";
            var memberID = Convert.ToInt32(CookieHelper.UID);
            Member member = memberService.Find(memberID);
            if (member.Status <= (int)MemberStatus.Registered)
            {
                int actionEmailActive = (int)MemberActionType.EmailActvie;
                int limitMins = Convert.ToInt32(ConfigSetting.GetBindEmailTimeDiffMin);
                ViewBag.Actived = false;
                if (member_ActionService.HasActionByActionTypeInLimiteTime(memberID, actionEmailActive, limitMins))
                {
                    ViewBag.HasSendEmail = true;
                }
                else
                {
                    string emailKey = Guid.NewGuid().ToString();
                    EmailModel em = emailService.GetActiveEmailMail(member.MemberID, member.Email,
                        member.NickName,
                        emailKey);
                    emailService.SendMail(em);

                    member_ActionService.Create(member, actionEmailActive, emailKey);

                    ViewBag.BeforeSend = true;
                    ViewBag.HasSendEmail = true;
                }
            }
            else
            {
                ViewBag.Actived = true;
            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult ActiveEmail(string email, string emailKey)
        {
            if (string.IsNullOrEmpty(emailKey) || !memberService.ExistsEmail(email))
            {
                return Content("<script>alert('非法提交!');window.top.location='/" + Url.Action("BindEmail") + "';</script>");
            }
            else
            {
                int limitHours = Convert.ToInt32(ConfigSetting.ActiveEmailTimeDiffHour);
                bool isFound = false;
                int emailActived = (int)MemberStatus.EmailActived;
                Member member = memberService.FindDescriptionMemberInLimitTime(emailKey, limitHours, out isFound);

                if (isFound)
                {
                    if (member.Status >= emailActived)
                    {
                        return Content("<script>alert('您的邮箱已经绑定，请勿重复绑定!');window.top.location='" + Url.Action("BindEmail") + "';</script>");
                    }
                    else
                    {
                        if (member.Status < (int)MemberStatus.Registered)
                        {
                            return Content("<script>alert('您的帐号由于非法操作已经被锁定!');window.top.location='" + Url.Action("Index", "Register") + "';</script>");
                        }
                        else
                        {
                            memberService.ActiveEmail(member, emailActived);
                            return Content("<script>alert('恭喜您，邮箱绑定成功!');window.top.location='" + Url.Action("BindEmail") + "';</script>");
                        }
                    }
                }
                else
                {
                    return Content("<script>alert('您的验证已过期或非法提交，请重新获取绑定邮件!');window.location='" + Url.Action("BindEmail") + "';</script>");
                }

            }
        }


        public ActionResult AddOutDoor()
        {
            ViewBag.MenuItem = "outdoor-publish";
            ViewBag.Data_AreaAtt = areaAttService.GetSelectList();
            return View(new OutDoorViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOutDoor(OutDoorViewModel um)
        {
            OutDoor od = new OutDoor();
            var AreaAttArray = new List<int>();
            if (!TryUpdateModel(um))
            {
                ViewBag.updateError = "Update Failure";
            }
            else
            {
                try
                {
                    od.AddIP = HttpHelper.IP;
                    od.AddTime = DateTime.Now;
                    od.AdminUser = 200001;
                    od.CityCode = um.CityCode;
                    od.Description = um.Description;
                    od.FormatCode = um.FormatCode;
                    od.HasLight = um.HasLight;



                    od.Integrity = 80;
                    od.LastIP = HttpHelper.IP;
                    od.LastTime = DateTime.Now;
                    od.Lat = Convert.ToDecimal(um.Position.Split('|')[0]);

                    od.Lng = Convert.ToDecimal(um.Position.Split('|')[1]);

                    od.Location = um.Location;
                    od.MeberID = 200013;
                    od.MeidaCode = um.MeidaCode;

                    od.Name = um.Name;
                    od.PeriodCode = um.PeriodCode;
                    od.Price = um.Price;
                    od.PriceExten = um.PriceExten;
                    od.SeoDes = um.Description;
                    od.SeoTitle = um.Name;
                    od.Seokeywords = um.Name;


                    od.TrafficAuto = um.TrafficAuto;
                    od.TrafficPerson = um.TrafficPerson;
                    od.Unapprovedlog = string.Empty;



                    MediaImg media = new MediaImg()
                    {
                        FocusImgUrl = um.MediaImg.Split(',')[0],
                        ImgUrls = um.MediaImg,
                        MemberID = 200013
                    };
                    od.MediaImg = media;

                    AreaAttArray = um.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
                    var AreaAttList = DB_Service.Set<AreaAtt>().Where(x => AreaAttArray.Contains(x.ID));
                    od.AreaAtt.AddRange(AreaAttList);

                    CredentialsImg credent = new CredentialsImg()
                    {
                        FocusImgUrl = um.CredentialsImg.Split(',')[0],
                        ImgUrls = um.CredentialsImg,
                        MemberID = 200013
                    };


                    Owner or = new Owner();
                    or.CredentialsImg = credent;
                    or.Deadline = um.Deadline;
                    or.OwnerCate = DB_Service.Set<OwnerCate>().Single(x => x.CateCode.Equals(um.OwnerCode, StringComparison.CurrentCultureIgnoreCase));
                    od.Owner = or;

                    DB_Service.Add<OutDoor>(od);
                    DB_Service.Commit();
                    ViewBag.updateError = "Update Success!";
                }
                catch (DbEntityValidationException ex)
                {
                    ViewBag.updateError = "Update Failure";
                }

            }

            ViewBag.Data_AreaAtt = DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.AttName,
                Selected = AreaAttArray.Contains(x.ID)
            }).ToList();
            return View(um);
        }



    }
}

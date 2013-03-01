using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Mail;
using CoreHelper.Enum;
using CoreHelper.Data.Interface;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;

namespace CodeFirstEF.Controllers
{
    public class RegisterController : Controller
    {
        //
        // GET: /Register/
        private IUnitOfWork DB_Service;

        public RegisterController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            return View(new RegisterModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                #region 注册用户并登录
                try
                {
                    Member mb = new Member();
                    mb.Email = model.Email;
                    mb.NickName = model.NickName;
                    mb.Status = 1;//注册未激活，0为禁用
                    mb.Password = CheckHelper.StrToMd5(model.Password);
                    mb.GroupID = 1;
                    mb.AddTime = DateTime.Now;
                    mb.LastTime = DateTime.Now;
                    mb.AddIP = HttpHelper.IP;
                    mb.LastIP = HttpHelper.IP;
                    mb.LoginCount = 1;

                    DB_Service.Add<Member>(mb);
                    DB_Service.Commit();
                    CookieHelper.LoginCookieSave(mb.MemberID.ToString(),
                        mb.Email,
                        mb.NickName,
                        "",
                        mb.GroupID.ToString(),
                        mb.LoginCount.ToString(),
                        mb.Password, "1");
                    return Redirect(Url.Action("Regok"));

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                #endregion
            }
            else
            {
                return View(model);
            }
        }

        public ActionResult RegAuto()
        {
            if (null == Session["registerAuto"])
            {
                return RedirectToAction("Index");
            }
            else
            {
                OpenLoginStatus OpenUser = (OpenLoginStatus)Session["registerAuto"];
                Session["registerAuto"] = null;
                return View(new RegisterModel()
                {
                    OpenType = OpenUser.OpenType,
                    OpenID = OpenUser.OpenId,
                    NickName = OpenUser.NickName
                });
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RegAuto(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                #region 注册用户并登录
                try
                {
                    Member mb = new Member();
                    mb.Email = model.Email;
                    mb.NickName = model.NickName;
                    mb.OpenID = model.OpenID;
                    mb.OpenType = model.OpenType;
                    mb.Status = 1;//注册未激活，0为禁用
                    mb.Password = CheckHelper.StrToMd5(model.Password);
                    mb.GroupID = 1;
                    mb.AddTime = DateTime.Now;
                    mb.LastTime = DateTime.Now;
                    mb.AddIP = HttpHelper.IP;
                    mb.LastIP = HttpHelper.IP;
                    mb.LoginCount = 1;

                    DB_Service.Add<Member>(mb);
                    DB_Service.Commit();
                    CookieHelper.LoginCookieSave(mb.MemberID.ToString(),
                        mb.Email,
                        mb.NickName,
                        "",
                        mb.GroupID.ToString(),
                        mb.LoginCount.ToString(),
                        mb.Password, "1");
                    return Redirect(Url.Action("Regok"));

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                #endregion
            }
            else
            {
                return View(model);
            }
        }



        public ActionResult RegOk()
        {
            return View();
        }

        public ActionResult RegCompany()
        {
            return View(new CompanyReg());
        }

        public ActionResult GetPassword()
        {
            ViewBag.SendMail = false;
            return View(new GetPasswordModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GetPassword(GetPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                int memberAction = (int)MemberActionType.GetPassword;
                int limitMin = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["GetPasswordEmailTimeDiff"]);
                DateTime LimitDate = DateTime.Now.AddMinutes(-10);
                string IP = HttpHelper.IP;
                var query = DB_Service.Set<Member>()
                    .Include(x => x.Member_Action)
                    .Where(x =>
                        (x.Member_Action.Any(ma =>
                            ma.ActionType == memberAction
                            && ma.AddTime > LimitDate
                            && ma.IP == IP
                            )) && x.Email.Equals(model.Email, StringComparison.OrdinalIgnoreCase));
                if (query.Count() > 0)
                {
                    ViewBag.SendMail = true;
                    ViewBag.HasSendMail = true;
                    ViewBag.Message = limitMin;
                }
                else
                {
                    Member member = DB_Service.Set<Member>().Single(x => x.Email.Equals(model.Email, StringComparison.OrdinalIgnoreCase));
                    string userKey = Guid.NewGuid().ToString();
                    EmailModel em = new EmailModel();
                    em.Email = model.Email;
                    em.Title = member.NickName + " 您好！找回www.dotaeye.com的密码!";
                    em.Content = System.IO.File.ReadAllText(Server.MapPath("~/Content/emailTemplate/getpwd.htm"), System.Text.Encoding.Default);
                    em.Content = em.Content.Replace("{ukey}", userKey)
                        .Replace("{nid}", member.NickName)
                        .Replace("{uid}", member.MemberID.ToString())
                        .Replace("{time}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                        .Replace("{email}", model.Email);
                    MailHelper.SendMail(em.Email, em.Title, em.Content);
                    Member_Action member_Action = new Member_Action()
                    {
                        MemberID = member.MemberID,
                        ActionType = memberAction,
                        AddTime = DateTime.Now,
                        Description = userKey,
                        IP = IP
                    };
                    DB_Service.Add<Member_Action>(member_Action);
                    DB_Service.Commit();
                    ViewBag.HasSendMail = false;
                    ViewBag.SendMail = true;
                    ViewBag.Title = "";
                }
                return View(model);

            }
            return View(model);
        }


        public ActionResult ResetPassword(string userKey)
        {
            if (string.IsNullOrEmpty(userKey))
            {
                return Content("<script>alert('非法提交!');window.top.location='/" + Url.Action("GetPassword") + "';</script>");
            }
            else
            {
                DateTime LimitDate = DateTime.Now.AddHours(-12);
                var query = DB_Service.Set<Member_Action>()
                    .Where(x => x.Description.Equals(userKey, StringComparison.OrdinalIgnoreCase)
                    && x.AddTime > LimitDate
                    );
                if (query.Count() > 0)
                {
                    ViewBag.haveChangePwd = false;
                    return View(new ResetPasswordModel());
                }
                else
                {
                    return Content("<script>alert('您的验证已过期或非法提交，请重新获取密码!');window.location='/" + Url.Action("GetPassword") + "';</script>");
                }
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(string userKey, ResetPasswordModel model)
        {

            if (string.IsNullOrEmpty(userKey))
            {
                return Content("<script>alert('非法提交!');window.top.location='/" + Url.Action("GetPassword") + "';</script>");
            }
            else
            {
                DateTime LimitDate = DateTime.Now.AddHours(-12);
                var query = DB_Service.Set<Member>()
                    .Include(x => x.Member_Action)
                    .Where(x =>
                        (x.Member_Action
                            .Any(ma => ma.Description.Equals(userKey, StringComparison.OrdinalIgnoreCase)
                                && ma.AddTime > LimitDate
                                )
                         ));
                if (query.Count() > 0)
                {
                    Member member = query.Single();

                    if (model.NewPassword.Equals(model.ConfirmPassword, StringComparison.OrdinalIgnoreCase))
                    {
                        DB_Service.Attach<Member>(member);
                        member.Password = CheckHelper.StrToMd5(model.NewPassword);
                        DB_Service.Commit();
                    }
                    ViewBag.haveChangePwd = true;
                    ViewBag.Email = member.Email;
                    return View(model);
                }
                else
                {
                    return Content("<script>alert('您的验证已过期或非法提交，请重新获取密码!');window.location='/" + Url.Action("GetPassword") + "';</script>");
                }
            }
        }
    }
}

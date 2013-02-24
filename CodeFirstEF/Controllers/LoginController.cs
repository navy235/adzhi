using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;


namespace CodeFirstEF.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        //
        // GET: /Register/
        private IUnitOfWork DB_Service;

        public LoginController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            return View(new LogOnModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LogOnModel model, string ReturnUrl)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    string Md5Password = CheckHelper.StrToMd5(model.Password);

                    if (DB_Service.Set<Member>().Count(x => x.Email == model.Email && x.Password == Md5Password) == 1)
                    {
                        Member LoginUser = DB_Service.Set<Member>().Single(x => x.Email == model.Email);
                        DB_Service.Attach<Member>(LoginUser);
                        LoginUser.LastIP = HttpHelper.IP;
                        LoginUser.LastTime = DateTime.Now;
                        LoginUser.LoginCount = LoginUser.LoginCount + 1;
                        Member_Action ma = new Member_Action();
                        ma.ActionType = 3;
                        ma.AddTime = DateTime.Now;
                        ma.Description = "登录";
                        LoginUser.Member_Action.Add(ma);
                        DB_Service.Commit();
                        CookieHelper.LoginCookieSave(LoginUser.MemberID.ToString(),
                            LoginUser.Email,
                            LoginUser.NickName,
                            "AvtarUrl",
                            LoginUser.GroupID.ToString(),
                            LoginUser.LoginCount.ToString(),
                            LoginUser.Password,
                            "1");
                        ViewBag.Message = null;
                        if (Url.IsLocalUrl(ReturnUrl) && ReturnUrl.Length > 1 && ReturnUrl.StartsWith("/")
                       && !ReturnUrl.StartsWith("//") && !ReturnUrl.StartsWith("/\\"))
                        {
                            return Redirect(ReturnUrl);
                        }
                        else
                        {
                            return Redirect(Url.Action("Index"));
                        }

                    }
                    else
                    {
                        ViewBag.Message = "您的用户名和密码不匹配";
                        return View(model);
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                ViewBag.Message = "您的输入有误请确认后提交";
                return View(model);
            }
        }
    }
}

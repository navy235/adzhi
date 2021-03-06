﻿using System;
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
namespace UserProject.Controllers
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
                        "",
                        mb.LoginCount.ToString(),
                        mb.Password, "1");
                    return Redirect(Url.Action("Index"));

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


    }
}

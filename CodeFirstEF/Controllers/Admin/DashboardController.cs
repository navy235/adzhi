﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Serivces;
using CodeFirstEF.Utils;
using CodeFirstEF.Filters;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    [Permission]
    public class DashboardController : Controller
    {
        //
        // GET: /Dashboard/


        private IGroupService groupService;
        private IMemberService memberService;
        public DashboardController(
            IGroupService _groupService
          , IMemberService _memberService
         )
        {
            groupService = _groupService;
            memberService = _memberService;
        }



        public ActionResult Index()
        {

            var Member = memberService.Find(Convert.ToInt32(CookieHelper.UID));

            DashBoardViewModel model = new DashBoardViewModel()
            {
                Name = "运营管理系统",
                GroupName = groupService.Find(Member.GroupID).Name,
                NickName = Member.NickName,
                Version = "1.0",
                CurrentIP = HttpHelper.IP,
                CurrentTime = DateTime.Now,
                LastIP = Member.LastIP,
                LastTime = Member.LastTime,
                LoginCount = Member.LoginCount

            };
            ViewBag.DashModel = model;

            return View(model);
        }

    }
}

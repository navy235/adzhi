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
using CoreHelper.UI;
using CoreHelper.Enum;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers.Admin
{
    [Permission]
    public class OutDoorVerifyController : Controller
    {
        private IMemberService memberService;
        private IEmailService emailService;
        private IMember_ActionService member_ActionService;
        private IOutDoorService outDoorService;
        public OutDoorVerifyController(
              IMemberService _memberService
            , IEmailService _emailService
            , IMember_ActionService _member_ActionService
            , IOutDoorService _outDoorService)
        {
            memberService = _memberService;
            emailService = _emailService;
            member_ActionService = _member_ActionService;
            outDoorService = _outDoorService;
        }

        public ActionResult Index()
        {
            ViewBag.OutDoorStatus = UIHelper.OutDoorStatusList;
            return View();
        }

        public ActionResult Authed()
        {
            ViewBag.OutDoorStatus = UIHelper.OutDoorStatusList;
            return View();
        }

        public ActionResult OutDoor_Read([DataSourceRequest] DataSourceRequest request)
        {
            return Json(outDoorService.GetVerifyList(OutDoorStatus.PreVerify).ToDataSourceResult(request));
        }

        public ActionResult OutDoor_ReadAuthed([DataSourceRequest] DataSourceRequest request)
        {
            return Json(outDoorService.GetVerifyList(OutDoorStatus.Verified, true).ToDataSourceResult(request));
        }

        public ActionResult VerifyPass(string ids)
        {
            var success = outDoorService.ChangeStatus(ids,
                OutDoorStatus.ShowOnline);
            return Json(success);
        }

        public ActionResult VerifyFailed(string ids)
        {
            var success = outDoorService.ChangeStatus(ids,
             OutDoorStatus.VerifyFailed);
            return Json(success);
        }

        public ActionResult Details(int id)
        {
            var model = outDoorService.GetOutDoorDetailsViewModel(id);
            return View(model);
        }


    }
}

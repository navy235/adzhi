using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.Entity.Validation;
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
    public class OutDoorController : Controller
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
        private IOutDoorService outDoorService;
        public OutDoorController(IUnitOfWork _DB_Service
            , IMemberService _memberService
            , IEmailService _emailService
            , IMember_ActionService _member_ActionService
            , IAreaAttService _areaAttService
            , IOutDoorService _outDoorService)
        {
            DB_Service = _DB_Service;
            memberService = _memberService;
            emailService = _emailService;
            member_ActionService = _member_ActionService;
            areaAttService = _areaAttService;
            outDoorService = _outDoorService;
        }

        public ActionResult Index()
        {
            ViewBag.MenuItem = "outdoor-list";

            return View();
        }


        public ActionResult OutDoor_Read([DataSourceRequest] DataSourceRequest request)
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            var model = outDoorService.GetMemberOutDoor(memberID, OutDoorStatus.ShowOnline, true);
            return Json(model.ToDataSourceResult(request));
        }

        public ActionResult Preverify()
        {
            ViewBag.MenuItem = "outdoor-preverify";
            return View();
        }


        public ActionResult OutDoor_Preverify([DataSourceRequest] DataSourceRequest request)
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            var model = outDoorService.GetMemberOutDoor(memberID, OutDoorStatus.PreVerify);
            return Json(model.ToDataSourceResult(request));
        }

        public ActionResult VerifyFailed()
        {
            ViewBag.MenuItem = "outdoor-verifyfailed";
            return View();
        }

        public ActionResult OutDoor_VerifyFailed([DataSourceRequest] DataSourceRequest request)
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            var model = outDoorService.GetMemberOutDoor(memberID, OutDoorStatus.VerifyFailed);
            return Json(model.ToDataSourceResult(request));
        }


        public ActionResult Delete()
        {
            ViewBag.MenuItem = "outdoor-delete";
            return View();
        }

        public ActionResult OutDoor_Delete([DataSourceRequest] DataSourceRequest request)
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            var model = outDoorService.GetMemberOutDoor(memberID, OutDoorStatus.Deleted);
            return Json(model.ToDataSourceResult(request));
        }

        public ActionResult NoShow()
        {
            ViewBag.MenuItem = "outdoor-noshow";
            return View();
        }

        public ActionResult OutDoor_NoShow([DataSourceRequest] DataSourceRequest request)
        {
            var memberID = Convert.ToInt32(CookieHelper.UID);
            var model = outDoorService.GetMemberOutDoor(memberID, OutDoorStatus.NoShow);
            return Json(model.ToDataSourceResult(request));
        }


        public ActionResult Add()
        {
            ViewBag.MenuItem = "outdoor-publish";
            ViewBag.Data_AreaAtt = areaAttService.GetSelectList();
            return View(new OutDoorViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(OutDoorViewModel model)
        {
            ViewBag.MenuItem = "outdoor-publish";
            var AreaAttArray = new List<int>();
            if (!ModelState.IsValid)
            {
                ViewBag.Error = "请检查表单是否填写完整";
            }
            else
            {
                try
                {
                    AreaAttArray = model.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
                    outDoorService.Create(model);
                    return RedirectToAction("preverify");
                }
                catch (DbEntityValidationException ex)
                {
                    ViewBag.Error = ex.Message;
                }

            }
            ViewBag.Data_AreaAtt = areaAttService.GetSelectList(AreaAttArray);
            return View(model);
        }


        public ActionResult Edit(int id)
        {
            ViewBag.MenuItem = "outdoor-list";
            if (outDoorService.HasOutDoorByMember(id))
            {
                OutDoorViewModel odv = outDoorService.GetOutDoorViewModel(id);
                ViewBag.Data_AreaAtt = areaAttService.GetSelectList(odv.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)));
                return View(odv);
            }
            else
            {
                return Content("<script>alert('非法操作！');window.history.go(-1);</script>");
            }

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(OutDoorViewModel model)
        {
            ViewBag.MenuItem = "outdoor-list";
            var AreaAttArray = new List<int>();
            if (!ModelState.IsValid)
            {
                ViewBag.Error = "请检查表单是否填写完整";
            }
            else
            {
                try
                {
                    AreaAttArray = model.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
                    outDoorService.Update(model);
                    return RedirectToAction("preverify");
                }
                catch (DbEntityValidationException ex)
                {
                    ViewBag.Error = ex.Message;
                }

            }
            ViewBag.Data_AreaAtt = areaAttService.GetSelectList(AreaAttArray);
            return View(model);
        }


        public ActionResult SetAuctionCalendar(int id)
        {
            ViewBag.MenuItem = "outdoor-list";
            if (outDoorService.HasOutDoorByMember(id))
            {
                return View(new OutDoorSetAuctionCalendarViewModel()
                {
                    MediaID = id,
                    AuctionCalendar = id.ToString()
                });
            }
            else
            {
                return Content("<script>alert('非法操作！');window.history.go(-1);</script>");
            }

        }




    }
}

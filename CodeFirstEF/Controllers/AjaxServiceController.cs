﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Data.Entity;
using CodeFirstEF.Models;
using CodeFirstEF.Utils;
using CodeFirstEF.Serivces;
using CoreHelper;
using CoreHelper.Data.Interface;
using CoreHelper.Cookie;
using CoreHelper.Files;
using CoreHelper.Checking;
using CoreHelper.Filters;
using CoreHelper.BadWords;
namespace CodeFirstEF.Controllers
{
    public class AjaxServiceController : Controller
    {
        private IUnitOfWork DB_Service;
        private IMemberService memberService;
        private IAreaAttService areaAttService;
        private IAreaService areaService;
        private IOutDoorMediaCateService outDoorMediaCateService;
        private IFormatCateService formatCateService;
        private ICompanyBussinessService companyBussinessService;
        private ICompanyFundService companyFundService;
        private ICompanyScaleService companyScaleService;
        private IPeriodCateService periodCateService;
        private IOwnerCateService ownerCateService;
        private IAuctionCalendarService auctionCalendarService;
        public AjaxServiceController(IUnitOfWork _DB_Service
            , IMemberService _memberService
            , IAreaAttService _areaAttService
            , IAreaService _areaService
            , IOutDoorMediaCateService _outDoorMediaCateService
            , IFormatCateService _formatCateService
            , ICompanyBussinessService _companyBussinessService
            , ICompanyFundService _companyFundService
            , ICompanyScaleService _companyScaleService
            , IPeriodCateService _periodCateService
            , IOwnerCateService _ownerCateService
            , IAuctionCalendarService _auctionCalendarService
            )
        {
            DB_Service = _DB_Service;
            areaAttService = _areaAttService;
            areaService = _areaService;
            memberService = _memberService;
            outDoorMediaCateService = _outDoorMediaCateService;
            formatCateService = _formatCateService;
            companyBussinessService = _companyBussinessService;
            companyFundService = _companyFundService;
            companyScaleService = _companyScaleService;
            periodCateService = _periodCateService;
            ownerCateService = _ownerCateService;
            auctionCalendarService = _auctionCalendarService;
        }

        #region  Control
        public ActionResult CityCode(string key, string pid = null)
        {
            var renderRadioList = areaService.GetALL();
            if (string.IsNullOrEmpty(pid))
            {
                renderRadioList = renderRadioList.Where(x => x.PCateCode.Equals(null));
            }
            else
            {
                renderRadioList = renderRadioList.Where(x => x.PCateCode.Equals(pid));
            }
            return Json(renderRadioList.ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult CityCodeName(string key)
        {
            return Content(areaService.Find(key).CateName);
        }

        public ActionResult FormatCode()
        {

            var renderRadioList = Utilities.GetSelectListData(formatCateService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
                x => x.CateCode,
                x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FormatCodeName(string key)
        {
            return Content(formatCateService.Find(key).CateName);
        }

        public ActionResult ScaleCode()
        {

            var renderRadioList = Utilities.GetSelectListData(companyScaleService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
             x => x.CateCode,
             x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ScaleCodeName(string key)
        {
            return Content(companyScaleService.Find(key).CateName);
        }

        public ActionResult FundCode()
        {
            var renderRadioList = Utilities.GetSelectListData(companyFundService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
             x => x.CateCode,
             x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FundCodeName(string key)
        {
            return Content(companyFundService.Find(key).CateName);
        }

        public ActionResult BussinessCode()
        {
            var renderRadioList = Utilities.GetSelectListData(companyBussinessService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
             x => x.CateCode,
             x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult BussinessCodeName(string key)
        {
            return Content(companyBussinessService.Find(key).CateName);
        }

        public ActionResult MeidaCode(string key, string pid = null)
        {
            var renderRadioList = outDoorMediaCateService.GetALL();
            if (string.IsNullOrEmpty(pid))
            {
                renderRadioList = renderRadioList.Where(x => x.PCateCode.Equals(null));
            }
            else
            {
                renderRadioList = renderRadioList.Where(x => x.PCateCode.Equals(pid));
            }
            return Json(renderRadioList.ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult MeidaCodeName(string key)
        {
            return Content(outDoorMediaCateService.Find(key).CateName);
        }

        public ActionResult PeriodCode()
        {
            var renderRadioList = Utilities.GetSelectListData(periodCateService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
               x => x.CateCode,
               x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PeriodCodeName(string key)
        {
            return Content(periodCateService.Find(key).CateName);
        }

        public ActionResult OwnerCode()
        {
            var renderRadioList = Utilities.GetSelectListData(ownerCateService.GetALL().Where(x => x.PCateCode.Equals(null)).ToList(),
              x => x.CateCode,
              x => x.CateName, false);
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);

        }

        public ActionResult OwnerCodeName(string key)
        {
            return Content(ownerCateService.Find(key).CateName);
        }

        public ActionResult AreaAttName(string key)
        {
            var keyArray = key.Split(',').Select(x => Convert.ToInt32(x));
            return Json(areaAttService.GetList(keyArray).Select(x => x.AttName).ToList(), JsonRequestBehavior.AllowGet);

        }

        #endregion


        #region Validate

        [SkipGzipCompressJsAndReplaceWhiteSpace]
        public void GetValidateCode()
        {
            ValidateCode VCode = new ValidateCode("VCode", 100, 40);
        }


        /// <summary>
        /// 确认是否存在该Email用户，注册用户时远程验证，存在返回false，不存在返回true
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public JsonResult EmailExists(string email)
        {
            if (memberService.ExistsEmail(email))
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
        }

        /// <summary>
        /// 确认是否存在该Email用户，注册找回密码时验证，存在返回true，不存在返回false
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public JsonResult HasEmailUser(string email)
        {
            if (memberService.ExistsEmail(email))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult NickNameExists(string nickName)
        {
            if (!memberService.ExistsNickName(nickName) && !BadWordsHelper.HasBadWord(nickName))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult ValidateVCode(string vcode)
        {
            bool status = false;
            if (Session["VCode"] != null)
            {
                status = Session["VCode"].ToString().Equals(vcode, StringComparison.OrdinalIgnoreCase);
            }
            return Json(status, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EmailExistsNotMe(string email)
        {
            int uid = Convert.ToInt32(CookieHelper.UID);
            if (!memberService.ExistsEmailNotMe(uid, email))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult NickNameExistsNotMe(string nickName)
        {
            int uid = Convert.ToInt32(CookieHelper.UID);
            if (!memberService.ExistsNickNameNotMe(uid, nickName))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult ValidateDescription(string Description)
        {
            if (!BadWordsHelper.HasBadWord(Description))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult ValidatePassword(string OldPassword)
        {
            int uid = Convert.ToInt32(CookieHelper.UID);
            if (memberService.ValidatePassword(uid, OldPassword))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult ValidateAuction(int id, string startTime, string endTime)
        {
            DateTime _startTime = Convert.ToDateTime(startTime);
            DateTime _endtime = Convert.ToDateTime(endTime);
            var result = auctionCalendarService.ValidateAuction(id, _startTime, _endtime);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region File

        public ActionResult UpLoadSave(IEnumerable<HttpPostedFileBase> attachments, string status = "upload")
        {
            string res = FileHelper.UpLoadSave(attachments, status);
            return Content(res);
        }

        public ActionResult EditSave(IEnumerable<HttpPostedFileBase> editattachments, int uploadmaxsize = 10240000)
        {
            return UpLoadSave(editattachments);
        }

        public ActionResult UploadListSave(IEnumerable<HttpPostedFileBase> listattachments, int uploadmaxsize = 10240000)
        {
            return UpLoadSave(listattachments);

        }

        public ActionResult UploadListSave2(IEnumerable<HttpPostedFileBase> listattachments2, int uploadmaxsize = 10240000)
        {
            return UpLoadSave(listattachments2);

        }
        public ActionResult UploadListSave3(IEnumerable<HttpPostedFileBase> listattachments3, int uploadmaxsize = 10240000)
        {
            return UpLoadSave(listattachments3);

        }

        public ActionResult UpLoadRemove(string[] fileNames)
        {
            var res = string.Format("{{\"err\":\"\",\"status\":\"remove\"}}");
            return Content(res);
        }

        public ActionResult CropImg(string imgurl, int width, int height, int x, int y, int targetwidth)
        {
            string res = string.Empty;
            string imgPath = Server.MapPath("~" + imgurl);
            if (FileHelper.Crop(imgPath, width, height, x, y, targetwidth))
            {
                res = string.Format("{{\"err\":\"\",\"imgurl\":\"{0}\"}}", FileHelper.GetImgCutpath(imgurl));
            }
            else
            {
                res = string.Format("{{\"err\":\"{0}\"}}", "保存失败！");
            }
            return Content(res);
        }
        #endregion

    }
}

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

        public AjaxServiceController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region  Control
        public ActionResult CityCode(string key, string pid = null)
        {
            var renderRadioList = DB_Service.Set<Area>();
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

        public ActionResult FormatCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<FormatCate>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ScaleCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<CompanyScale>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FundCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<CompanyFund>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult BussinessCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<CompanyBussiness>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

  
        public ActionResult MeidaCode(string key, string pid = null)
        {
            var renderRadioList = DB_Service.Set<OutDoorMediaCate>();
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

        public ActionResult PeriodCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<PeriodCate>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult OwnerCode()
        {
            List<SelectListItem> renderRadioList = new List<SelectListItem>();

            renderRadioList = DB_Service.Set<OwnerCate>().Where(x => x.PCateCode.Equals(null)).ToList().Select(x => new SelectListItem()
            {
                Text = x.CateName,
                Value = x.CateCode

            }).ToList();
            return Json(renderRadioList, JsonRequestBehavior.AllowGet);
        }
        #endregion


        #region Validate

        public void GetValidateCode()
        {
            ValidateCode VCode = new ValidateCode("VCode", 100, 40);
        }


        public JsonResult EmailExists(string email)
        {
            if (DB_Service.Set<Member>().Count(x => x.Email == email) > 0)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult NickNameExists(string nickName)
        {
            if (!(DB_Service.Set<Member>().Count(x => x.NickName == nickName) > 0) && !BadWordsHelper.HasBadWord(nickName))
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
            if (!(DB_Service.Set<Member>().Where(x => x.MemberID != uid).Count(x => x.Email == email) > 0))
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
            if (!(DB_Service.Set<Member>().Where(x => x.MemberID != uid).Count(x => x.NickName == nickName) > 0))
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

        #endregion

        #region File

        public ActionResult UpLoadSave(IEnumerable<HttpPostedFileBase> attachments, string status = "upload")
        {
            string res = FileHelper.UpLoadSave(attachments, status);
            return Json(res);
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
            return Json(res);
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
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        #endregion

    }
}
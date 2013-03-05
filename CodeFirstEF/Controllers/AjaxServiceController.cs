using System;
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

        public AjaxServiceController(IUnitOfWork _DB_Service
            , IMemberService _memberService)
        {
            DB_Service = _DB_Service;
            memberService = _memberService;
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
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
    public class OutDoorMediaCateController : Controller
    {
        //
        // GET: /OutDoorMediaCate/
        private IOutDoorMediaCateService OutDoorMediaCateService;
        public OutDoorMediaCateController(
             IOutDoorMediaCateService _OutDoorMediaCateService
          )
        {
            OutDoorMediaCateService = _OutDoorMediaCateService;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {
            ViewBag.PCateCode = Utilities.CreateSelectList(
                OutDoorMediaCateService.GetALL()
                .Where(x => x.PCateCode.Equals(null)).ToList()
                , item => item.CateCode
                , item => item.CateName, true);
            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {

            var OutDoorMediaCates = OutDoorMediaCateService.GetKendoALL().OrderBy(x => x.CateCode).ToList();
            return Json(OutDoorMediaCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OutDoorMediaCate> OutDoorMediaCates)
        {
            var results = new List<OutDoorMediaCate>();

            if (OutDoorMediaCates != null && ModelState.IsValid)
            {
                foreach (var OutDoorMediaCate in OutDoorMediaCates)
                {
                    OutDoorMediaCateService.Create(OutDoorMediaCate);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OutDoorMediaCate> OutDoorMediaCates)
        {
            if (OutDoorMediaCates != null && ModelState.IsValid)
            {
                foreach (var OutDoorMediaCate in OutDoorMediaCates)
                {
                    OutDoorMediaCateService.Update(OutDoorMediaCate);
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OutDoorMediaCate> OutDoorMediaCates)
        {
            if (OutDoorMediaCates.Any())
            {
                foreach (var OutDoorMediaCate in OutDoorMediaCates)
                {
                    OutDoorMediaCateService.Delete(OutDoorMediaCate);
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


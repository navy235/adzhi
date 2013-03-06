using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Models;
using CodeFirstEF.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System.Web.Script.Serialization;

namespace CodeFirstEF.Controllers
{
    public class OutDoorMediaCateController : Controller
    {
        //
        // GET: /OutDoorMediaCate/
        private IUnitOfWork DB_Service;

        public OutDoorMediaCateController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> OutDoorMediaCatesList = new List<SelectListItem>();
            OutDoorMediaCatesList = DB_Service.Set<OutDoorMediaCate>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            OutDoorMediaCatesList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_OutDoorMediaCate.OutDoorMediaCates.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(OutDoorMediaCatesList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var FormatCates = DB_Service.Set<OutDoorMediaCate>().OrderBy(x => x.CateCode).ToList();
            return Json(FormatCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<OutDoorMediaCate> OutDoorMediaCates)
        {
            var results = new List<OutDoorMediaCate>();

            if (OutDoorMediaCates != null && ModelState.IsValid)
            {
                foreach (var OutDoorMediaCate in OutDoorMediaCates)
                {
                    OutDoorMediaCate.PCateCode = OutDoorMediaCate.PCateCode ;
                    DB_Service.Add<OutDoorMediaCate>(OutDoorMediaCate);
                    DB_Service.Commit();
                    results.Add(OutDoorMediaCate);
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
                    var target = DB_Service.Set<OutDoorMediaCate>().Single(x => x.ID == OutDoorMediaCate.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<OutDoorMediaCate>(target);
                        target.CateCode = OutDoorMediaCate.CateCode;
                        target.CateName = OutDoorMediaCate.CateName;
                        target.PCateCode = OutDoorMediaCate.PCateCode;
                        DB_Service.Commit();
                    }
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
                    var target = DB_Service.Set<OutDoorMediaCate>().Single(x => x.ID == OutDoorMediaCate.ID);
                    DB_Service.Remove<OutDoorMediaCate>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


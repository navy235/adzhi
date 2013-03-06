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
    public class CompanyFundController : Controller
    {
        //
        // GET: /CompanyFund/
        private IUnitOfWork DB_Service;

        public CompanyFundController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index()
        {

            List<SelectListItem> CompanyFundsList = new List<SelectListItem>();
            CompanyFundsList = DB_Service.Set<CompanyFund>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
            {
                Value = x.CateCode,
                Text = x.CateName
            }).ToList();

            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            CompanyFundsList.Insert(0, nullItem);

            //ViewBag.PCateCode = new SelectList(DB_CompanyFund.CompanyFunds.Where(x => x.PCateCode == ""), "CateCode", "CateName");

            ViewBag.PCateCode = new SelectList(CompanyFundsList, "Value", "Text");

            return View();
        }

        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var FormatCates = DB_Service.Set<CompanyFund>().OrderBy(x => x.CateCode).ToList();
            return Json(FormatCates.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyFund> CompanyFunds)
        {
            var results = new List<CompanyFund>();

            if (CompanyFunds != null && ModelState.IsValid)
            {
                foreach (var CompanyFund in CompanyFunds)
                {
                    CompanyFund.PCateCode = CompanyFund.PCateCode ;
                    DB_Service.Add<CompanyFund>(CompanyFund);
                    DB_Service.Commit();
                    results.Add(CompanyFund);
                }
            }
            return Json(results.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyFund> CompanyFunds)
        {
            if (CompanyFunds != null && ModelState.IsValid)
            {
                foreach (var CompanyFund in CompanyFunds)
                {
                    var target = DB_Service.Set<CompanyFund>().Single(x => x.ID == CompanyFund.ID);
                    if (target != null)
                    {
                        DB_Service.Attach<CompanyFund>(target);
                        target.CateCode = CompanyFund.CateCode;
                        target.CateName = CompanyFund.CateName;
                        target.PCateCode = CompanyFund.PCateCode ;
                        DB_Service.Commit();
                    }
                }
            }

            return Json(ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Destroy([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CompanyFund> CompanyFunds)
        {
            if (CompanyFunds.Any())
            {
                foreach (var CompanyFund in CompanyFunds)
                {
                    var target = DB_Service.Set<CompanyFund>().Single(x => x.ID == CompanyFund.ID);
                    DB_Service.Remove<CompanyFund>(target);
                    DB_Service.Commit();
                }
            }
            return Json(ModelState.ToDataSourceResult());
        }

        #endregion

    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System.Web.Script.Serialization;
using System.Reflection;

namespace CodeFirstEF.Controllers
{
    public class CategoryController : Controller
    {
        //
        // GET: /OutDoorMediaCate/
        private IUnitOfWork DB_Service;

        public CategoryController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        #region KendoGrid Action

        public ActionResult Index(string type = "area")
        {

            Dictionary<string, string> CategoryTypes = new Dictionary<string, string>();
            CategoryTypes.Add("area", "城市信息类别管理");
            CategoryTypes.Add("formatcate", "媒体表现形式信息管理");
            CategoryTypes.Add("outdoormediacate", "户外媒体类别信息管理");
            CategoryTypes.Add("ownercate", "规格所有权信息设置");
            CategoryTypes.Add("periodcate", "最短投放周期信息设置");
            CategoryTypes.Add("companybussiness", "公司业务类别信息管理");
            CategoryTypes.Add("companyfund", "公司注册资金类别信息管理");
            CategoryTypes.Add("companyscale", "公司规模类别信息管理");
            ViewBag.Title = CategoryTypes.Single(x => x.Key == type.ToLower()).Value;
            var PCategoryList = GetPCategoryList(type);
            ViewBag.PCateCode = new SelectList(PCategoryList, "Value", "Text");
            ViewBag.CategoryTypes = CategoryTypes;
            return View();
        }

        public List<SelectListItem> GetPCategoryList(string type)
        {
            List<SelectListItem> result = new List<SelectListItem>();
            SelectListItem nullItem = new SelectListItem()
            {
                Value = string.Empty,
                Text = "顶级类别"
            };
            #region Mapping Type
            switch (type)
            {
                case "area":
                    result = DB_Service.Set<Area>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "formatcate":
                    result = DB_Service.Set<FormatCate>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "outdoormediacate":
                    result = DB_Service.Set<OutDoorMediaCate>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "ownercate":
                    result = DB_Service.Set<OwnerCate>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "companybussiness":
                    result = DB_Service.Set<CompanyBussiness>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "companyfund":
                    result = DB_Service.Set<CompanyFund>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "companyscale":
                    result = DB_Service.Set<CompanyScale>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                case "periodcate":
                    result = DB_Service.Set<PeriodCate>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    break;
                default:
                    result = DB_Service.Set<Area>().Where(x => x.PCateCode == null).ToList().Select(x => new SelectListItem()
                    {
                        Value = x.CateCode,
                        Text = x.CateName
                    }).ToList();
                    type = "area";
                    break;
            }
            #endregion
            result.Insert(0, nullItem);
            return result;
        }

        public List<CategoryViewModel> GetDataSource(string type)
        {
            List<CategoryViewModel> result = new List<CategoryViewModel>();
            #region Mapping Type
            switch (type)
            {
                case "area":
                    result = DB_Service.Set<Area>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "formatcate":
                    result = DB_Service.Set<FormatCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "outdoormediacate":
                    result = DB_Service.Set<OutDoorMediaCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "ownercate":
                    result = DB_Service.Set<OwnerCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companybussiness":
                    result = DB_Service.Set<CompanyBussiness>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companyfund":
                    result = DB_Service.Set<CompanyFund>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companyscale":
                    result = DB_Service.Set<CompanyScale>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();

                    break;
                case "periodcate":
                    result = DB_Service.Set<PeriodCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                default:
                    result = DB_Service.Set<Area>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
            }
            #endregion
            return result;
        }


        public CategoryViewModel UpDateModel(string type,CategoryViewModel model)
        {
            CategoryViewModel result = new CategoryViewModel();

            var updateModel = new Object();
            #region Mapping Type
            switch (type)
            {
                
                case "area":
                    updateModel = DB_Service.Set<Area>().Single(x => x.ID == model.ID);
                    DB_Service.Attach<Area>(updateModel);
                    updateModel.CateCode = model.CateCode;
                    updateModel.CateName = model.CateName;
                    updateModel.PCateCode = model.PCateCode;
                    DB_Service.Commit();
                    result = new CategoryViewModel()
                    {
                        ID = updateModel.ID,
                        CateCode = updateModel.CateCode,
                        CateName = updateModel.CateName,
                        Length = updateModel.Length,
                        OrderIndex = updateModel.OrderIndex,
                        PCateCode = updateModel.PCateCode ?? string.Empty
                    };
                    break;
                case "formatcate":
                    FormatCate updateModel = DB_Service.Set<FormatCate>().Single(x => x.ID == model.ID);
                    DB_Service.Attach<FormatCate>(updateModel);
                    updateModel.CateCode = model.CateCode;
                    updateModel.CateName = model.CateName;
                    updateModel.PCateCode = model.PCateCode;
                    DB_Service.Commit();
                    result = new CategoryViewModel()
                    {
                        ID = updateModel.ID,
                        CateCode = updateModel.CateCode,
                        CateName = updateModel.CateName,
                        Length = updateModel.Length,
                        OrderIndex = updateModel.OrderIndex,
                        PCateCode = updateModel.PCateCode ?? string.Empty
                    };
                    break;
                case "outdoormediacate":
                    result = DB_Service.Set<OutDoorMediaCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "ownercate":
                    result = DB_Service.Set<OwnerCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companybussiness":
                    result = DB_Service.Set<CompanyBussiness>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companyfund":
                    result = DB_Service.Set<CompanyFund>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                case "companyscale":
                    result = DB_Service.Set<CompanyScale>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();

                    break;
                case "periodcate":
                    result = DB_Service.Set<PeriodCate>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
                default:
                    result = DB_Service.Set<Area>().OrderBy(x => x.CateCode).Select(x => new CategoryViewModel()
                    {
                        ID = x.ID,
                        CateCode = x.CateCode,
                        CateName = x.CateName,
                        Length = x.Length,
                        OrderIndex = x.OrderIndex,
                        PCateCode = x.PCateCode ?? string.Empty
                    }).ToList();
                    break;
            }
            #endregion
            return result;
        }
        public ActionResult Editing_Read([DataSourceRequest] DataSourceRequest request, string type)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            var Source = GetDataSource(type);
            return Json(Source.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Create([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<CategoryViewModel> CategoryViewModels)
        {
            var results = new List<CategoryViewModel>();

            if (CategoryViewModels != null && ModelState.IsValid)
            {
                foreach (var CategoryViewModel in CategoryViewModels)
                {

                    OutDoorMediaCate.PCateCode = OutDoorMediaCate.PCateCode ?? string.Empty;
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
                        target.PCateCode = OutDoorMediaCate.PCateCode ?? string.Empty;
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

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
    public class ListController : Controller
    {
        private IMemberService memberService;
        private IAreaAttService areaAttService;
        private IAreaService areaService;
        private IOutDoorMediaCateService outDoorMediaCateService;
        private IOutDoorService outDoorService;
        private IFormatCateService formatCateService;
        private ICompanyBussinessService companyBussinessService;
        private ICompanyFundService companyFundService;
        private ICompanyScaleService companyScaleService;
        private IPeriodCateService periodCateService;
        private IOwnerCateService ownerCateService;
        private IAuctionCalendarService auctionCalendarService;
        public ListController(
            IMemberService _memberService
            , IAreaAttService _areaAttService
            , IAreaService _areaService
            , IOutDoorMediaCateService _outDoorMediaCateService
            , IOutDoorService _outDoorService
            , IFormatCateService _formatCateService
            , ICompanyBussinessService _companyBussinessService
            , ICompanyFundService _companyFundService
            , ICompanyScaleService _companyScaleService
            , IPeriodCateService _periodCateService
            , IOwnerCateService _ownerCateService
            , IAuctionCalendarService _auctionCalendarService
            )
        {

            areaAttService = _areaAttService;
            areaService = _areaService;
            memberService = _memberService;
            outDoorMediaCateService = _outDoorMediaCateService;
            outDoorService = _outDoorService;
            formatCateService = _formatCateService;
            companyBussinessService = _companyBussinessService;
            companyFundService = _companyFundService;
            companyScaleService = _companyScaleService;
            periodCateService = _periodCateService;
            ownerCateService = _ownerCateService;
            auctionCalendarService = _auctionCalendarService;
        }


        public ActionResult Index(string category)
        {
            ListViewModel model = new ListViewModel();
            model.ListMenu = GetListMenu(category);
            model.HotList = GetHotList();
            model.SuggestList = GetSuggestList();
            model.CompanyList = GetCompanyList();
            return View(model);
        }

        private TopHotListMenuViewModel GetListMenu(string catecode)
        {
            TopHotListMenuViewModel model = new TopHotListMenuViewModel();

            var category = outDoorMediaCateService.IncludeGetALL().ToList();

            foreach (var item in category)
            {
                CategoryListViewModel clvm = new CategoryListViewModel();

                CategoryViewModel cvm = new CategoryViewModel()
                {
                    CID = item.CateCode,
                    Name = item.CateName,
                    Selected = catecode.StartsWith(item.CateCode, StringComparison.CurrentCultureIgnoreCase),
                    Url = Url.Action("index", "list", new { category = item.CateCode })
                };

                clvm.Category = cvm;

                List<CategoryViewModel> ChildCategories = item.ChildCategoies.Select(x => new CategoryViewModel
                {
                    CID = x.CateCode,
                    Name = x.CateName,
                    Selected = x.CateCode.Equals(catecode, StringComparison.CurrentCultureIgnoreCase),
                    Url = Url.Action("index", "list", new { category = x.CateCode })

                }).ToList();

                clvm.ChildCategories = ChildCategories;

                model.Items.Add(clvm);
            }
            return model;
        }


        private ListProductViewModel GetHotList()
        {
            ListProductViewModel model = new ListProductViewModel();
            model.Name = "热门资源";
            var product = outDoorService.GetVerifyList(OutDoorStatus.ShowOnline, true).Take(8).ToList();
            model.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price,
                City = x.City,
                Province = x.Province
            }).ToList();
            return model;
        }

        private ListProductViewModel GetSuggestList()
        {
            ListProductViewModel model = new ListProductViewModel();
            model.Name = "推荐资源";
            var product = outDoorService.GetVerifyList(OutDoorStatus.ShowOnline, true).Take(6).ToList();
            model.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price,
                City = x.City,
                Province = x.Province
            }).ToList();
            return model;
        }

        private ListLinksViewModel GetCompanyList()
        {
            ListLinksViewModel model = new ListLinksViewModel();
            var product = outDoorService.GetVerifyList(OutDoorStatus.ShowOnline, true).Take(5).ToList();
            model.Items = product.Select(x => new CategoryViewModel()
            {
                CID = x.MediaID.ToString(),
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Url = Url.Action("index", "list", new { category = x.MediaCode })
            }).ToList();
            return model;
        }
    }
}

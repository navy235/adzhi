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
    public class HomeController : Controller
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
        public HomeController(
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

        public ActionResult Index()
        {
            HomeViewModel model = new HomeViewModel();

            model.TopHot = new TopHotViewModel();
            model.TopHot.TopHotListMenu = GetTopHotListMenu();
            model.TopHot.SliderBox = GetSliderBox();
            model.TopHot.SliderTabBox = GetSliderTabBox();


            return View(model);
        }

        private TopHotListMenuViewModel GetTopHotListMenu()
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
                    Url = Url.Action("index", "category", new { id = item.CateCode })
                };

                clvm.Category = cvm;

                List<CategoryViewModel> ChildCategories = item.ChildCategoies.Select(x => new CategoryViewModel
                {
                    CID = x.CateCode,
                    Name = x.CateName,
                    Url = Url.Action("index", "category", new { id = x.CateCode })

                }).ToList();

                clvm.ChildCategories = ChildCategories;

                model.Items.Add(clvm);
            }
            return model;
        }

        private SliderBoxViewModel GetSliderBox()
        {
            SliderBoxViewModel model = new SliderBoxViewModel();

            model.Items.Add(new CategoryViewModel()
            {
                CID = "1",
                ImgUrl = Url.Content("~/Content/images/slider/1.jpg"),
                Url = Url.Action("index", "category", new { id = "1" })
            });
            model.Items.Add(new CategoryViewModel()
            {
                CID = "2",
                ImgUrl = Url.Content("~/Content/images/slider/2.jpg"),
                Url = Url.Action("index", "category", new { id = "2" })
            });
            model.Items.Add(new CategoryViewModel()
            {
                CID = "3",
                ImgUrl = Url.Content("~/Content/images/slider/3.jpg"),
                Url = Url.Action("index", "category", new { id = "3" })
            });
            model.Items.Add(new CategoryViewModel()
            {
                CID = "4",
                ImgUrl = Url.Content("~/Content/images/slider/4.jpg"),
                Url = Url.Action("index", "category", new { id = "4" })
            });
            model.Items.Add(new CategoryViewModel()
            {
                CID = "5",
                ImgUrl = Url.Content("~/Content/images/slider/5.jpg"),
                Url = Url.Action("index", "category", new { id = "5" })
            });

            return model;
        }

        private SliderTabBoxViewModel GetSliderTabBox()
        {
            SliderTabBoxViewModel model = new SliderTabBoxViewModel();

            SliderTabContainerViewModel tab = new SliderTabContainerViewModel();
            tab.Name = "惊爆特价";
            var product = outDoorService.GetVerifyList(OutDoorStatus.ShowOnline, true).Take(8).ToList();
            tab.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price
            }).ToList();

            model.Tabs.Add(tab);

            tab = new SliderTabContainerViewModel();
            tab.Name = "每日优选";
            tab.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price
            }).ToList();
            model.Tabs.Add(tab);

            tab = new SliderTabContainerViewModel();
            tab.Name = "本周热卖";
            tab.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price
            }).ToList();
            model.Tabs.Add(tab);

            tab = new SliderTabContainerViewModel();
            tab.Name = "新品上架";
            tab.Items = product.Select(x => new ProductViewModel()
            {
                ID = x.MediaID,
                ImgUrl = x.FocusImg,
                Name = x.Name,
                Price = x.Price
            }).ToList();
            model.Tabs.Add(tab);


            return model;
        }

    }

}

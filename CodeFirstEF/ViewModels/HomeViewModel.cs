using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace CodeFirstEF.ViewModels
{
    public class HomeViewModel
    {

        public TopHotViewModel TopHot { get; set; }

        public MainHotViewModel MainHot { get; set; }



    }

    public class TopMenuViewModel
    {

    }

    public class TopListMenuViewModel
    {

    }

    public class TopHotViewModel
    {
        public TopHotListMenuViewModel TopHotListMenu { get; set; }

        public SliderBoxViewModel SliderBox { get; set; }

        public SliderTabBoxViewModel SliderTabBox { get; set; }
    }

    public class TopHotListMenuViewModel
    {
        public TopHotListMenuViewModel()
        {
            this.Items = new List<CategoryListViewModel>();
        }
        public List<CategoryListViewModel> Items { get; set; }
    }

    public class SliderBoxViewModel
    {
        public SliderBoxViewModel()
        {
            this.Items = new List<CategoryViewModel>();
        }

        public List<CategoryViewModel> Items { get; set; }
    }

    public class ProductViewModel
    {
        public string ImgUrl { get; set; }

        public int ID { get; set; }

        public string Name { get; set; }

        public decimal Price { get; set; }

        public string Province { get; set; }

        public string City { get; set; }
    }

    public class CategoryViewModel
    {
        public string ImgUrl { get; set; }

        public string CID { get; set; }

        public string CssClass { get; set; }

        public string Name { get; set; }

        public string Url { get; set; }
    }

    public class CategoryListViewModel
    {
        public CategoryViewModel Category { get; set; }

        public List<CategoryViewModel> ChildCategories { get; set; }
    }


    public class SliderTabBoxViewModel
    {
        public SliderTabBoxViewModel()
        {
            this.Tabs = new List<SliderTabContainerViewModel>();
        }

        public List<SliderTabContainerViewModel> Tabs { get; set; }
    }

    public class SliderTabContainerViewModel
    {
        public SliderTabContainerViewModel()
        {
            this.Items = new List<ProductViewModel>();
        }

        public string Name { get; set; }


        public List<ProductViewModel> Items { get; set; }
    }


    public class MainHotViewModel
    {

        public MainHotLeftLinksViewModel MainHotLeftLinks { get; set; }
        public MainHotLeftBoxViewModel MainHotLeftBox { get; set; }
        public MainHotRightLinksViewModel MainHotRightLinks { get; set; }
        public MainHotLinksViewModel MainHotLinks { get; set; }
        public MainGalleryViewModel MainGallery { get; set; }
    }

    public class MainHotLeftLinksViewModel
    {
        public MainHotLeftLinksViewModel()
        {
            this.Items = new List<CategoryViewModel>();
        }
        public List<CategoryViewModel> Items { get; set; }
    }


    public class MainHotLeftBoxViewModel
    {
        public MainHotLeftBoxViewModel()
        {
            this.Items = new List<CategoryViewModel>();
        }
        public List<CategoryViewModel> Items { get; set; }
    }

    public class MainHotRightLinksViewModel
    {
        public MainHotRightLinksViewModel()
        {
            this.Items = new List<CategoryViewModel>();
        }
        public List<CategoryViewModel> Items { get; set; }
    }


    public class MainHotLinksViewModel
    {
        public MainHotLinksViewModel()
        {
            this.Items = new List<CategoryListViewModel>();
        }
        public List<CategoryListViewModel> Items { get; set; }
    }

    public class MainGalleryViewModel
    {
        public MainGalleryViewModel()
        {
            this.Items = new List<MainGalleryContainerViewModel>();
        }
        public List<MainGalleryContainerViewModel> Items { get; set; }
    }

    public class MainGalleryContainerViewModel
    {

        public MainGalleryContainerViewModel()
        {
            this.Items = new List<MainGalleryItemViewModel>();
        }
        public CategoryViewModel Category { get; set; }

        public ProductViewModel SuggestItem { get; set; }

        public List<MainGalleryItemViewModel> Items { get; set; }

    }

    public class MainGalleryItemViewModel
    {

        public MainGalleryItemViewModel()
        {
            this.Items = new List<ProductViewModel>();
            this.TopItems = new List<ProductViewModel>();
        }

        public string Name { get; set; }

        public List<ProductViewModel> Items { get; set; }

        public List<ProductViewModel> TopItems { get; set; }

    }
}
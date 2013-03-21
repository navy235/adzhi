using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace CodeFirstEF.ViewModels
{
    public class HomeViewModel
    {
        //public TopMenuViewModel TopMenu { get; set; }

        //public TopListMenuViewModel TopListMenu { get; set; }

        public TopHotViewModel TopHot { get; set; }



        public MainHotViewModel MainHot { get; set; }

        public MainGalleryViewModel MainGallery { get; set; }

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
        public MainHotLeftViewModel MainHotLeft { get; set; }
        public MainHotLeftLinksViewModel MainHotLeftLinks { get; set; }
        public MainHotLeftBoxViewModel MainHotLeftBox { get; set; }
        public MainHotRightLinksViewModel MainHotRightLinks { get; set; }
        public MainHotLinksViewModel MainHotLinks { get; set; }
    }

    public class MainHotLeftViewModel
    {
        public MainHotLeftLinksViewModel LeftLinks { get; set; }
    }

    public class MainHotLeftLinksViewModel
    {
        public List<CategoryViewModel> Items { get; set; }
    }


    public class MainHotLeftBoxViewModel
    {
        public List<CategoryViewModel> Items { get; set; }
    }

    public class MainHotRightLinksViewModel
    {
        public List<CategoryViewModel> Items { get; set; }
    }


    public class MainHotLinksViewModel
    {
        public List<CategoryListViewModel> Items { get; set; }
    }

    public class MainGalleryViewModel
    {
        public List<MainGalleryContainerViewModel> Items { get; set; }
    }

    public class MainGalleryContainerViewModel
    {
        public CategoryViewModel Category { get; set; }

        public ProductViewModel SuggestItem { get; set; }

        public List<MainGalleryItemViewModel> Items { get; set; }

    }

    public class MainGalleryItemViewModel
    {
        public string Name { get; set; }

        public List<ProductViewModel> Items { get; set; }

        public List<ProductViewModel> TopItems { get; set; }

    }
}
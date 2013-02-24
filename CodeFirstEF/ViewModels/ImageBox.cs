using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeFirstEF.ViewModels
{
    public class ImageBox
    {
        public string ImgUrl { get; set; }

        public int MinImgSize { get; set; }

        public int MidImgSize { get; set; }

        public int MaxImgSize { get; set; }

    }
}
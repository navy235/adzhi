using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Configuration;
using Context = System.Web.HttpContext;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.Mvc;
using System.Web.Routing;


namespace CoreHelper.Http
{
    public static class HttpHelper
    {
        /// <summary>
        /// 获取访问者客户端IP
        /// </summary>
        public static string IP
        {
            get
            {
                string _ip = Context.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (_ip == null || _ip == "" || _ip == "unknown") { _ip = Context.Current.Request.ServerVariables["REMOTE_ADDR"]; }
                if (_ip == null || _ip == "" || _ip == "unknown") { _ip = Context.Current.Request.UserHostAddress; }
                if (_ip.Contains(",")) { _ip = _ip.Split(',')[0]; }

                return _ip;
            }
        }

        public static string GetImgBoxUrl(this HtmlHelper htmlHelper, int ImageSize, string ImageUrl)
        {
            string result = string.Empty;
            if (ImageUrl.IndexOf("_") > -1)
            {
                result = ImageUrl.Substring(0, ImageUrl.LastIndexOf("_"))
                    + "_" + ImageSize +
                    ImageUrl.Substring(ImageUrl.LastIndexOf("."));
            }
            else
            {
                result = ImageUrl.Substring(0, ImageUrl.LastIndexOf("."))
                      + "_" + ImageSize +
                      ImageUrl.Substring(ImageUrl.LastIndexOf("."));
            }
            return result;
        }




    }
}

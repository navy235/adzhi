using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreHelper.Cookie;
namespace CodeFirstEF.Filters
{
    public class BaseAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return CookieHelper.IsLogin;
        }
    }
}

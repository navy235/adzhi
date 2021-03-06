﻿using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Data.Entity;
using CoreHelper.Cookie;
using CoreHelper.Error;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CoreHelper.Data.Interface;


namespace CodeFirstEF.Filters
{
    public class BaseAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return CookieHelper.IsLogin;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext context)
        {
            if (context.HttpContext.Request.IsAjaxRequest())
            {
                var urlHelper = new UrlHelper(context.RequestContext);
                context.HttpContext.Response.StatusCode = 403;
                context.Result = new JsonResult
                {
                    Data = new
                    {
                        Error = "NotAuthorized",
                        LogOnUrl = urlHelper.Action("index", "login")
                    },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
            else
            {
                context.Result = new RedirectToRouteResult(
                                       new RouteValueDictionary 
                                   {
                                       { "action", "index" },

                                       { "controller", "error" },

                                       { "id", (int)ErrorType.NoLogin},

                                       {"returnurl",context.RequestContext.HttpContext.Request.Url}
                                   });
            }
        }
    }
}

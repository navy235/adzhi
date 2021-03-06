﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreHelper.Enum;
using CoreHelper.Error;
namespace CodeFirstEF.Controllers
{
    public class ErrorController : Controller
    {
        //
        // GET: /Error/

        public ActionResult Index(int id = 0, string returnurl = null)
        {
            ViewBag.Message = id;
            return Content(string.Format("<script>window.top.location.href='{0}'</script>", Url.Action("Index", "Login", new { ReturnUrl = returnurl })));
        }

    }
}

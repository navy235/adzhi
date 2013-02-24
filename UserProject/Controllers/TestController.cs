using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using UserProject.Models;
using UserProject.Concrete;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Filters;
using CoreHelper.Data.Interface;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace UserProject.Controllers
{
    public class TestController : Controller
    {
        //
        // GET: /Test/
        [Permission]
        public ActionResult Index()
        {
            return View();
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreHelper.Filters;

namespace UserProject.Controllers
{
    public class ValidController : Controller
    {
        //
        // GET: /Valid/
        [Permission]
        public ActionResult Index()
        {
            return View();
        }

    }
}

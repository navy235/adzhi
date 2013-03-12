using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.Entity.Validation;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CodeFirstEF.Models;
using CodeFirstEF.Concrete;
using CodeFirstEF.ViewModels;
using Kendo.Mvc.Extensions;
namespace CodeFirstEF.Controllers
{
    public class OutDoorController : Controller
    {
        //
        // GET: /OutDoor/
        private IUnitOfWork DB_Service;

        public OutDoorController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index(int id = 1)
        {
            OutDoor od = new OutDoor();
            od = DB_Service.Set<OutDoor>()
                .Include(x => x.MediaImg)
                .Include(x => x.MapImg)
                .Include(x => x.AreaAtt)
                .Single(x => x.MediaID == id);

            ViewBag.ImgBoxs = od.MediaImg.ImgUrls.Split(',').Select(x => new ImageBox()
            {
                ImgUrl = x,
                MinImgSize = 120,
                MidImgSize = 430,
                MaxImgSize = 800
            });

            return View(od);
        }

    }
}

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
    public class HomeController : Controller
    {
        // GET: /Area/
        private IUnitOfWork DB_Service;

        public HomeController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {

            ViewBag.Data_AreaAtt = DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.AttName
            }).ToList();
            return View(new OutDoorViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(OutDoorViewModel um)
        {
            OutDoor od = new OutDoor();
            var AreaAttArray = new List<int>();
            if (!TryUpdateModel(um))
            {
                ViewBag.Error = "Update Failure";
            }
            else
            {
                try
                {
                    od.AddIP = HttpHelper.IP;
                    od.AddTime = DateTime.Now;
                    od.AdminUser = 200001;
                    od.CityCode = um.CityCode;
                    od.Description = um.Description;
                    od.FormatCode = um.FormatCode;
                    od.HasLight = um.HasLight;



                    od.Integrity = 80;
                    od.LastIP = HttpHelper.IP;
                    od.LastTime = DateTime.Now;
                    od.Lat = Convert.ToDecimal(um.Position.Split('|')[0]);

                    od.Lng = Convert.ToDecimal(um.Position.Split('|')[1]);

                    od.Location = um.Location;
                    od.MeberID = 200013;
                    od.MeidaCode = um.MeidaCode;

                    od.Name = um.Name;
                    od.PeriodCode = um.PeriodCode;
                    od.Price = um.Price;
                    od.PriceExten = um.PriceExten;
                    od.SeoDes = um.Description;
                    od.SeoTitle = um.Name;
                    od.Seokeywords = um.Name;


                    od.TrafficAuto = um.TrafficAuto;
                    od.TrafficPerson = um.TrafficPerson;
                    od.Unapprovedlog = string.Empty;



                    MediaImg media = new MediaImg()
                    {
                        FocusImgUrl = um.MediaImg.Split(',')[0],
                        ImgUrls = um.MediaImg,
                        MemberID = 200013
                    };
                    od.MediaImg = media;

                    AreaAttArray = um.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
                    var AreaAttList = DB_Service.Set<AreaAtt>().Where(x => AreaAttArray.Contains(x.ID));
                    od.AreaAtt.AddRange(AreaAttList);

                    CredentialsImg credent = new CredentialsImg()
                    {
                        FocusImgUrl = um.CredentialsImg.Split(',')[0],
                        ImgUrls = um.CredentialsImg,
                        MemberID = 200013
                    };


                    Owner or = new Owner();
                    or.CredentialsImg = credent;
                    or.Deadline = um.Deadline;
                    or.OwnerCate = DB_Service.Set<OwnerCate>().Single(x => x.CateCode.Equals(um.OwnerCode, StringComparison.CurrentCultureIgnoreCase));
                    od.Owner = or;

                    DB_Service.Add<OutDoor>(od);
                    DB_Service.Commit();
                }
                catch (DbEntityValidationException ex)
                {
                    ViewBag.Error = ex.Message;
                }

            }

            ViewBag.Data_AreaAtt = DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.AttName,
                Selected = AreaAttArray.Contains(x.ID)
            }).ToList();
            return View(um);
        }


        public ActionResult Edit(int id)
        {
            OutDoorViewModel odv = new OutDoorViewModel();
            OutDoor od = new OutDoor();
            od = DB_Service.Set<OutDoor>()
                .Include(x => x.MediaImg)
                .Include(x => x.MapImg)
                .Include(x => x.Owner)
                .Include(x => x.AreaAtt)
                .Single(x => x.MediaID == id);

            odv.MediaID = od.MediaID;
            odv.AreaAtt = String.Join(",", od.AreaAtt.Select(x => x.ID));
            odv.CityCode = od.CityCode;
            odv.CredentialsImg = od.Owner.CredentialsImg.ImgUrls;
            odv.Deadline = od.Owner.Deadline;
            odv.Description = od.Description;
            odv.EndTime = DateTime.Now;
            odv.StartTime = DateTime.Now;

            odv.TrafficAuto = od.TrafficAuto;
            odv.TrafficPerson = od.TrafficPerson;

            odv.FormatCode = od.FormatCode;
            odv.HasLight = od.HasLight;


            odv.Location = od.Location;

            odv.MediaImg = od.MediaImg.ImgUrls;
            odv.MeidaCode = od.MeidaCode;
            odv.Name = od.Name;
            odv.OwnerCode = od.Owner.OwnerCode;
            odv.PeriodCode = od.PeriodCode;
            odv.Position = od.Lat + "|" + od.Lng;
            odv.Price = od.Price;
            odv.PriceExten = od.PriceExten;

            ViewBag.Data_AreaAtt = DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.AttName,
                Selected = od.AreaAtt.Select(a => a.ID).Contains(x.ID)

            }).ToList();
            return View(odv);
        }


        public ActionResult Map()
        {
            return View();
        }


        public ActionResult Test()
        {
            return View();
        }


    }


}

using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.Entity;
using CoreHelper.Checking;
using CoreHelper.Http;
using CoreHelper.Enum;
using CoreHelper.Cookie;
using CoreHelper.Data.Interface;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using Kendo.Mvc.Extensions;
namespace CodeFirstEF.Serivces
{
    public class OutDoorService : IOutDoorService
    {
        private readonly IUnitOfWork DB_Service;

        private readonly IAreaAttService AreaAttService;
        private readonly IOwnerCateService OwnerCateService;
        public OutDoorService(IUnitOfWork DB_Service
            , IAreaAttService AreaAttService
            , IOwnerCateService OwnerCateService)
        {
            this.DB_Service = DB_Service;
            this.AreaAttService = AreaAttService;
            this.OwnerCateService = OwnerCateService;
        }

        public OutDoor Create(OutDoorViewModel model)
        {
            OutDoor od = new OutDoor();
            od.AddIP = HttpHelper.IP;
            od.AddTime = DateTime.Now;
            od.CityCode = model.CityCode;
            od.Description = model.Description;
            od.FormatCode = model.FormatCode;
            od.HasLight = model.HasLight;
            od.Integrity = 80;
            od.LastIP = HttpHelper.IP;
            od.LastTime = DateTime.Now;
            od.Lat = Convert.ToDecimal(model.Position.Split('|')[0]);
            od.Lng = Convert.ToDecimal(model.Position.Split('|')[1]);
            od.Location = model.Location;
            od.MemberID = Convert.ToInt32(CookieHelper.UID);
            od.MeidaCode = model.MeidaCode;
            od.Name = model.Name;
            od.PeriodCode = model.PeriodCode;
            od.Price = model.Price;
            od.PriceExten = model.PriceExten;
            od.SeoDes = model.Description;

            od.SeoTitle = model.Name;

            od.Seokeywords = model.Name;

            od.TrafficAuto = model.TrafficAuto;
            od.TrafficPerson = model.TrafficPerson;
            od.Unapprovedlog = string.Empty;

            MediaImg media = new MediaImg()
            {
                FocusImgUrl = model.MediaImg.Split(',')[0],
                ImgUrls = model.MediaImg,
                MemberID = Convert.ToInt32(CookieHelper.UID)
            };
            od.MediaImg = media;

            var AreaAttArray = model.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
            var AreaAttList = AreaAttService.GetList(AreaAttArray);

            od.AreaAtt.AddRange(AreaAttList);

            CredentialsImg credent = new CredentialsImg()
            {
                FocusImgUrl = model.CredentialsImg.Split(',')[0],
                ImgUrls = model.CredentialsImg,
                MemberID = Convert.ToInt32(CookieHelper.UID)
            };

            Owner or = new Owner();
            or.CredentialsImg = credent;
            or.Deadline = model.Deadline;
            or.OwnerCate = OwnerCateService.Find(model.OwnerCode);
            od.Owner = or;

            DB_Service.Add<OutDoor>(od);
            DB_Service.Commit();


            return od;
        }


        public IEnumerable<OutDoor> GetOutDoorByMember(int MemebrID)
        {
            return DB_Service.Set<OutDoor>().Where(x => x.MemberID == MemebrID);
        }

        public IEnumerable<OutDoor> GetKenDoOutDoorByMember(int MemebrID)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<OutDoor>().Where(x => x.MemberID == MemebrID);
        }
    }
}
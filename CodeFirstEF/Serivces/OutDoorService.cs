﻿using System;
using System.Linq;
using System.Linq.Expressions;
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

            int MemberID = Convert.ToInt32(CookieHelper.UID);
            OutDoor od = new OutDoor();
            od.AddIP = HttpHelper.IP;
            od.AddTime = DateTime.Now;
            od.CityCode = model.CityCode;
            od.Description = model.Description;
            od.FormatCode = model.FormatCode;
            od.HasLight = model.HasLight;
            od.LastIP = HttpHelper.IP;
            od.LastTime = DateTime.Now;
            od.Lat = Convert.ToDecimal(model.Position.Split('|')[0]);
            od.Lng = Convert.ToDecimal(model.Position.Split('|')[1]);
            od.Location = model.Location;
            od.MemberID = MemberID;
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


            //Area参数设置
            if (!string.IsNullOrEmpty(model.Area) && model.Area.Split('|').Length == 3)
            {
                var areaArray = model.Area.Split('|');
                od.Wdith = Convert.ToDecimal(areaArray[0]);
                od.Height = Convert.ToDecimal(areaArray[1]);
                od.TotalFaces = Convert.ToInt32(areaArray[2]);
            }
            //Light Time 设置
            if (model.HasLight)
            {
                if (!string.IsNullOrEmpty(model.LightTime) && model.LightTime.Split('|').Length == 2)
                {
                    var LightTime = model.LightTime.Split('|');
                    od.LightStrat = LightTime[0];
                    od.LightEnd = LightTime[1];
                }
            }

            MediaImg media = new MediaImg()
            {
                FocusImgUrl = model.MediaImg.Split(',')[0],
                ImgUrls = model.MediaImg,
                MemberID = MemberID
            };
            od.MediaImg = media;

            var AreaAttArray = model.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
            var AreaAttList = AreaAttService.GetList(AreaAttArray);

            od.AreaAtt.AddRange(AreaAttList);

            CredentialsImg credent = new CredentialsImg()
            {
                FocusImgUrl = model.CredentialsImg.Split(',')[0],
                ImgUrls = model.CredentialsImg,
                MemberID = MemberID
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

        public OutDoor Update(OutDoorViewModel model)
        {

            int MemberID = Convert.ToInt32(CookieHelper.UID);
            OutDoor od = IncludeFind(model.MediaID);
            DB_Service.Attach<OutDoor>(od);
            od.CityCode = model.CityCode;
            od.PeriodCode = model.PeriodCode;
            od.MeidaCode = model.MeidaCode;
            od.FormatCode = model.FormatCode;

            od.Description = model.Description;
            od.HasLight = model.HasLight;
            od.LastIP = HttpHelper.IP;
            od.LastTime = DateTime.Now;
            od.Lat = Convert.ToDecimal(model.Position.Split('|')[0]);
            od.Lng = Convert.ToDecimal(model.Position.Split('|')[1]);
            od.Location = model.Location;
            od.MemberID = MemberID;
            od.Name = model.Name;
            od.Price = model.Price;
            od.PriceExten = model.PriceExten;
            od.SeoDes = model.Description;

            od.SeoTitle = model.Name;

            od.Seokeywords = model.Name;

            od.TrafficAuto = model.TrafficAuto;
            od.TrafficPerson = model.TrafficPerson;
            od.Unapprovedlog = string.Empty;


            //Area参数设置
            if (!string.IsNullOrEmpty(model.Area) && model.Area.Split('|').Length == 3)
            {
                var areaArray = model.Area.Split('|');
                od.Wdith = Convert.ToDecimal(areaArray[0]);
                od.Height = Convert.ToDecimal(areaArray[1]);
                od.TotalFaces = Convert.ToInt32(areaArray[2]);
            }
            //Light Time 设置
            if (model.HasLight)
            {
                if (!string.IsNullOrEmpty(model.LightTime) && model.LightTime.Split('|').Length == 2)
                {
                    var LightTime = model.LightTime.Split('|');
                    od.LightStrat = LightTime[0];
                    od.LightEnd = LightTime[1];
                }
            }
            od.MediaImg.ImgUrls = model.MediaImg;
            od.MediaImg.FocusImgUrl = model.MediaImg.Split(',')[0];

            var AreaAttArray = model.AreaAtt.Split(',').Select(x => Convert.ToInt32(x)).ToList();
            if (AreaAttArray.Count == 0)
            {
                od.AreaAtt = new List<AreaAtt>();
            }
            else
            {
                var AreaAttList = AreaAttService.GetList(AreaAttArray);
                var currentAreaAttArray = od.AreaAtt.Select(x => x.ID).ToList();

                foreach (AreaAtt rl in AreaAttService.GetList())
                {
                    if (AreaAttArray.Contains(rl.ID))
                    {
                        if (!currentAreaAttArray.Contains(rl.ID))
                        {
                            od.AreaAtt.Add(rl);
                        }
                    }
                    else
                    {
                        if (currentAreaAttArray.Contains(rl.ID))
                        {
                            od.AreaAtt.Remove(rl);
                        }
                    }
                }
            }
            od.Owner.OwnerCode = model.OwnerCode;
            od.Owner.OwnerCate = OwnerCateService.Find(model.OwnerCode);
            od.Owner.CredentialsImg.FocusImgUrl = model.CredentialsImg.Split(',')[0];
            od.Owner.CredentialsImg.ImgUrls = model.CredentialsImg;
            od.Owner.Deadline = model.Deadline;
          

            DB_Service.Commit();

            return od;
        }

        public OutDoor IncludeFind(int MediaID)
        {
            return DB_Service.Set<OutDoor>()
                .Include(x => x.MediaImg)
                .Include(x => x.MapImg)
                .Include(x => x.Owner)
                .Include(x => x.AreaAtt)
                .Single(x => x.MediaID == MediaID);
        }
        public bool HasOutDoorByMember(int MediaID)
        {
            int MemberID = Convert.ToInt32(CookieHelper.UID);
            return DB_Service.Set<OutDoor>().Any(x => x.MemberID == MemberID && x.MediaID == MediaID);
        }


        public OutDoorViewModel GetOutDoorViewModel(int MediaID)
        {
            OutDoorViewModel odv = new OutDoorViewModel();
            int MemberID = Convert.ToInt32(CookieHelper.UID);

            OutDoor od = new OutDoor();
            od = IncludeFind(MediaID);
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
            odv.Location = od.Location;
            odv.MediaImg = od.MediaImg.ImgUrls;
            odv.MeidaCode = od.MeidaCode;
            odv.Name = od.Name;
            odv.OwnerCode = od.Owner.OwnerCode;
            odv.PeriodCode = od.PeriodCode;
            odv.Position = od.Lat + "|" + od.Lng;
            odv.Price = od.Price;
            odv.PriceExten = od.PriceExten;
            odv.Area = od.Wdith + "|" + od.Height + "|" + od.TotalFaces;
            odv.HasLight = od.HasLight;
            if (od.HasLight)
            {
                odv.LightTime = od.LightStrat + "|" + od.LightEnd;
            }

            return odv;
        }

        public IEnumerable<OutDoor> GetOutDoorByMember(int MemberID)
        {
            return DB_Service.Set<OutDoor>().Where(x => x.MemberID == MemberID);
        }

        public IEnumerable<OutDoor> GetKenDoOutDoorByMember(int MemberID)
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<OutDoor>().Where(x => x.MemberID == MemberID);
        }



    }
}
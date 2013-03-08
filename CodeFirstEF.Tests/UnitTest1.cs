using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Mvc;
using System.Linq;
using System.Data.Entity;
using CoreHelper.Checking;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CoreHelper.Data.Infrastructure;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.Lucene;

namespace CodeFirstEF.Tests
{
    [TestClass]
    public class UnitTest1
    {

        private IUnitOfWork _IUnitOfWork;

        public UnitTest1()
        {
            _IUnitOfWork = new CodeFirstContext();
        }

        [TestMethod]
        public void TestMethod1()
        {


            OutDoor od = new OutDoor();
            od.AddIP = "127.0.0.1";
            od.AddTime = DateTime.Now;
            od.AdminUser = 200001;
            od.CityCode = "001001";
            od.Description = "Description";
            od.Favorite = 1;
            od.FormatCode = "F01";
            od.HasLight = true;
            od.Height = 2.0M;
            od.Hit = 1;
            od.Integrity = 80;
            od.LastIP = "127.0.0.1";
            od.LastTime = DateTime.Now;
            od.Lat = 2.123434M;
            //od.LightStrat = new TimeSpan(18, 00, 00);
            //od.LightEnd = new TimeSpan(6, 00, 00);
            od.Lng = 2.123434M;
            od.Location = "解放东路二坊2034户";
            od.MemberID = 200013;
            od.MeidaCode = "D01008";
            od.Message = 3;
            od.Name = "解放东路二坊2034户";
            od.PeriodCode = "P01";
            od.Price = 38.3M;
            od.PriceExten = "买10个便宜一半";
            od.SeoDes = "解放东路二坊2034户";
            od.SeoTitle = "解放东路二坊2034户";
            od.Seokeywords = "解放东路二坊2034户";
            od.TotalFaces = 3;
            od.TrafficAuto = 13033;
            od.TrafficPerson = 13000;
            od.Unapprovedlog = string.Empty;
            od.Wdith = 3.00M;
            _IUnitOfWork.Add<OutDoor>(od);
            _IUnitOfWork.Commit();
        }


        [TestMethod]
        public void TestMethod2()
        {
            OutDoor od = new OutDoor();
            od = _IUnitOfWork.Set<OutDoor>()
                .Include(x => x.Area)
                .Include(x => x.PeriodCate)
                .Include(x => x.OutDoorMediaCate)
                .Include(x => x.FormatCate)
                .Include(x => x.AreaAtt)
                .OrderBy(x => x.MediaID).First();

            Console.WriteLine(od.AreaAtt.Count());

        }

        [TestMethod]
        public void TestMethod3()
        {
            BaseEfUnitOfWork content = new CodeFirstContext();
            LuceneIndexingService Service = new LuceneIndexingService(content);
            Service.UpdateIndex();
        }


    }
}

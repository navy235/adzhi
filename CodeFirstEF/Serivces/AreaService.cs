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

namespace CodeFirstEF.Serivces
{
    public class AreaService : IAreaService
    {
        private readonly IUnitOfWork DB_Service;

        public AreaService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public IQueryable<Area> GetALL()
        {
            return DB_Service.Set<Area>();
        }

        public IQueryable<Area> GetKendoALL()
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<Area>();
        }


        public void Create(Area model)
        {
            DB_Service.Add<Area>(model);
            DB_Service.Commit();
        }


        public void Update(Area model)
        {
            var target = Find(model.ID);
            DB_Service.Attach<Area>(target);
            target.CateName = model.CateName;
            target.CateCode = model.CateCode;
            target.PCateCode = model.PCateCode;
            DB_Service.Commit();
        }


        public Area Find(int PermissionID)
        {
            return DB_Service.Set<Area>().Single(x => x.ID == PermissionID);
        }

        public Area Find(string CateCode)
        {
            return DB_Service.Set<Area>().Single(x => x.CateCode == CateCode);
        }

        public void Delete(Area model)
        {
            var target = Find(model.ID);
            DB_Service.Remove<Area>(target);
            DB_Service.Commit();
        }
    }
}
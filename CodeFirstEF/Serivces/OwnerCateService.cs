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
    public class OwnerCateService : IOwnerCateService
    {
        private readonly IUnitOfWork DB_Service;

        public OwnerCateService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public IQueryable<OwnerCate> GetALL()
        {
            return DB_Service.Set<OwnerCate>();
        }

        public IQueryable<OwnerCate> GetKendoALL()
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<OwnerCate>();
        }


        public void Create(OwnerCate model)
        {
            DB_Service.Add<OwnerCate>(model);
            DB_Service.Commit();
        }


        public void Update(OwnerCate model)
        {
            var target = Find(model.ID);
            DB_Service.Attach<OwnerCate>(target);
            target.CateName = model.CateName;
            target.CateCode = model.CateCode;
            target.PCateCode = model.PCateCode;
            DB_Service.Commit();
        }


        public OwnerCate Find(int ID)
        {
            return DB_Service.Set<OwnerCate>().Single(x => x.ID == ID);
        }

        public OwnerCate Find(string CateCode)
        {
            return DB_Service.Set<OwnerCate>().Single(x => x.CateCode == CateCode);
        }

        public void Delete(OwnerCate model)
        {
            var target = Find(model.ID);
            DB_Service.Remove<OwnerCate>(target);
            DB_Service.Commit();
        }
    }
}
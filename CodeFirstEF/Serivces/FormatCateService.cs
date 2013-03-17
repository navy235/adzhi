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
    public class FormatCateService : IFormatCateService
    {
        private readonly IUnitOfWork DB_Service;

        public FormatCateService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public IQueryable<FormatCate> GetALL()
        {
            return DB_Service.Set<FormatCate>();
        }

        public IQueryable<FormatCate> GetKendoALL()
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<FormatCate>();
        }


        public void Create(FormatCate model)
        {
            DB_Service.Add<FormatCate>(model);
            DB_Service.Commit();
        }


        public void Update(FormatCate model)
        {
            var target = Find(model.ID);
            DB_Service.Attach<FormatCate>(target);
            target.CateName = model.CateName;
            target.CateCode = model.CateCode;
            target.PCateCode = model.PCateCode;
            DB_Service.Commit();
        }


        public FormatCate Find(int ID)
        {
            return DB_Service.Set<FormatCate>().Single(x => x.ID == ID);
        }

        public FormatCate Find(string CateCode)
        {
            return DB_Service.Set<FormatCate>().Single(x => x.CateCode == CateCode);
        }

        public void Delete(FormatCate model)
        {
            var target = Find(model.ID);
            DB_Service.Remove<FormatCate>(target);
            DB_Service.Commit();
        }
    }
}
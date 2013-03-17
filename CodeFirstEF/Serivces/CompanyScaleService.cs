﻿using System;
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
    public class CompanyScaleService : ICompanyScaleService
    {
        private readonly IUnitOfWork DB_Service;

        public CompanyScaleService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public IQueryable<CompanyScale> GetALL()
        {
            return DB_Service.Set<CompanyScale>();
        }

        public IQueryable<CompanyScale> GetKendoALL()
        {
            DB_Service.SetProxyCreationEnabledFlase();
            return DB_Service.Set<CompanyScale>();
        }


        public void Create(CompanyScale model)
        {
            DB_Service.Add<CompanyScale>(model);
            DB_Service.Commit();
        }


        public void Update(CompanyScale model)
        {
            var target = Find(model.ID);
            DB_Service.Attach<CompanyScale>(target);
            target.CateName = model.CateName;
            target.CateCode = model.CateCode;
            target.PCateCode = model.PCateCode;
            DB_Service.Commit();
        }


        public CompanyScale Find(int ID)
        {
            return DB_Service.Set<CompanyScale>().Single(x => x.ID == ID);
        }

        public CompanyScale Find(string CateCode)
        {
            return DB_Service.Set<CompanyScale>().Single(x => x.CateCode == CateCode);
        }

        public void Delete(CompanyScale model)
        {
            var target = Find(model.ID);
            DB_Service.Remove<CompanyScale>(target);
            DB_Service.Commit();
        }
    }
}
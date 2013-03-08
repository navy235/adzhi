using System;
using System.Linq;
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

        public OwnerCate Find(string CateCode)
        {
            return DB_Service.Set<OwnerCate>().Single(x => x.CateCode.Equals(CateCode, StringComparison.CurrentCultureIgnoreCase));
        }
    }
}
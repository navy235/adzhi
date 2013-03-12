using System;
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
    public class OwnerService : IOwnerService
    {
        private readonly IUnitOfWork DB_Service;

        public OwnerService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public Owner FindByMediaID(int MediaID)
        {
            return DB_Service.Set<Owner>()
                .Include(x => x.CredentialsImg)
                .Include(x => x.OwnerCate)
                .Where(x => x.MediaID == MediaID).Single();
        }
    }
}
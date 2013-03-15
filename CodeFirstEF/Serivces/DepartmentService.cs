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
    public class DepartmentService : IDepartmentService
    {
        private readonly IUnitOfWork DB_Service;

        public DepartmentService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public IEnumerable<Department> GetALL()
        {
            return DB_Service.Set<Department>();
        }
    }
}
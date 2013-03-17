using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface ICompanyBussinessService
    {
        IQueryable<CompanyBussiness> GetALL();

        IQueryable<CompanyBussiness> GetKendoALL();

        void Create(CompanyBussiness model);

        void Update(CompanyBussiness model);

        void Delete(CompanyBussiness model);

        CompanyBussiness Find(int CompanyBussinessID);

        CompanyBussiness Find(string CateCode);
    }
}
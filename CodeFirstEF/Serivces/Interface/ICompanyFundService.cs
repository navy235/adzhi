using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface ICompanyFundService
    {
        IQueryable<CompanyFund> GetALL();

        IQueryable<CompanyFund> GetKendoALL();

        void Create(CompanyFund model);

        void Update(CompanyFund model);

        void Delete(CompanyFund model);

        CompanyFund Find(int CompanyFundID);

        CompanyFund Find(string CateCode);
    }
}
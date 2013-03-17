using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface ICompanyScaleService
    {
        IQueryable<CompanyScale> GetALL();

        IQueryable<CompanyScale> GetKendoALL();

        void Create(CompanyScale model);

        void Update(CompanyScale model);

        void Delete(CompanyScale model);

        CompanyScale Find(int CompanyScaleID);

        CompanyScale Find(string CateCode);
    }
}
using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface ICompanyService
    {
        Company Create(CompanyReg model);

        Company Find(int MemberID);

        Company FindByCompanyID(int CompanyID);

        Company IncludeFindByCompanyID(int CompanyID);

        Company IncludeFind(int MemberID);

        IEnumerable<CompanyVerifyViewModel> GetVerifyList();
    }
}
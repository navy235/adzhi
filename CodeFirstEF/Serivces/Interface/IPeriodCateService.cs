using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IPeriodCateService
    {
        IQueryable<PeriodCate> GetALL();

        IQueryable<PeriodCate> GetKendoALL();

        void Create(PeriodCate model);

        void Update(PeriodCate model);

        void Delete(PeriodCate model);

        PeriodCate Find(int PeriodCateID);

        PeriodCate Find(string CateCode);
    }
}
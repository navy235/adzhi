using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IFormatCateService
    {
        IQueryable<FormatCate> GetALL();

        IQueryable<FormatCate> GetKendoALL();

        void Create(FormatCate model);

        void Update(FormatCate model);

        void Delete(FormatCate model);

        FormatCate Find(int FormatCateID);

        FormatCate Find(string CateCode);


    }
}
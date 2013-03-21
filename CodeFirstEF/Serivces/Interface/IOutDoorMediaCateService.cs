using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;
using CodeFirstEF.Utils;

namespace CodeFirstEF.Serivces
{
    public interface IOutDoorMediaCateService
    {
        IQueryable<OutDoorMediaCate> GetALL();

        IQueryable<OutDoorMediaCate> IncludeGetALL();

        IQueryable<OutDoorMediaCate> GetKendoALL();

        void Create(OutDoorMediaCate model);

        ServiceResult Update(OutDoorMediaCate model);

        void Delete(OutDoorMediaCate model);

        OutDoorMediaCate Find(int OutDoorMediaCateID);

        OutDoorMediaCate Find(string CateCode);
    }
}
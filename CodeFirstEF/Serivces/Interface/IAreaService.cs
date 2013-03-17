using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IAreaService
    {
        IQueryable<Area> GetALL();

        IQueryable<Area> GetKendoALL();

        void Create(Area model);

        void Update(Area model);

        void Delete(Area model);

        Area Find(int AreaID);

        Area Find(string CateCode);
    }
}
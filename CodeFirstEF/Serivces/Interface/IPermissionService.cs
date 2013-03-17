using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IPermissionService
    {
        IQueryable<Permissions> GetALL();

        IQueryable<Permissions> GetKendoALL();

        IQueryable<Permissions> GetALL(IEnumerable<int> IDs);


        void Create(Permissions model);

        void Update(Permissions model);

        void Delete(Permissions model);

        Permissions Find(int PermissionID);
    }
}
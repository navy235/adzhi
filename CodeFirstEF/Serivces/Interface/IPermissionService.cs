using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IPermissionService
    {
        IEnumerable<Permissions> GetALL();

        IEnumerable<Permissions> GetKendoALL();

        void Create(Permissions model);

        void Update(Permissions model);

        void Delete(Permissions model);

        Permissions Find(int PermissionID);
    }
}
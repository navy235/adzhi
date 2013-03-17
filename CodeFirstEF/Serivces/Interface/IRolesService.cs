using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IRoleService
    {
        IQueryable<Roles> GetALL();

        IQueryable<Roles> GetALL(IEnumerable<int> IDs);

        IQueryable<Roles> GetKendoALL();

        void Create(Roles model);

        void Update(Roles model);

        void Update(RoleModel model);

        void Delete(Roles model);

        Roles Find(int RoleID);

        Roles IncludeFind(int RoleID);

        Roles IncludePermissionsFind(int RoleID);
    }
}
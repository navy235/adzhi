﻿using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IGroupService
    {
        IQueryable<Group> GetALL();

        IQueryable<Group> GetKendoALL();

        void Create(Group model);

        void Update(Group model);

        void Update(GroupModel model);


        void Delete(Group model);

        bool CheckPermission(int groupID, string controller, string action);

        Group Find(int GroupID);

        Group IncludeFind(int GroupID);

    }
}
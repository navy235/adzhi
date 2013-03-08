using System;
using System.Linq;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;

namespace CodeFirstEF.Serivces
{
    public interface IOutDoorService
    {
        OutDoor Create(OutDoorViewModel model);

        IQueryable<OutDoor> GetOutDoorByMember(int MemebrID);
    }
}
using System;
using System.Linq;
using System.Collections.Generic;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;

namespace CodeFirstEF.Serivces
{
    public interface IOutDoorService
    {
        OutDoor Create(OutDoorViewModel model);

        IEnumerable<OutDoor> GetOutDoorByMember(int MemebrID);

        IEnumerable<OutDoor> GetKenDoOutDoorByMember(int MemebrID);
    }
}
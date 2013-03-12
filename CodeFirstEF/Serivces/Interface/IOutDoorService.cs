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

        OutDoor Update(OutDoorViewModel model);

        OutDoor IncludeFind(int MediaID);

        bool HasOutDoorByMember(int MediaID);

        OutDoorViewModel GetOutDoorViewModel(int MediaID);

        IEnumerable<OutDoor> GetOutDoorByMember(int MemberID);

        IEnumerable<OutDoor> GetKenDoOutDoorByMember(int MemberID);
    }
}
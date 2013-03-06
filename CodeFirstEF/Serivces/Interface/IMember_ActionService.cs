using System;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IMember_ActionService
    {
        Member_Action Create(Member member, int memberAction, string description);

        bool HasDescriptionActionInLimiteTime(string description, int limitHours);

        bool HasActionByActionTypeInLimiteTime(int MemberID, int memberAction, int limitMins);
    }
}
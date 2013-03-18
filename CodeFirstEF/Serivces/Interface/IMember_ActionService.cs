using System;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;
using CoreHelper.Enum;

namespace CodeFirstEF.Serivces
{
    public interface IMember_ActionService
    {
        Member_Action Create(Member member, int memberAction, string description);

        Member_Action Create(MemberActionType MemberActionType, string description);

        Member_Action Create(MemberActionType MemberActionType);

        bool HasAction(MemberActionType MemberActionType);

        bool HasDescriptionActionInLimiteTime(string description, int limitHours);

        bool HasActionByActionTypeInLimiteTime(int MemberID, int memberAction, int limitMins);
    }
}
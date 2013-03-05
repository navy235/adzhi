using System;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
namespace CodeFirstEF.Serivces
{
    public interface IMemberService
    {
        Member Create(RegisterModel model);

        bool Login(string Email, string Md5Password);

        bool OpenUserLogin(OpenLoginStatus OpenUser, OpenLoginType openType);

        bool ExistsEmail(string Email);

        bool ExistsNickName(string NickName);

        bool ExistsEmailNotMe(int MemberID, string Email);

        bool ExistsNickNameNotMe(int MemberID, string NickName);

        Member Find(int MemberID);

        Member FindMemberWithProfile(int MemberID);

        Member FindMemberByEmail(string Email);

        Member FindMemberByOpenUser(OpenLoginStatus OpenUser, OpenLoginType openType);

        void ChangePassword(Member member, string newpassword);

        void SetLoginCookie(Member member);

        void SaveMemberBaseInfo(int MemberID, ProfileModel model);

        void SaveMemberAvtar(int MemberID, AvtarModel model);

        void SaveMemberContact(int MemberID, ContactModel model);

        bool HasGetPasswordActionInLimitTime(GetPasswordModel model, int limitMin, int memberAction);

        Member FindDescriptionMemberInLimitTime(string description, int limitHours, out bool isFound);

    }
}
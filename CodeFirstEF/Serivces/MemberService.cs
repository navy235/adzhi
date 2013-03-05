using System;
using System.Linq;
using System.Data.Entity;
using CoreHelper.Checking;
using CoreHelper.Http;
using CoreHelper.Enum;
using CoreHelper.Cookie;
using CoreHelper.Data.Interface;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
namespace CodeFirstEF.Serivces
{
    public class MemberService : IMemberService
    {
        private readonly IUnitOfWork DB_Service;

        public MemberService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public Member Create(RegisterModel model)
        {
            Member mb = new Member();
            mb.Email = model.Email;
            mb.NickName = model.NickName;
            mb.OpenID = model.OpenID;
            mb.OpenType = model.OpenType;
            mb.Status = 1;//注册未激活，0为禁用
            mb.Password = CheckHelper.StrToMd5(model.Password);
            mb.GroupID = 1;
            mb.AddTime = DateTime.Now;
            mb.LastTime = DateTime.Now;
            mb.AddIP = HttpHelper.IP;
            mb.LastIP = HttpHelper.IP;
            mb.LoginCount = 1;
            DB_Service.Add<Member>(mb);
            DB_Service.Commit();
            return mb;
        }


        public bool Login(string Email, string Md5Password)
        {
            bool hasMember = DB_Service.Set<Member>()
                .Count(x => x.Email.Equals(Email, StringComparison.CurrentCultureIgnoreCase)
                    && x.Password.Equals(Md5Password, StringComparison.CurrentCultureIgnoreCase)) == 1;
            if (hasMember)
            {
                Member LoginUser = FindMemberByEmail(Email);
                DB_Service.Attach<Member>(LoginUser);
                LoginUser.LastIP = HttpHelper.IP;
                LoginUser.LastTime = DateTime.Now;
                LoginUser.LoginCount = LoginUser.LoginCount + 1;
                Member_Action ma = new Member_Action();
                ma.ActionType = (int)MemberActionType.Login;
                ma.AddTime = DateTime.Now;
                ma.Description = "登录";
                LoginUser.Member_Action.Add(ma);
                DB_Service.Commit();
                SetLoginCookie(LoginUser);
            }
            return hasMember;

        }


        public bool OpenUserLogin(OpenLoginStatus OpenUser, OpenLoginType openType)
        {
            int typeValue = (int)openType;
            var hasMember = DB_Service.Set<Member>()
                .Count(x =>
                    x.OpenID.Equals(OpenUser.OpenId)
                    && x.OpenType == typeValue) == 1;

            if (hasMember)
            {
                Member LoginUser = FindMemberByOpenUser(OpenUser, openType);
                DB_Service.Attach<Member>(LoginUser);
                LoginUser.LastIP = HttpHelper.IP;
                LoginUser.LastTime = DateTime.Now;
                LoginUser.LoginCount = LoginUser.LoginCount + 1;
                Member_Action ma = new Member_Action();
                ma.ActionType = (int)MemberActionType.Login;
                ma.AddTime = DateTime.Now;
                ma.Description = "登录";
                LoginUser.Member_Action.Add(ma);
                DB_Service.Commit();
                SetLoginCookie(LoginUser);
            }
            return hasMember;
        }

        public Member Find(int MemberID)
        {
            Member member = DB_Service.Set<Member>().Single(x => x.MemberID == MemberID);
            return member;
        }



        public Member FindMemberWithProfile(int MemberID)
        {
            Member member = DB_Service.Set<Member>()
                .Include(x => x.Member_Profile)
                .Single(x => x.MemberID == MemberID);
            return member;
        }

        public Member FindMemberByEmail(string Email)
        {
            Member member = DB_Service.Set<Member>().Single(x => x.Email.Equals(Email, StringComparison.OrdinalIgnoreCase));
            return member;
        }

        public Member FindMemberByOpenUser(OpenLoginStatus OpenUser, OpenLoginType openType)
        {
            int typeValue = (int)openType;
            Member member = DB_Service.Set<Member>()
                .Single(x => x.OpenID.Equals(OpenUser.OpenId, StringComparison.CurrentCultureIgnoreCase) && x.OpenType == typeValue);
            return member;
        }

        public void SetLoginCookie(Member member)
        {

            CookieHelper.LoginCookieSave(member.MemberID.ToString(),
                member.Email,
                member.NickName,
                "",
                member.GroupID.ToString(),
                member.LoginCount.ToString(),
                member.Password, "1");
        }


        public bool HasGetPasswordActionInLimitTime(GetPasswordModel model, int limitMin, int memberAction)
        {

            DateTime LimitDate = DateTime.Now.AddMinutes(-(limitMin));
            string IP = HttpHelper.IP;
            var query = DB_Service.Set<Member>()
                .Include(x => x.Member_Action)
                .Where(x =>
                    (x.Member_Action.Any(ma =>
                        ma.ActionType == memberAction
                        && ma.AddTime > LimitDate
                        && ma.IP == IP
                        )) && x.Email.Equals(model.Email, StringComparison.OrdinalIgnoreCase));
            return query.Count() > 0;
        }

        public Member FindDescriptionMemberInLimitTime(string description, int limitHours, out bool isFound)
        {
            isFound = false;
            DateTime LimitDate = DateTime.Now.AddHours(-limitHours);
            var query = DB_Service.Set<Member>()
                .Include(x => x.Member_Action)
                .Where(x =>
                    (x.Member_Action
                        .Any(ma => ma.Description.Equals(description, StringComparison.OrdinalIgnoreCase)
                            && ma.AddTime > LimitDate
                            )
                     ));
            if (query.Count() > 0)
            {
                isFound = true;
                return query.Single();
            }
            else
            {
                return new Member();
            }
        }

        public void ChangePassword(Member member, string newpassword)
        {
            DB_Service.Attach<Member>(member);
            member.Password = CheckHelper.StrToMd5(newpassword);
            DB_Service.Commit();
        }


        public void SaveMemberBaseInfo(int MemberID, ProfileModel model)
        {
            Member member = FindMemberWithProfile(MemberID);
            DB_Service.Attach<Member>(member);
            Member_Profile mp = new Member_Profile();
            if (member.Member_Profile != null)
            {
                mp = member.Member_Profile;
            }
            mp.MemberID = model.MemberID;
            mp.Borthday = model.Borthday;
            mp.CityCode = model.CityCode;
            mp.Description = model.Description;
            member.NickName = model.NickName;
            mp.RealName = model.RealName;
            mp.Sex = model.Sex;
            member.Member_Profile = mp;
            DB_Service.Commit();
        }

        public void SaveMemberAvtar(int MemberID, AvtarModel model)
        {
            Member member = FindMemberWithProfile(MemberID);
            DB_Service.Attach<Member>(member);
            Member_Profile mp = new Member_Profile();
            if (member.Member_Profile != null)
            {
                mp = member.Member_Profile;
            }
            mp.MemberID = member.MemberID;
            mp.AvtarUrl = model.AvtarUrl;
            member.Member_Profile = mp;
            DB_Service.Commit();
        }

        public void SaveMemberContact(int MemberID, ContactModel model)
        {
            Member member = FindMemberWithProfile(MemberID);
            DB_Service.Attach<Member>(member);
            Member_Profile mp = new Member_Profile();
            if (member.Member_Profile != null)
            {
                mp = member.Member_Profile;
            }
            mp.MemberID = member.MemberID;
            mp.Address = model.Address;
            mp.Phone = model.Phone;
            mp.Mobile = model.Mobile;
            mp.MSN = model.MSN;
            mp.QQ = model.QQ;
            if (model.Position.IndexOf("|") != -1)
            {
                mp.Lat = Convert.ToDouble(model.Position.Split('|')[0]);
                mp.Lng = Convert.ToDouble(model.Position.Split('|')[1]);
            }
            member.Member_Profile = mp;
            DB_Service.Commit();
        }

        public bool ExistsEmail(string Email)
        {
            return DB_Service.Set<Member>().Count(x => x.Email.Equals(Email, StringComparison.CurrentCultureIgnoreCase)) > 0;
        }

        public bool ExistsNickName(string NickName)
        {
            return DB_Service.Set<Member>().Count(x => x.NickName.Equals(NickName, StringComparison.CurrentCultureIgnoreCase)) > 0;
        }


        public bool ExistsEmailNotMe(int MemberID, string Email)
        {
            return DB_Service.Set<Member>().Where(x => x.MemberID != MemberID).Count(x => x.Email.Equals(Email, StringComparison.CurrentCultureIgnoreCase)) > 0;
        }

        public bool ExistsNickNameNotMe(int MemberID, string NickName)
        {
            return DB_Service.Set<Member>().Where(x => x.MemberID != MemberID).Count(x => x.NickName.Equals(NickName, StringComparison.CurrentCultureIgnoreCase)) > 0;
        }










    }
}
﻿using System;
using System.Linq;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public class Member_ActionService : IMember_ActionService
    {
        private readonly IUnitOfWork DB_Service;

        public Member_ActionService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public Member_Action Create(Member member, int memberAction, string description)
        {
            Member_Action member_Action = new Member_Action()
            {
                MemberID = member.MemberID,
                ActionType = memberAction,
                AddTime = DateTime.Now,
                Description = description,
                IP = HttpHelper.IP
            };
            DB_Service.Add<Member_Action>(member_Action);
            DB_Service.Commit();
            return member_Action;
        }

        public bool HasDescriptionActionInLimiteTime(string description, int limitHours)
        {
            DateTime LimitDate = DateTime.Now.AddHours(-limitHours);
            var query = DB_Service.Set<Member_Action>()
                   .Where(x => x.Description.Equals(description, StringComparison.OrdinalIgnoreCase)
                   && x.AddTime > LimitDate
                   );
            return query.Count() > 0;
        }
    }
}
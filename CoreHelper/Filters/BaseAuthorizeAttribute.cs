using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreHelper.Cookie;
namespace CoreHelper.Filters
{
    public class BaseAuthorizeAttribute : AuthorizeAttribute
    {
        private string[] allowedUsers;

        public BaseAuthorizeAttribute(params string[] users)
        {
            allowedUsers = users;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (allowedUsers.Length == 0)
            {
                return CookieHelper.IsLogin;
            }
            else
            {
                return CheckPermission();
            }
        }

        protected virtual bool CheckPermission()
        {
            return CookieHelper.IsLogin &&
               allowedUsers.Contains(CookieHelper.UID,
               StringComparer.InvariantCultureIgnoreCase);
        }

    }
}

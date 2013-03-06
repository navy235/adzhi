using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreHelper.Enum
{
    public enum MemberStatus
    {
        Registered = 1,
        EmailActived = 2,
    }

    public enum MemberActionType
    {
        Login = 3,
        LogOut = 4,
        GetPassword = 5,
        EmailActvie = 6,
    }

    public enum OpenLoginType
    {
        QQ = 1,
        Sina = 2,
        Taobao = 3,
        Douban = 4,
        Renren = 5
    }

    public enum AlertType
    {
        success = 1,
        error = 2,
        danger = 3,
        info = 4,
        block = 5
    }
}

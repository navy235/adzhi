﻿using System;
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
        CompanyApply = 3,
        CompanyAuth = 4
    }

    public enum MemberActionType
    {
        Login = 3,
        LogOut = 4,
        GetPassword = 5,
        EmailActvie = 6,
        CompanyApply = 7,
        CompanyReApply = 8
    }

    public enum CompanyStatus
    {
        CompanyFailed = 0,
        CompanyApply = 1,
        CompanyAuth = 2
    }

    public enum OutDoorStatus
    {
        Deleted = -1,
        VerifyFailed = 0,
        PreVerify = 1,
        Verified = 2,
        NoShow = 3,
        ShowOnline = 4,
        Top = 9
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

    public enum SliderTabBoxType
    {
        Specialprice = 1,
        TodaySuggest = 2,
        WeekHot = 3,
        NewProduct = 4
    }
}

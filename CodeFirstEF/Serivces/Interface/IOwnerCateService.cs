using System;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
namespace CodeFirstEF.Serivces
{
    public interface IOwnerCateService
    {
        OwnerCate Find(string CateCode);
    }
}
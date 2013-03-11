using System;
using System.Linq;
using System.Collections.Generic;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using System.Web.Mvc;
namespace CodeFirstEF.Serivces
{
    public interface IAreaAttService
    {
        List<SelectListItem> GetSelectList();

        List<SelectListItem> GetSelectList(IEnumerable<int> SelectedIdList);

        IQueryable<AreaAtt> GetList(IEnumerable<int> IdList);

        IQueryable<AreaAtt> GetList();
    }
}
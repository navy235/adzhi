using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace CodeFirstEF.Serivces
{
    public interface IAreaAttService
    {
        List<SelectListItem> GetSelectList();
    }
}
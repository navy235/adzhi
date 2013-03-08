using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public class AreaAttService : IAreaAttService
    {
        private readonly IUnitOfWork DB_Service;

        public AreaAttService(IUnitOfWork DB_Service)
        {
            this.DB_Service = DB_Service;
        }

        public List<SelectListItem> GetSelectList()
        {
            return DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
              {
                  Value = x.ID.ToString(),
                  Text = x.AttName
              }).ToList();
        }


        public List<SelectListItem> GetSelectList(IEnumerable<int> SelectedIdList)
        {
            return DB_Service.Set<AreaAtt>().ToList().Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.AttName,
                Selected = SelectedIdList.Contains(x.ID)
            }).ToList();
        }

        public IEnumerable<AreaAtt> GetList(IEnumerable<int> IdList)
        {
            return DB_Service.Set<AreaAtt>().Where(x => IdList.Contains(x.ID));
        }

        public IEnumerable<AreaAtt> GetList()
        {
            return DB_Service.Set<AreaAtt>();
        }
    }
}
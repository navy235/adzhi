using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Web.Mvc;
using CoreHelper.Enum;

namespace CoreHelper.UI
{
    [Serializable]
    public class UIHelper
    {
        public static readonly UIHelper singleStone;

        public static List<SelectListItem> SexList { get; set; }

        public static List<SelectListItem> CompanyStatusList { get; set; }



        static UIHelper()
        {
            singleStone = new UIHelper();
            InitSexList();
            InitCompanyStatusList();

        }
        private static void InitSexList()
        {
            SexList = new List<SelectListItem>();
            SexList.Add(new SelectListItem() { Text = "男", Value = "0" });
            SexList.Add(new SelectListItem() { Text = "女", Value = "1" });
        }

        private static void InitCompanyStatusList()
        {
            CompanyStatusList = new List<SelectListItem>();
            CompanyStatusList.Add(new SelectListItem() { Text = "待审核", Value = ((int)CompanyStatus.CompanyApply).ToString() });
            CompanyStatusList.Add(new SelectListItem() { Text = "审核通过", Value = ((int)CompanyStatus.CompanyAuth).ToString() });
        }


        public static List<SelectListItem> getDictionary(string key)
        {
            List<SelectListItem> dy = new List<SelectListItem>();
            var Dictionary = singleStone.GetType().GetProperty(key, BindingFlags.Static | BindingFlags.Public);
            dy = (List<SelectListItem>)Dictionary.GetValue(singleStone, null);
            return dy;
        }

        public static List<SelectListItem> getDictionary(string key, string values)
        {
            List<SelectListItem> dy = new List<SelectListItem>();
            var Dictionary = singleStone.GetType().GetProperty(key, BindingFlags.Static | BindingFlags.Public);
            dy = (List<SelectListItem>)Dictionary.GetValue(singleStone, null);
            string[] valueArray = string.IsNullOrEmpty(values) ? new string[0] : values.Split(',');
            foreach (SelectListItem item in dy)
            {
                bool select = false;
                foreach (string s in valueArray)
                {
                    if (item.Value == s)
                    {
                        select = true;
                    }
                }
                if (select)
                {
                    item.Selected = true;
                }
            }
            return dy;
        }

    }
}

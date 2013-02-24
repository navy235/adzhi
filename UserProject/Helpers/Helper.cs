using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Web.Mvc;

namespace UserProject.Helpers
{
    [Serializable]
    public class Helper
    {
        public static readonly Helper singleStone;

        public static List<SelectListItem> SexList { get; set; }

        public static List<SelectListItem> RadioList { get; set; }

        public static List<SelectListItem> CheckList { get; set; }

        public static List<SelectListItem> DropdownList { get; set; }

        public static List<SelectListItem> ParentDropdownList { get; set; }

        public static List<SelectListItem> ChildDropdownList { get; set; }

        public static List<SelectListItem> selectCascading { get; set; }

        public static List<SelectListItem> anthorSelectCascading { get; set; }

        static Helper()
        {
            singleStone = new Helper();
            InitSexList();
            InitRadioList();
            InitCheckList();
            InitDropdownList();
            InitParentDropdownList();
            InitChildDropdownList();

            InitselectCascading();

            InitanthorSelectCascading();

        }
        private static void InitSexList()
        {
            SexList = new List<SelectListItem>();
            SexList.Add(new SelectListItem() { Text = "男", Value = "0" });
            SexList.Add(new SelectListItem() { Text = "女", Value = "1" });
        }

        private static void InitRadioList()
        {
            RadioList = new List<SelectListItem>();
            RadioList.Add(new SelectListItem() { Text = "RadioDefaultValue", Value = "0" });
            RadioList.Add(new SelectListItem() { Text = "RadioValue1", Value = "1" });
            RadioList.Add(new SelectListItem() { Text = "RadioValue2", Value = "2" });
            RadioList.Add(new SelectListItem() { Text = "RadioValue3", Value = "3" });

        }

        private static void InitCheckList()
        {
            CheckList = new List<SelectListItem>();
            CheckList.Add(new SelectListItem() { Text = "CheckDefaultValue", Value = "0" });
            CheckList.Add(new SelectListItem() { Text = "CheckValue1", Value = "1" });
            CheckList.Add(new SelectListItem() { Text = "CheckValue2", Value = "2" });
            CheckList.Add(new SelectListItem() { Text = "CheckValue3", Value = "3" });
        }


        private static void InitDropdownList()
        {
            DropdownList = new List<SelectListItem>();
            DropdownList.Add(new SelectListItem() { Text = "DropdownListValue0", Value = "0" });
            DropdownList.Add(new SelectListItem() { Text = "DropdownListValue1", Value = "1" });
            DropdownList.Add(new SelectListItem() { Text = "DropdownListValue2", Value = "2" });
            DropdownList.Add(new SelectListItem() { Text = "DropdownListValue3", Value = "3" });
        }


        private static void InitParentDropdownList()
        {
            ParentDropdownList = new List<SelectListItem>();
            ParentDropdownList.Add(new SelectListItem() { Text = "PValue001", Value = "001" });
            ParentDropdownList.Add(new SelectListItem() { Text = "PValue002", Value = "002" });
            ParentDropdownList.Add(new SelectListItem() { Text = "PValue003", Value = "003" });
            ParentDropdownList.Add(new SelectListItem() { Text = "PValue004", Value = "004" });
        }

        private static void InitChildDropdownList()
        {
            ChildDropdownList = new List<SelectListItem>();
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001001", Value = "001001" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001002", Value = "001002" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001003", Value = "001003" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001004", Value = "001004" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001005", Value = "001005" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue001006", Value = "001006" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue002001", Value = "002001" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue003001", Value = "003001" });
            ChildDropdownList.Add(new SelectListItem() { Text = "CValue004001", Value = "004001" });
        }

        private static void InitselectCascading()
        {
            selectCascading = new List<SelectListItem>();
            selectCascading.Add(new SelectListItem() { Text = "001001001", Value = "001001001" });
            selectCascading.Add(new SelectListItem() { Text = "001001002", Value = "001001002" });
            selectCascading.Add(new SelectListItem() { Text = "001001003", Value = "001001003" });
            selectCascading.Add(new SelectListItem() { Text = "001001004", Value = "001001004" });
            selectCascading.Add(new SelectListItem() { Text = "002001001", Value = "002001001" });
            selectCascading.Add(new SelectListItem() { Text = "003001001", Value = "003001001" });
            selectCascading.Add(new SelectListItem() { Text = "004001001", Value = "004001001" });
        }
        private static void InitanthorSelectCascading()
        {
            anthorSelectCascading = new List<SelectListItem>();
            anthorSelectCascading.Add(new SelectListItem() { Text = "001001001", Value = "001001001" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "001001002", Value = "001001002" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "001001003", Value = "001001003" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "001001004", Value = "001001004" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "002001001", Value = "002001001" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "003001001", Value = "003001001" });
            anthorSelectCascading.Add(new SelectListItem() { Text = "004001001", Value = "004001001" });
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
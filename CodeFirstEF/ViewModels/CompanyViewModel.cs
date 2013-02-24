
namespace CodeFirstEF.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel;
    using System.Web.Security;
    using System.Linq;
    using System.Web;
    using System.Globalization;
    using System.Web.Mvc;
    using CoreHelper.Attribute;
    public class CompanyReg
    {

        [HintSeparateTitle("基本信息")]
        [Required(ErrorMessage = "请输入公司名称")]
        [Display(Name = "公司名称")]
        [RegularExpression(@"^[\u0391-\uFFE5\w]+$", ErrorMessage = "公司名称含有非法字符.")]
        //[Remote("NickNameExists", "AjaxService", ErrorMessage = "该公司名称含有非法字符或已经注册")]
        [StringLength(25, ErrorMessage = "请输入{2}-{1}位中文公司名称", MinimumLength = 7)]
        [Hint("请输入昵称7-25位中文.")]
        public string Name { get; set; }


        [Required(ErrorMessage = "请选择公司所在城市")]
        [Display(Name = "所在城市")]
        [HintClass("city")]
        [UIHint("CascadingDropDownList")]
        [AdditionalMetadata("CascadingDropDownList", "ParentDropdownList")]
        public string CityCode { get; set; }


        [Required(ErrorMessage = "请选择公司主要业务")]
        [Display(Name = "公司主要业务")]
        [UIHint("SingleDropdownList")]
        public string BussinessCode { get; set; }

        [Required(ErrorMessage = "请选择公司规模")]
        [Display(Name = "公司规模")]
        [UIHint("SingleDropdownList")]
        public string ScaleCode { get; set; }

        [Required(ErrorMessage = "请选择公司注册资金")]
        [Display(Name = "公司注册资金")]
        [UIHint("SingleDropdownList")]
        public string FundCode { get; set; }


        [Required(ErrorMessage = "请输入公司简介.")]
        [Display(Name = "公司简介")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }


        [HintSeparateTitle("联系方式")]

        [Required(ErrorMessage = "请输入公司联系地址")]
        [Display(Name = "公司联系地址")]
        [StringLength(25, ErrorMessage = "请输入{2}-{1}位公司联系地址", MinimumLength = 7)]
        [Hint("公司联系地址7-25个字，不允许填写电话和特殊符号.")]
        public string Address { get; set; }

        [Display(Name = "地图位置")]
        [Required(ErrorMessage = "请标记公司所在地图坐标.")]
        [UIHint("MapMarker")]
        public string Position { get; set; }


        [Required(ErrorMessage = "请输入联系人")]
        [Display(Name = "联系人")]
        [StringLength(5, ErrorMessage = "请输入{2}-{1}位中文联系人", MinimumLength = 2)]
        [Hint("请输入联系人名字.")]
        public string LinkMan { get; set; }

        [Required(ErrorMessage = "请选择联系人性别")]
        [Display(Name = "性别")]
        [AdditionalMetadata("Radio", "男,女")]
        [UIHint("Radio")]
        public bool Sex { get; set; }


        [Display(Name = "手机号码")]
        [RegularExpression(@"^13[0-9]{9}|15[0-9]{9}|18[0-9]{9}|14[0-9]{9}$", ErrorMessage = "您输入的手机号码格式不正确.")]
        [Hint("请输入手机号码.")]
        public string Mobile { get; set; }



        [Display(Name = "电话号码")]
        [Hint("请输入电话号码,电话号码格式010-2013042-1323，区号加电话号码加分机号码，无分机可以不填")]
        [RegularExpression(@"^\d{3}-\d{8}(-\d{3,4})?|\d{4}-\d{7}(-\d{3,4})??$", ErrorMessage = "您输入的电话号码格式不正确.")]
        [RequireWith("Mobile", "手机号码")]
        public string Phone { get; set; }


        [Display(Name = "传真")]
        [RegularExpression(@"^^\d{3}-\d{8}(-\d{3,4})?|\d{4}-\d{7}(-\d{3,4})??$", ErrorMessage = "您输入的传真号码格式不正确.")]
        [Hint("请输传真号码,传真格式010-2013042-1323，区号加传真号码加分机号码，无分机可以不填")]
        public string Fax { get; set; }

        [Display(Name = "QQ号码")]
        [RegularExpression(@"^[1-9](\d)+$", ErrorMessage = "您输入的QQ号码格式不正确.")]
        [Hint("请输入QQ号码.")]
        public string QQ { get; set; }

        [Display(Name = "MSN")]
        [RegularExpression(@"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "输入的MSN格式不正确.")]
        [Hint("请输入MSN.")]
        public string MSN { get; set; }



    }
}
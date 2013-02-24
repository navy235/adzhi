

namespace UserProject.Models
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


    public class RegisterModel
    {
        [Required(ErrorMessage = "请输入Email地址")]

        [Display(Name = "Email地址")]
        [Remote("EmailExists", "AjaxService", ErrorMessage = "该Email地址已经注册")]
        [RegularExpression(@"(?i)^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$", ErrorMessage = "输入的Email地址格式不正确.")]
        [Hint(
          "Your email will not be public unless you choose to disclose it. It is required to verify your registration and for password retrieval, important notifications, etc."
          )]
        public string Email { get; set; }

        [Required(ErrorMessage = "请输入昵称")]
        [Display(Name = "昵称")]
        [RegularExpression(@"^[\u0391-\uFFE5\w]+$", ErrorMessage = "昵称含有非法字符.")]
        [Remote("NickNameExists", "AjaxService", ErrorMessage = "该昵称含有非法字符或已经注册")]
        [StringLength(7, ErrorMessage = "请输入{2}-{1}位中文昵称", MinimumLength = 2)]
        [Hint("Choose something unique so others will know which contributions are yours.")]
        public string NickName { get; set; }

        [Required(ErrorMessage = "请输入密码")]
        [StringLength(15, ErrorMessage = "请输入{2}-{1}位密码", MinimumLength = 6)]
        [Display(Name = "请输入6-15位密码")]
        [DataType(DataType.Password)]
        [Hint("Passwords must be at least 7 characters long.")]
        public string Password { get; set; }

        [Required(ErrorMessage = "请确认密码")]
        [DataType(DataType.Password)]
        [Display(Name = "确认密码")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "两次输入的密码不一致")]
        [Hint("Please reenter your password and ensure that it matches the one above.")]
        public string ConfirmPassword { get; set; }


        [Required(ErrorMessage = "请输入验证码")]
        [Display(Name = "输入验证码")]
        [StringLength(4, ErrorMessage = "长度为4位", MinimumLength = 4)]
        [Remote("ValidateVCode", "AjaxService", ErrorMessage = "验证码错误")]
        [UIHint("ValidateVCode")]
        [HintClass("validatecode")]
        [Hint("请输入验证码以防止恶意注册.")]
        public string Vcode { get; set; }
    }

    public class LogOnModel
    {


        [Required(ErrorMessage = "请输入Email地址")]
        [Display(Name = "Email地址")]
        [RegularExpression(@"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "输入的Email地址格式不正确.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "请输入密码")]
        [StringLength(15, ErrorMessage = "请输入{2}-{1}位密码", MinimumLength = 6)]
        [Display(Name = "请输入6-15位密码")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "请输入验证码")]
        [Display(Name = "输入验证码")]
        [StringLength(4, ErrorMessage = "长度为4位", MinimumLength = 4)]
        [Remote("ValidateVCode", "AjaxService", ErrorMessage = "验证码错误")]
        [UIHint("ValidateVCode")]
        public string Vcode { get; set; }
    }

    public class ProfileModel
    {
        [Editable(false)]
        public int ID { get; set; }

        [Required(ErrorMessage = "请输入Email地址")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email地址")]
        [Remote("EmailExistsNotMe", "AjaxService", ErrorMessage = "该Email地址已经注册")]
        [RegularExpression(@"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "输入的Email地址格式不正确.")]
        [Editable(false)]
        public string Email { get; set; }

        [Required(ErrorMessage = "请输入昵称")]
        [Display(Name = "昵称")]
        [RegularExpression(@"^[\u0391-\uFFE5\w]+$", ErrorMessage = "昵称含有非法字符.")]
        [Remote("NickNameExistsNotMe", "AjaxService", ErrorMessage = "该昵称含有非法字符或已经注册")]
        [StringLength(7, ErrorMessage = "请输入{2}-{1}位中文昵称", MinimumLength = 2)]
        public string NickName { get; set; }

        [Required(ErrorMessage = "请选择性别")]
        [Display(Name = "性别")]
        public int Sex { get; set; }


        [DataType(DataType.DateTime)]
        [Display(Name = "生日")]
        public DateTime Borthday { get; set; }


        [Required(ErrorMessage = "请输入个人简介")]
        [Display(Name = "个人简介")]
        [Remote("ValidateDescription", "AjaxService", ErrorMessage = "简介含有非法字符")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
    }

    public class ChangePasswordModel
    {
        [Editable(false)]
        public int ID { get; set; }

        [Required(ErrorMessage = "请输入旧密码")]
        [DataType(DataType.Password)]
        [Display(Name = "旧密码")]
        [Remote("ValidatePassword", "AjaxService", ErrorMessage = "旧密码错误")]
        public string OldPassword { get; set; }

        [Required(ErrorMessage = "请输入新密码")]
        [StringLength(15, ErrorMessage = "请输入{2}-{1}位密码", MinimumLength = 6)]
        [Display(Name = "新密码")]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }


        [Required(ErrorMessage = "请确认密码")]
        [DataType(DataType.Password)]
        [Display(Name = "确认密码")]
        [System.Web.Mvc.Compare("NewPassword", ErrorMessage = "两次输入的密码不一致")]
        public string ConfirmPassword { get; set; }
    }

    public class DetailsModel
    {
        public DetailsModel()
        {
            Borthday = DateTime.Now;
        }

        [ScaffoldColumn(false)]
        public int MemberID { get; set; }

        [Required(ErrorMessage = "请输入Email地址")]
        [Display(Name = "Email地址")]
        [Remote("EmailExists", "AjaxService", ErrorMessage = "该Email地址已经注册")]
        [RegularExpression(@"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "输入的Email地址格式不正确.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "请输入昵称")]
        [Display(Name = "昵称")]
        [RegularExpression(@"^[\u0391-\uFFE5\w]+$", ErrorMessage = "昵称含有非法字符.")]
        [Remote("NickNameExists", "AjaxService", ErrorMessage = "该昵称含有非法字符或已经注册")]
        [StringLength(7, ErrorMessage = "请输入{2}-{1}位中文昵称", MinimumLength = 2)]
        public string NickName { get; set; }

        [Required(ErrorMessage = "请设置用户所属群组")]
        [Display(Name = "户所属群组")]
        [UIHint("ForeignKeyForRadio")]
        public int GroupID { get; set; }

        [Required(ErrorMessage = "请输入密码")]
        [StringLength(15, ErrorMessage = "请输入{2}-{1}位密码", MinimumLength = 6)]
        [Display(Name = "请输入6-15位密码")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "请确认密码")]
        [DataType(DataType.Password)]
        [Display(Name = "确认密码")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "两次输入的密码不一致")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "请上传头像")]
        [Display(Name = "上传头像")]
        [UIHint("UploadImgEdit")]
        [AdditionalMetadata("UploadImgEdit", "200")]
        public string AvtarUrl { get; set; }

        [Required(ErrorMessage = "请选择城市")]
        [Display(Name = "所在城市")]
        [UIHint("CascadingDropDownList")]
        [AdditionalMetadata("CascadingDropDownList", "ParentDropdownList")]
        public string CityCode { get; set; }


        [Required(ErrorMessage = "请选择性别")]
        [Display(Name = "性别")]
        [UIHint("Radio")]
        [AdditionalMetadata("Radio", "SexList")]
        public int Sex { get; set; }


        [Required(ErrorMessage = "请选择出生日期")]
        [Display(Name = "出生日期")]
        [UIHint("Date")]
        public DateTime Borthday { get; set; }


        [Required(ErrorMessage = "请输入个人简介")]
        [Display(Name = "个人简介")]
        [Remote("ValidateDescription", "AjaxService", ErrorMessage = "简介含有非法字符")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

    }

    public class EditModel
    {
        public EditModel()
        {
            Borthday = DateTime.Now;
        }

        [HiddenInput]
        public int MemberID { get; set; }


        [Display(Name = "Email地址")]
        [UIHint("ReadOnly")]
        public string Email { get; set; }


        [Display(Name = "昵称")]
        [UIHint("ReadOnly")]
        public string NickName { get; set; }

        [Required(ErrorMessage = "请设置用户所属群组")]
        [Display(Name = "户所属群组")]
        [UIHint("ForeignKeyForRadio")]
        public int GroupID { get; set; }




        [Required(ErrorMessage = "请上传头像")]
        [Display(Name = "上传头像")]
        [UIHint("UploadImgEdit")]
        [AdditionalMetadata("UploadImgEdit", "200")]
        public string AvtarUrl { get; set; }

        [Required(ErrorMessage = "请选择城市")]
        [Display(Name = "所在城市")]
        [UIHint("CascadingDropDownList")]
        [AdditionalMetadata("CascadingDropDownList", "ParentDropdownList")]
        public string CityCode { get; set; }


        [Required(ErrorMessage = "请选择性别")]
        [Display(Name = "性别")]
        [UIHint("Radio")]
        [AdditionalMetadata("Radio", "SexList")]
        public int Sex { get; set; }


        [Required(ErrorMessage = "请选择出生日期")]
        [Display(Name = "出生日期")]
        [UIHint("Date")]
        public DateTime Borthday { get; set; }


        [Required(ErrorMessage = "请输入个人简介")]
        [Display(Name = "个人简介")]
        [Remote("ValidateDescription", "AjaxService", ErrorMessage = "简介含有非法字符")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

    }
}
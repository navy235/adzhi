

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

    public class OutDoorViewModel
    {

        public OutDoorViewModel()
        {
            this.StartTime = DateTime.Now;
            this.EndTime = DateTime.Now;
            this.Deadline = DateTime.Now;
        }

        [HiddenInput(DisplayValue = false)]
        public int MediaID { get; set; }

        [HintSeparateTitle("基本信息")]
        [Required(ErrorMessage = "请输入媒体名称")]
        [Display(Name = "媒体名称")]
        [CheckContact]
        [StringLength(25, ErrorMessage = "请输入{2}-{1}位{0}", MinimumLength = 6)]
        [Hint("6-25个字，不允许填写电话和特殊符号。例：新华书店附近户外大牌")]
        public string Name { get; set; }




        [Required(ErrorMessage = "请选择媒体类别")]
        [Display(Name = "媒体类别")]
        [HintClass("city")]
        [UIHint("CascadingDropDownList")]
        [AdditionalMetadata("CascadingDropDownList", "ParentDropdownList")]
        public string MeidaCode { get; set; }


        [Required(ErrorMessage = "请选择媒体区域属性")]
        [Display(Name = "媒体区域属性")]
        [UIHint("CheckList")]
        [CheckMaxLength(5)]
        public string AreaAtt { get; set; }


        [Required(ErrorMessage = "请选择媒体展现形式")]
        [Display(Name = "媒体展现形式")]
        [UIHint("SingleDropdownList")]
        public string FormatCode { get; set; }

        [Required(ErrorMessage = "请输入价格")]
        [Display(Name = "价格")]
        [Range(0F, 1000000F, ErrorMessage = "{0}必须位于{1}-{2}之间")]
        [UIHint("Price")]
        [HintClass("price")]
        public decimal Price { get; set; }

        [Display(Name = "价格说明")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "请输入价格说明")]
        public string PriceExten { get; set; }

        [Required(ErrorMessage = "请选择最短购买周期")]
        [Display(Name = "最短购买周期")]
        [UIHint("SingleDropdownList")]
        public string PeriodCode { get; set; }


        [HintSeparateTitle("位置信息")]

        [Required(ErrorMessage = "请选择媒体城市")]
        [Display(Name = "媒体城市")]
        [HintClass("city")]
        [UIHint("CascadingDropDownList")]
        [AdditionalMetadata("CascadingDropDownList", "ParentDropdownList")]
        public string CityCode { get; set; }

        [Required(ErrorMessage = "请输入具体位置")]
        [Display(Name = "具体位置")]
        [CheckContact]
        [Hint("请输入具体位置")]
        public string Location { get; set; }

        [Display(Name = "地图坐标")]
        [Required(ErrorMessage = "请标记媒体地图坐标.")]
        [UIHint("MapMarker")]
        public string Position { get; set; }

        [Display(Name = "照明情况")]
        [Required(ErrorMessage = "请输入照明信息")]
        [UIHint("Radio")]
        [AdditionalMetadata("Radio", "无,有")]
        [CascadeRequire("LightTime", "照明时间")]
        public bool HasLight { get; set; }

        [Display(Name = "照明时间")]
        [UIHint("TimeQuantum")]
        [HintClass("cascade")]
        [AdditionalMetadata("CascadeBack", "HasLight")]
        public string LightTime { get; set; }


        [Required(ErrorMessage = "请输入媒体面积相关参数")]
        [Display(Name = "媒体面积")]
        [UIHint("Area")]
        [CheckArea]
        public string Area { get; set; }


        [Required(ErrorMessage = "请输入日交通车流量")]
        [Display(Name = "日交通车流量")]
        [UIHint("Integer")]
        public int TrafficAuto { get; set; }

        [Required(ErrorMessage = "请输入日交通人流量")]
        [Display(Name = "日交通人流量")]
        [UIHint("Integer")]
        public int TrafficPerson { get; set; }

        [Required(ErrorMessage = "请输入开始时间")]
        [Display(Name = "开始时间")]
        [DataType(DataType.DateTime)]
        public DateTime StartTime { get; set; }

        [Required(ErrorMessage = "请输入结束时间")]
        [Display(Name = "结束时间")]
        [DataType(DataType.DateTime)]
        [DateGreaterThan("StartTime", "开始时间")]
        public DateTime EndTime { get; set; }


        [Required(ErrorMessage = "请输入媒体补充说明.")]
        [Display(Name = "媒体补充说明")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }


        [HintSeparateTitle("图片信息")]
        [Required(ErrorMessage = "请上传媒体图片.")]
        [Display(Name = "媒体图片")]
        [UIHint("UploadImgList")]
        [HintClass("uploadlist")]
        [AdditionalMetadata("UploadImgList", "")]
        [AdditionalMetadata("UploadImgListMaxLength", "6")]
        [HintLabel("请上传1-6张不小于800X600像素的图片,图片文件大小不小于5M")]
        public string MediaImg { get; set; }

        [HintSeparateTitle("规格所有权信息")]
        [Required(ErrorMessage = "请选择所有权类别")]
        [Display(Name = "所有权类别")]
        [UIHint("SingleDropdownList")]
        public string OwnerCode { get; set; }


        [Required(ErrorMessage = "请上传相关证书")]
        [Display(Name = "相关证书图片")]
        [UIHint("UploadImgList")]
        [HintClass("uploadlist")]
        [AdditionalMetadata("UploadImgList", "3")]
        [AdditionalMetadata("UploadImgListMaxLength", "6")]
        [HintLabel("请上传1-6张不小于800X600像素的图片,图片文件大小不小于5M")]
        public string CredentialsImg { get; set; }


        [Required(ErrorMessage = "请输入所有权截至")]
        [Display(Name = "所有权截至时间")]
        [DataType(DataType.DateTime)]
        public DateTime Deadline { get; set; }











    }
}
﻿
namespace CodeFirstEF.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class LinkManImg : ImgBase
    {

        [Key]
        public int CompanyID { get; set; }


        [ForeignKey("CompanyID")]
        public virtual Company Company { get; set; }
    }
}
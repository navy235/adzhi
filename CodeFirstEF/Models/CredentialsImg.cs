
namespace CodeFirstEF.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class CredentialsImg : ImgBase
    {

        [Key]
        public int OwnerID { get; set; }

        [ForeignKey("OwnerID")]
        public virtual Owner Owner { get; set; }
    }
}
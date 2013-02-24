//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CodeFirstEF.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class Member_Profile
    {

        public Member_Profile()
        {
            this.Borthday = DateTime.Now;
        }
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Key]
        public int MemberID { get; set; }

        [MaxLength(500)]
        public string AvtarUrl { get; set; }
        public bool Sex { get; set; }

        public System.DateTime Borthday { get; set; }

        [MaxLength(20)]
        public string CityCode { get; set; }

        [MaxLength(150)]
        public string Description { get; set; }

        public virtual Area Area { get; set; }

        public virtual Member Member { get; set; }
    }
}


namespace CodeFirstEF.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class Member
    {
        public Member()
        {
            this.Member_Action = new HashSet<Member_Action>();
            this.MemberID = 200000;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int MemberID { get; set; }

        public int? CompanyID { get; set; }

        [MaxLength(50)]
        public string Email { get; set; }

        [MaxLength(50)]
        public string NickName { get; set; }

        [MaxLength(50)]
        public string Password { get; set; }

        public int GroupID { get; set; }

        public System.DateTime LastTime { get; set; }

        [MaxLength(50)]
        public string LastIP { get; set; }

        public System.DateTime AddTime { get; set; }

        [MaxLength(50)]
        public string AddIP { get; set; }

        public int LoginCount { get; set; }
        public int Status { get; set; }

        public virtual Group Group { get; set; }
        public virtual ICollection<Member_Action> Member_Action { get; set; }

        public virtual Company SelfCompany { get; set; }

        [ForeignKey("CompanyID")]
        public virtual Company Company { get; set; }

        public virtual Member_Profile Member_Profile { get; set; }
    }
}

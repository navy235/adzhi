﻿//------------------------------------------------------------------------------
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

    public partial class Area : Category
    {
        public Area()
        {
            this.OutDoor = new HashSet<OutDoor>();
            this.Company = new HashSet<Company>();
            this.Member_Profile = new HashSet<Member_Profile>();
        }

        public virtual ICollection<Member_Profile> Member_Profile { get; set; }
        public virtual ICollection<Company> Company { get; set; }
        public virtual ICollection<OutDoor> OutDoor { get; set; }
    }
}

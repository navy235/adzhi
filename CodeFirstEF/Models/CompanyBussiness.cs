﻿using System;
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

    public partial class CompanyBussiness : Category
    {
        public CompanyBussiness()
        {
            this.Company = new HashSet<Company>();
        }
        public virtual ICollection<Company> Company { get; set; }
    }
}

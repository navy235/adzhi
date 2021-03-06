//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace UserProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public partial class Permissions
    {
        public Permissions()
        {
            this.Roles = new HashSet<Roles>();
        }
        [Key]
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Namespace { get; set; }
        public int DepartmentID { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual ICollection<Roles> Roles { get; set; }
    }
}

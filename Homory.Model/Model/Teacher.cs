//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Homory.Model
{
    using System;
    using System.Collections.Generic;
    
    [EntityFramework.Audit.Audit]
    public partial class Teacher
    {
        public System.Guid Id { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public Nullable<bool> Gender { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        public string Birthplace { get; set; }
        public string Address { get; set; }
        public string Nationality { get; set; }
        public string IDCard { get; set; }
        public bool PerStaff { get; set; }
        public bool Sync { get; set; }
        public int AutoId { get; set; }
    
        public virtual User User { get; set; }
    }
}

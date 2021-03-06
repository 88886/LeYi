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
    public partial class ResourceComment
    {
        public System.Guid Id { get; set; }
        public Nullable<System.Guid> ParentId { get; set; }
        public int Level { get; set; }
        public System.Guid ResourceId { get; set; }
        public System.Guid UserId { get; set; }
        public string Content { get; set; }
        public Nullable<decimal> Start { get; set; }
        public Nullable<decimal> End { get; set; }
        public Nullable<bool> Timed { get; set; }
        public System.DateTime Time { get; set; }
        public State State { get; set; }
    
        public virtual Resource Resource { get; set; }
        public virtual User User { get; set; }
    }
}

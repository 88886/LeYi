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
    public partial class Right
    {
        public Right()
        {
            this.Menu = new HashSet<Menu>();
            this.RoleRight = new HashSet<RoleRight>();
        }
    
        public string Name { get; set; }
        public System.Guid ApplicationId { get; set; }
    
        public virtual Application Application { get; set; }
        public virtual ICollection<Menu> Menu { get; set; }
        public virtual ICollection<RoleRight> RoleRight { get; set; }
    }
}

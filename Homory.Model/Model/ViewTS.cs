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
    public partial class ViewTS
    {
        public System.Guid Id { get; set; }
        public string Account { get; set; }
        public string RealName { get; set; }
        public string DisplayName { get; set; }
        public string Icon { get; set; }
        public System.Guid Stamp { get; set; }
        public string Password { get; set; }
        public string PasswordEx { get; set; }
        public string CryptoKey { get; set; }
        public string CryptoSalt { get; set; }
        public UserType Type { get; set; }
        public State State { get; set; }
        public int Ordinal { get; set; }
        public string Description { get; set; }
        public int Article { get; set; }
        public int Courseware { get; set; }
        public int Paper { get; set; }
        public int Media { get; set; }
        public int View { get; set; }
        public int Download { get; set; }
        public int Credit { get; set; }
    }
}

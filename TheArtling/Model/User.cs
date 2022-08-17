//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheArtling.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int Id { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string userId { get; set; }
        public Nullable<System.DateTime> signupDate { get; set; }
        public string accType { get; set; }
        public string status { get; set; }
    
        public virtual Artist Artist { get; set; }
        public virtual Favourite Favourite { get; set; }
        public virtual Cart Cart { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
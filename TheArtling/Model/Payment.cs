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
    
    public partial class Payment
    {
        public int BillId { get; set; }
        public Nullable<System.DateTime> BillDateTime { get; set; }
        public Nullable<int> CardNo { get; set; }
        public Nullable<System.DateTime> CardExpiryDate { get; set; }
        public Nullable<int> CardCVV { get; set; }
        public Nullable<int> OrderId { get; set; }
    
        public virtual Order Order { get; set; }
    }
}

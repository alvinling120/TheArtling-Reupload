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
    
    public partial class Artist
    {
        public Artist()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int ArtistId { get; set; }
        public string ArtistName { get; set; }
        public string ArtistProfile { get; set; }
        public string ArtistHometown { get; set; }
        public Nullable<int> UserId { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
        public virtual User User { get; set; }
    }
}

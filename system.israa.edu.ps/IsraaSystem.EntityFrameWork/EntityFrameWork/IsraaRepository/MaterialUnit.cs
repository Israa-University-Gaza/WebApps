//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository
{
    using System;
    using System.Collections.Generic;
    
    public partial class MaterialUnit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MaterialUnit()
        {
            this.Material = new HashSet<Material>();
            this.RepositoryBalance = new HashSet<RepositoryBalance>();
            this.TransactionDetails = new HashSet<TransactionDetails>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public bool IsDelete { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime InsertedDate { get; set; }
        public Nullable<int> InsertEmployeeId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Material> Material { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RepositoryBalance> RepositoryBalance { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TransactionDetails> TransactionDetails { get; set; }
    }
}
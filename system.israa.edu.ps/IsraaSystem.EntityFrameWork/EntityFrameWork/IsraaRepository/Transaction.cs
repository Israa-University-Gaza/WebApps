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
    
    public partial class Transaction
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Transaction()
        {
            this.TransactionDetails = new HashSet<TransactionDetails>();
        }
    
        public int Id { get; set; }
        public int TransactionTypeId { get; set; }
        public System.DateTime TransactionDate { get; set; }
        public Nullable<int> SupplierId { get; set; }
        public Nullable<int> DepartmentId { get; set; }
        public bool IsDelete { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime InsertedDate { get; set; }
        public Nullable<int> InsertEmployeeId { get; set; }
    
        public virtual Supplier Supplier { get; set; }
        public virtual TransactionType TransactionType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TransactionDetails> TransactionDetails { get; set; }
    }
}
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmployeeStatus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EmployeeStatus()
        {
            this.EmpStatus = new HashSet<EmpStatus>();
        }
    
        public int ID { get; set; }
        public string ArName { get; set; }
        public string Name { get; set; }
        public int ParentID { get; set; }
        public int StatusLevel { get; set; }
        public Nullable<int> OrderNum { get; set; }
        public Nullable<bool> IsLeaf { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    
        public virtual EmployeeStatus EmployeeStatus1 { get; set; }
        public virtual EmployeeStatus EmployeeStatus2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmpStatus> EmpStatus { get; set; }
    }
}
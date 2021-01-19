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
    
    public partial class RepositoryCustody
    {
        public int Id { get; set; }
        public int CustodyDetailsId { get; set; }
        public int EmployeeId { get; set; }
        public int MaterialId { get; set; }
        public int Quantity { get; set; }
        public bool IsDelete { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime InsertedDate { get; set; }
        public Nullable<int> InsertEmployeeId { get; set; }
    
        public virtual CustodyDetails CustodyDetails { get; set; }
        public virtual Material Material { get; set; }
    }
}

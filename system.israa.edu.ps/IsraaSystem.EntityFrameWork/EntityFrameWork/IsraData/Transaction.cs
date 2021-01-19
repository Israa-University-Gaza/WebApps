//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraData
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transaction
    {
        public int ID { get; set; }
        public int StudentID { get; set; }
        public Nullable<int> SemesterID { get; set; }
        public int CDFlag { get; set; }
        public decimal Amount { get; set; }
        public int ActionID { get; set; }
        public Nullable<int> VoucherID { get; set; }
        public Nullable<int> AccountID { get; set; }
        public Nullable<double> Quantity { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public Nullable<int> InsertStudentID { get; set; }
        public Nullable<int> InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteStudentID { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    
        public virtual Action Action { get; set; }
        public virtual StudentData StudentData { get; set; }
        public virtual Voucher Voucher { get; set; }
        public virtual Account Account { get; set; }
    }
}

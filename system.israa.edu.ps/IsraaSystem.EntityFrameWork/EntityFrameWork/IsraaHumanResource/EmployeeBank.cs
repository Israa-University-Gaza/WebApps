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
    
    public partial class EmployeeBank
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int BankID { get; set; }
        public string BankNo { get; set; }
        public string BankBranch { get; set; }
        public string Note { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public string UpdateDetails { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    }
}
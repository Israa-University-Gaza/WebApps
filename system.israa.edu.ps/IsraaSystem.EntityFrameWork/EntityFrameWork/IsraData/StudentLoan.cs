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
    
    public partial class StudentLoan
    {
        public int ID { get; set; }
        public int SemesterID { get; set; }
        public int StudentID { get; set; }
        public int ActionID { get; set; }
        public double LoanValue { get; set; }
        public Nullable<System.DateTime> RequestDate { get; set; }
        public Nullable<System.DateTime> RepayDate { get; set; }
        public string Note { get; set; }
        public bool AcademicAccreditation { get; set; }
        public Nullable<int> TransactionID { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> AcademicAccreditationDate { get; set; }
        public Nullable<int> AcademicAccreditationEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    }
}

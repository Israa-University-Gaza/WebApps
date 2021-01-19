//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic
{
    using System;
    using System.Collections.Generic;
    
    public partial class StdStatus
    {
        public int ID { get; set; }
        public int StudentID { get; set; }
        public int StatusID { get; set; }
        public int SemesterID { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertUserID { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteUserID { get; set; }
        public string ChangeStatusNote { get; set; }
    
        public virtual Semester Semester { get; set; }
        public virtual StudentAcademic StudentAcademic { get; set; }
        public virtual StudentStatus StudentStatus { get; set; }
    }
}

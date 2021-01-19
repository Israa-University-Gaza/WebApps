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
    
    public partial class EmployeePracticalExperience
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public string Job { get; set; }
        public string WorkDetails { get; set; }
        public string WorkPlace { get; set; }
        public string WorkField { get; set; }
        public Nullable<System.DateTime> WorkFromDate { get; set; }
        public Nullable<System.DateTime> WorkToDate { get; set; }
        public string WorkLeavingReason { get; set; }
        public string IdentifiersName { get; set; }
        public string IdentifiersMobile { get; set; }
        public string WorkCertificateUrl { get; set; }
        public Nullable<int> HumanResourceEmployeeID { get; set; }
        public bool HumanResourceAccreditation { get; set; }
        public Nullable<System.DateTime> HumanResourceAccredationDate { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public string UpdateDetails { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    
        public virtual EmployeePersonal EmployeePersonal { get; set; }
    }
}

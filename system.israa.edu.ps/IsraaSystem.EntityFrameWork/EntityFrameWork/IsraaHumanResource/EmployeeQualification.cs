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
    
    public partial class EmployeeQualification
    {
        public int ID { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public Nullable<int> QualificationTypeID { get; set; }
        public int QualificationTypeOrderNum { get; set; }
        public Nullable<int> CountryID { get; set; }
        public string UniversityName { get; set; }
        public string GPAGraduate { get; set; }
        public Nullable<int> GraduateYear { get; set; }
        public Nullable<int> GraduateMonthID { get; set; }
        public string College { get; set; }
        public string Department { get; set; }
        public string GraduateCertificateUrl { get; set; }
        public Nullable<int> HumanResourceEmployeeID { get; set; }
        public bool HumanResourceAccreditation { get; set; }
        public Nullable<System.DateTime> HumanResourceAccredationDate { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public string UpdateDetails { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
        public Nullable<bool> IsEquation { get; set; }
        public Nullable<System.DateTime> EquationDate { get; set; }
    
        public virtual Country Country { get; set; }
        public virtual Month Month { get; set; }
        public virtual QualificationType QualificationType { get; set; }
        public virtual EmployeePersonal EmployeePersonal { get; set; }
    }
}
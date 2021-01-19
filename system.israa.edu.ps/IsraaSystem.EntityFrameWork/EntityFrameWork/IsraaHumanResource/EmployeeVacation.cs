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
    
    public partial class EmployeeVacation
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public Nullable<int> OldID { get; set; }
        public Nullable<int> EmployeeDMID { get; set; }
        public int VacationTypeID { get; set; }
        public int EmployeeVacationBalanceID { get; set; }
        public System.DateTime RequestDate { get; set; }
        public System.DateTime VacationStartDate { get; set; }
        public System.DateTime VacationEndDate { get; set; }
        public Nullable<System.DateTime> FVacationStartDate { get; set; }
        public Nullable<System.DateTime> FVacationEndDate { get; set; }
        public Nullable<System.DateTime> EmpVacationStartDate { get; set; }
        public Nullable<System.DateTime> EmpVacationEndDate { get; set; }
        public Nullable<int> VacationDays { get; set; }
        public string VacationReason { get; set; }
        public int VacationPlaceID { get; set; }
        public Nullable<int> ReplaceEmployeeID { get; set; }
        public string ReplaceEmployeeName { get; set; }
        public Nullable<int> DirectMangerEmployeeID { get; set; }
        public Nullable<int> DmAccreditationStatusID { get; set; }
        public Nullable<System.DateTime> DirectMangerAccredationDate { get; set; }
        public Nullable<int> HumanResourceEmployeeID { get; set; }
        public Nullable<int> HrAccreditationStatusID { get; set; }
        public Nullable<System.DateTime> HumanResourceAccredationDate { get; set; }
        public string HumanResourceNote { get; set; }
        public Nullable<int> MangerEmployeeID { get; set; }
        public Nullable<bool> MangerAccreditation { get; set; }
        public Nullable<System.DateTime> MangerAccredationDate { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> UpdateEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
        public Nullable<long> OrganizationUnitId { get; set; }
    
        public virtual AccreditationStatus AccreditationStatus { get; set; }
        public virtual AccreditationStatus AccreditationStatus1 { get; set; }
        public virtual EmployeeVacationBalance EmployeeVacationBalance { get; set; }
        public virtual VacationPlace VacationPlace { get; set; }
        public virtual VacationType VacationType { get; set; }
        public virtual EmployeePersonal EmployeePersonal { get; set; }
        public virtual EmployeePersonal EmployeePersonal1 { get; set; }
    }
}

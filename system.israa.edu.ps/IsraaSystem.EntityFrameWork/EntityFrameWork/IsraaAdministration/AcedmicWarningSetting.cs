//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaAdministration
{
    using System;
    using System.Collections.Generic;
    
    public partial class AcedmicWarningSetting
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int ProgramID { get; set; }
        public int SemesterID { get; set; }
        public double WarningGPA { get; set; }
        public double FatalWarningGPA { get; set; }
        public int StudentMaxWarningHour { get; set; }
        public int PlanMinWarningHour { get; set; }
        public bool DontTakeSummerSemester { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceFormatDetails
    {
        public int ID { get; set; }
        public string AttendanceFormatID { get; set; }
        public int DayID { get; set; }
        public TimeSpan AttendanceFrom { get; set; }
        public TimeSpan AttendanceTo { get; set; }
        public int EmployeeID { get; set; }
        public bool IsDelete { get; set; }
        public DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public DateTime UpdateDate { get; set; }
        public int UpdateEmployeeID { get; set; }
        public DateTime DeleteDate { get; set; }
        public int DeleteEmployeeID { get; set; }
        public string DayName { get; set; }
        public List<SelectListItem> Days { get; set; }


    }
}

using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeeAttendanceFormat
    {
        public int ID { get; set; }

        //[Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }


        public int? AttendanceFormatID { get; set; }

        //[Required(ErrorMessage = "الرجاء ادراج تاريخ بداية الدوام الإفتراضي")]
        public String ActiveFromDate { get; set; }

        public String ActiveToDate { get; set; }

        public int UserID { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> AttendanceFormats { get; set; }
    }
}

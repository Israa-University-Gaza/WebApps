using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeeAttendanceFormatVM
    {
        public EmployeeAttendanceFormatFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeAttendanceFormatVM(EmployeeAttendanceFormatFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeAttendanceFormatFilter
    {
        public string EmployeeName { get; set; }
        public string AttendanceFormatID { get; set; }
        public string AttendanceFormatDate { get; set; }

        public List<SelectListItem> AttendanceFormats { get; set; }
        public EmployeeAttendanceFormatFilter()
        {
        }

        public EmployeeAttendanceFormatFilter(string EmployeeName, string AttendanceFormatID, string AttendanceFormatDate, List<SelectListItem> AttendanceFormats)
        {
            this.EmployeeName = EmployeeName;
            this.AttendanceFormatID = AttendanceFormatID;
            this.AttendanceFormatDate = AttendanceFormatDate;
            this.AttendanceFormats = AttendanceFormats;
        }
    }
}

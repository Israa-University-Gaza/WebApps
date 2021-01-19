using System;
using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceDailyVM
    {
        public AttendanceDailyFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public AttendanceDailyVM(AttendanceDailyFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class AttendanceDailyFilter
    {
        public string AttendanceDate { get; set; }
        public string EmployeeName { get; set; }

        public AttendanceDailyFilter()
        {
            AttendanceDate = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public AttendanceDailyFilter(string AttendanceDate, string EmployeeName)
        {
            this.AttendanceDate = AttendanceDate;
            this.EmployeeName = EmployeeName;
        }
    }
}

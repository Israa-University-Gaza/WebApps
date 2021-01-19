using System;
using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class MissedFingerprintsVM
    {
        public MissedFingerprintsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public MissedFingerprintsVM(MissedFingerprintsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class MissedFingerprintsFilter
    {
        public string AttendanceDate { get; set; }
        public string EmployeeName { get; set; }

        public MissedFingerprintsFilter()
        {
            AttendanceDate = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public MissedFingerprintsFilter(string AttendanceDate, string EmployeeName)
        {
            this.AttendanceDate = AttendanceDate;
            this.EmployeeName = EmployeeName;
        }
    }
}

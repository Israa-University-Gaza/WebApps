using System.Data;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceDailyDetails
    {
        public string EmployeeName { get; set; }
        public string AttendanceDate { get; set; }
        public string DefaultFrom { get; set; }
        public string DefaultTo { get; set; }
        public string AttendanceFrom { get; set; }
        public string AttendanceTo { get; set; }
        public string MorningLateMinutes { get; set; }
        public string EveningLateMinutes { get; set; }
        public string ExitMinutes { get; set; }
        public string OtherLateMinutes { get; set; }
        public DataTable AttendanceExits { get; set; }
    }
}

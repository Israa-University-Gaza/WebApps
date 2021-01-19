using System;

namespace IsraaSystem.Core.Classic.HumanResource.ViewModels
{
    class AttendanceFormatDetailsAddEdit
    {
        public int ID { get; set; }
        public int AttendanceFormatID { get; set; }
        public int DayID { get; set; }
        public DateTime AttendanceFrom { get; set; }
        public DateTime AttendanceTo { get; set; }
        public int EmployeeID { get; set; }

    }
}

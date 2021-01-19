using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.HumanResource.EmployeePersonal;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeAddNew
{
    public class EmployeeAddNewVM
    {

        public EmployeeMainData EmployeeMainData { get; set; }

        public EmployeeContactData EmployeeContactData { get; set; }

        public EmployeePlacement.EmployeePlacement EmployeePlacement { get; set; }

        public EmpEmploymentType.EmpEmploymentType EmpEmploymentType { get; set; }
        public EmpStatus.EmpStatus EmpStatus { get; set; }

        public EmployeeAttendanceFormat EmployeeAttendanceFormat { get; set; }

    }
}

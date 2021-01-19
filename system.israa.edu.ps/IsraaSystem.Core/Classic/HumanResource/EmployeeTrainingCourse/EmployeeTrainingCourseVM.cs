using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeTrainingCourse
{
    public class EmployeeTrainingCourseVM
    {
        public EmployeeTrainingCourseFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeTrainingCourseVM(EmployeeTrainingCourseFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeTrainingCourseFilter
    {
        public int EmployeeID { get; set; }
        public string CourseName { get; set; }

        public EmployeeTrainingCourseFilter()
        {
        }

        public EmployeeTrainingCourseFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }

        public EmployeeTrainingCourseFilter(int EmployeeID, string CourseName)
        {
            this.EmployeeID = EmployeeID;
            this.CourseName = CourseName;
        }
    }
}

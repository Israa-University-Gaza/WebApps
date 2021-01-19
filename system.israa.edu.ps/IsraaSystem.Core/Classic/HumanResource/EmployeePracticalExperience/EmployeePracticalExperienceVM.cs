using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePracticalExperience
{
    public class EmployeePracticalExperienceVM
    {
        public EmployeePracticalExperienceFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeePracticalExperienceVM(EmployeePracticalExperienceFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeePracticalExperienceFilter
    {
        public int EmployeeID { get; set; }
        public string Job { get; set; }

        public EmployeePracticalExperienceFilter()
        {
        }

        public EmployeePracticalExperienceFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeePracticalExperienceFilter(int EmployeeID, string Job)
        {
            this.EmployeeID = EmployeeID;
            this.Job = Job;
        }
    }
}

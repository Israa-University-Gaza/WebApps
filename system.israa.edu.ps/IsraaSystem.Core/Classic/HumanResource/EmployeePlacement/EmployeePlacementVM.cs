using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePlacement
{
    public class EmployeePlacementVM
    {
        public EmployeePlacementsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeePlacementVM(EmployeePlacementsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }

        public EmployeePlacementVM(EmployeePlacementsFilter filter, DataTable data)
        {
            this.filter = filter;
            this.data = data;
        }
    }

    public class EmployeePlacementsFilter
    {
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeDMName { get; set; }
        public string DepartmentID { get; set; }
        public string JobID { get; set; }

        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Jobs { get; set; }

        public EmployeePlacementsFilter()
        {
            EmployeeID = -1;
        }

        public EmployeePlacementsFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }

        public EmployeePlacementsFilter(string EmployeeName, string EmployeeDMName, string DepartmentID, string JobID, List<SelectListItem> Departments, List<SelectListItem> Jobs)
        {
            EmployeeID = -1;
            this.EmployeeName = EmployeeName;
            this.EmployeeDMName = EmployeeDMName;
            this.DepartmentID = DepartmentID;
            this.JobID = JobID;
            this.Departments = Departments;
            this.Jobs = Jobs;
        }
    }
}

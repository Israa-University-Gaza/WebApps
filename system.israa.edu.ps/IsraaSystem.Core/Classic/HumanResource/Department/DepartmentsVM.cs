using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Department
{
    public class DepartmentsVM
    {
        public DepartmentsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public DepartmentsVM(DepartmentsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class DepartmentsFilter
    {
        public string DepartmentName { get; set; }
        public string DepartmentID { get; set; }

        public List<SelectListItem> Departments { get; set; }

        public DepartmentsFilter()
        {
        }

        public DepartmentsFilter(string DepartmentID, string DepartmentName, List<SelectListItem> Departments)
        {
            this.DepartmentID = DepartmentID;
            this.DepartmentName = DepartmentName;
            this.Departments = Departments;
        }
    }
}

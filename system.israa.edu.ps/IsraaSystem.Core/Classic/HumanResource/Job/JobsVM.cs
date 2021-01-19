using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobsVM
    {
        public JobsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public JobsVM(JobsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class JobsFilter
    {
        public string JobTitle { get; set; }
        public string DepartmentID { get; set; }

        public List<SelectListItem> Departments { get; set; }

        public JobsFilter()
        {
        }

        public JobsFilter(string JobTitle, string DepartmentID, List<SelectListItem> Departments)
        {
            this.JobTitle = JobTitle;
            this.DepartmentID = DepartmentID;
            this.Departments = Departments;
        }
    }
}

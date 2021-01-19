using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Employee
{
    public class EmployeeVM
    {
        public EmployeeFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeVM(EmployeeFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeFilter
    {
        public string EmployeeNo { get; set; }
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }
        public string EmployeeStatusID { get; set; }
        public string EmploymentTypeID { get; set; }

        public List<SelectListItem> EmployeeStatuses { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }

        public EmployeeFilter()
        {
        }
        public EmployeeFilter(string EmployeeStatusID, string EmploymentTypeID, List<SelectListItem> EmployeeStatuses, List<SelectListItem> EmploymentTypes)
        {
            this.EmployeeStatusID = EmployeeStatusID;
            this.EmploymentTypeID = EmploymentTypeID;
            this.EmployeeStatuses = EmployeeStatuses;
            this.EmploymentTypes = EmploymentTypes;
        }
    }
}

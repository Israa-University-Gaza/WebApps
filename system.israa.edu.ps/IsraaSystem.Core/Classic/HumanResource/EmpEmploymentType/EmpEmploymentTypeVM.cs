using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmpEmploymentType
{
    public class EmpEmploymentTypeVM
    {
        public EmpEmploymentTypeFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmpEmploymentTypeVM(EmpEmploymentTypeFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmpEmploymentTypeFilter
    {
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string EmploymentTypeID { get; set; }
        public string EmployeeStatusID { get; set; }
        
        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> EmployeeStatuses { get; set; }
        
        public EmpEmploymentTypeFilter()
        {
        }
        public EmpEmploymentTypeFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmpEmploymentTypeFilter(string EmployeeName, string EmployementTypeID, string EmployeeStatusID, List<SelectListItem> EmploymentTypes, List<SelectListItem> EmployeeStatuses)
        {
            EmployeeID = -1;
            this.EmployeeName = EmployeeName;
            this.EmploymentTypeID = EmploymentTypeID;
            this.EmploymentTypes = EmploymentTypes;
            this.EmployeeStatusID = EmployeeStatusID;
            this.EmployeeStatuses = EmployeeStatuses;
        }
    }
}

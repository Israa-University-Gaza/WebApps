using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeQualification
{
    public class EmployeeQualificationVM
    {
        public EmployeeQualificationsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeQualificationVM(EmployeeQualificationsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeQualificationsFilter
    {
        public int? EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string QualificationTypeID { get; set; }
        public string UniversityName { get; set; }
        public string Department { get; set; }
        public string College { get; set; }

        public List<SelectListItem> QualificationTypes { get; set; }

        public EmployeeQualificationsFilter()
        {
        }

        public EmployeeQualificationsFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeeQualificationsFilter(string EmployeeName, string QualificationTypeID, string UniversityName, string Department, string College, List<SelectListItem> QualificationTypes)
        {
            this.EmployeeName = EmployeeName;
            this.QualificationTypeID = QualificationTypeID;
            this.UniversityName = UniversityName;
            this.Department = Department;
            this.College = College;
            this.QualificationTypes = QualificationTypes;
        }
    }
}

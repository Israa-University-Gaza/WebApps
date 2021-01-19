using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeFamily
{
    public class EmployeeFamilyVM
    {
        public EmployeeFamilyFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeFamilyVM(EmployeeFamilyFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeFamilyFilter
    {
        public int EmployeeID { get; set; }
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }
        public string RelativeTypeID { get; set; }
        public string MaritalStatusID { get; set; }
        public string PersonStatusID { get; set; }

        public List<SelectListItem> RelativeTypes { get; set; }
        public List<SelectListItem> MaritalStatuses { get; set; }
        public List<SelectListItem> PersonStatuses { get; set; }


        public EmployeeFamilyFilter()
        {
        }

        public EmployeeFamilyFilter(int EmployeeID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string RelativeTypeID, string MaritalStatusID, string PersonStatusID, List<SelectListItem> RelativeTypes, List<SelectListItem> MaritalStatuses, List<SelectListItem> PersonStatuses)
        {
            this.EmployeeID = EmployeeID;
            this.ArFirstName = ArFirstName;
            this.ArSecoundName = ArSecoundName;
            this.ArThirdName = ArThirdName;
            this.ArFamilyName = ArFamilyName;
            this.RelativeTypeID = RelativeTypeID; 
            this.MaritalStatusID = MaritalStatusID;
            this.PersonStatusID = PersonStatusID;
            this.RelativeTypes = RelativeTypes;
            this.MaritalStatuses = MaritalStatuses;
            this.PersonStatuses = PersonStatuses;

        }


        public EmployeeFamilyFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;

        }
    }
}

using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Contract

{
    public class ContractInstructorVM
    {
        public ContractInstructorFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }
        public DataTable statistics { get; set; }

        public ContractInstructorVM(ContractInstructorFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }

    }


    public class ContractInstructorFilter
    {
        public string InstructorName { get; set; }
        public string SemesterID { get; set; }
        public string EmploymentTypeID { get; set; }

        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }
        public ContractInstructorFilter()
        {
        }

        public ContractInstructorFilter(string InstructorName, string EmploymentTypeID, List<SelectListItem> Semesters, List<SelectListItem> EmploymentTypes)
        {
            this.InstructorName = InstructorName;
            this.EmploymentTypeID = EmploymentTypeID;
            this.SemesterID = Semesters[0].Value;
            this.Semesters = Semesters;
            this.EmploymentTypes = EmploymentTypes;
        }
    }
}

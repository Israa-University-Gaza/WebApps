using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class EmployeeDeductionVM
    {
        public EmployeeDeductionFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeDeductionVM()
        {
        }

        public EmployeeDeductionVM(EmployeeDeductionFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeDeductionFilter
    {
        public string EmployeeName { get; set; }
        public string DeductionID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public List<SelectListItem> Deductions { get; set; }


        public EmployeeDeductionFilter()
        {
        }

        public EmployeeDeductionFilter(string EmployeeName, string DeductionID, string DateFrom, string DateTo, List<SelectListItem> Deductions)
        {
            this.EmployeeName = EmployeeName;
            this.DeductionID = DeductionID;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.Deductions = Deductions;
        }
    }
}

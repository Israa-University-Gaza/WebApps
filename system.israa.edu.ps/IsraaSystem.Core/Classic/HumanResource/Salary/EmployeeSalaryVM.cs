using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class EmployeeSalaryVM
    {
        public EmployeeSalaryFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeSalaryVM()
        {
        }

        public EmployeeSalaryVM(EmployeeSalaryFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeSalaryFilter
    {
        public string EmployeeID { set; get; }
        public string Year { get; set; }
        public string MonthID { get; set; }
        public string CurrencyID { get; set; }
        public string SalaryBoxID { get; set; }

        public List<SelectListItem> Months { get; set; }
        public List<SelectListItem> Currencies { get; set; }
        public List<SelectListItem> SalaryBoxes { get; set; }
        public EmployeeSalaryFilter()
        {
        }

        public EmployeeSalaryFilter(string EmployeeID, string Year, string MonthID, string CurrencyID, string SalaryBoxID, List<SelectListItem> Months, List<SelectListItem> Currencies, List<SelectListItem> SalaryBoxes)
        {
            this.EmployeeID = EmployeeID;
            this.Year = Year;
            this.MonthID = MonthID;
            this.CurrencyID = CurrencyID;
            this.SalaryBoxID = SalaryBoxID;
            this.Months = Months;
            this.Currencies = Currencies;
            this.SalaryBoxes = SalaryBoxes;
        }

        public List<SelectListItem> Employees { get; set; }
    }
}

using IsraaSystem.Entity.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class BasicSalaryVM
    {
        public BasicSalaryFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public BasicSalaryVM()
        {
        }

        public BasicSalaryVM(BasicSalaryFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class BasicSalaryFilter
    {
        public string EmployeeName { get; set; }
        public string SalaryBoxID { get; set; }
        public string SalaryBoxTypeID { get; set; }
        public string EmploymentTypeID { get; set; }
        public string CurrencyID { get; set; }
        public string EmployeeStatusID { get; set; }
        public string SalaryDate { get; set; }

        public List<SelectListItem> Currencies { get; set; }
        public List<SelectListItem> SalaryBoxes { get; set; }
        public List<SelectListItem> SalaryBoxTypes { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> EmployeeStatuses { get; set; }


        public BasicSalaryFilter()
        {
        }

        public BasicSalaryFilter(string EmployeeName, string CurrencyID, string SalaryBoxID, string SalaryBoxTypeID, string EmploymentTypeID, string EmployeeStatusID/*, string Amount*/, List<SelectListItem> SalaryBoxes, List<SelectListItem> SalaryBoxTypes, List<SelectListItem> EmploymentTypes, List<SelectListItem> EmployeeStatuses, List<SelectListItem> Currencies)
        {
            this.EmployeeName = EmployeeName;
            this.SalaryBoxID = SalaryBoxID;
            this.SalaryBoxTypeID = SalaryBoxTypeID;
            this.EmploymentTypeID = EmploymentTypeID;
            this.EmployeeStatusID = EmployeeStatusID;
            this.CurrencyID = CurrencyID;
            //this.Amount = Amount;
            SalaryDate = DateTime.Now.ToString("yyyy/MM/dd");
            this.SalaryBoxes = SalaryBoxes;
            this.SalaryBoxTypes = SalaryBoxTypes;
            this.EmploymentTypes = EmploymentTypes;
            this.EmployeeStatuses = EmployeeStatuses;
            this.Currencies = Currencies;
        }
    }
}

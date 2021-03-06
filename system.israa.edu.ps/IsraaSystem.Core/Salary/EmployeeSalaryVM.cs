﻿using IsraaSystem.Entity.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
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
        public string EmployeeName { get; set; }
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

        public EmployeeSalaryFilter(string EmployeeName, string Year, string MonthID, string CurrencyID, string SalaryBoxID, List<SelectListItem> Months, List<SelectListItem> Currencies, List<SelectListItem> SalaryBoxes)
        {
            this.EmployeeName = EmployeeName;
            this.Year = Year;
            this.MonthID = MonthID;
            this.CurrencyID = CurrencyID;
            this.SalaryBoxID = SalaryBoxID;
            this.Months = Months;
            this.Currencies = Currencies;
            this.SalaryBoxes = SalaryBoxes;
        }
    }
}
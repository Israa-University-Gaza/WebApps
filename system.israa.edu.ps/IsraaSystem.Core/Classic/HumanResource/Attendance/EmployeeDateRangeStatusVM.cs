using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeeDateRangeStatusVM
    {
        public EmployeeDateRangeStatusFilter filter { get; set; }
        public DataTable data { get; set; }

        public EmployeeDateRangeStatusVM(EmployeeDateRangeStatusFilter filter)
        {
            this.filter = filter;
        }

        public EmployeeDateRangeStatusVM()
        {
        }
    }

    public class EmployeeDateRangeStatusFilter
    {
        public string EmployeeID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public string DayStatusID { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> DayStatuses { get; set; }

        public EmployeeDateRangeStatusFilter()
        {
        }

        public EmployeeDateRangeStatusFilter(List<SelectListItem> Employees, List<SelectListItem> DayStatuses)
        {
            EmployeeID = (Employees.Count > 0) ? Employees[0].Value : "";
            DayStatusID = "";
            DateFrom = DateTime.Now.AddMonths(-1).ToString("yyyy/MM/dd");
            DateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.Employees = Employees;
            this.DayStatuses = DayStatuses;
        }
    }
}

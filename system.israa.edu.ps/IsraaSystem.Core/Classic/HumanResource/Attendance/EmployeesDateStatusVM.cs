using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeesDateStatusVM
    {
        public EmployeesDateStatusFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeesDateStatusVM(EmployeesDateStatusFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeesDateStatusFilter
    {
        public string EmployeeName { get; set; }
        public string AttendanceDate { get; set; }
        public string DayStatusID { get; set; }

        public List<SelectListItem> DayStatuses { get; set; }

        public EmployeesDateStatusFilter()
        {
            AttendanceDate = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public EmployeesDateStatusFilter(string EmployeeName, string DayStatusID, List<SelectListItem> DayStatuses)
        {
            AttendanceDate = DateTime.Now.ToString("yyyy/MM/dd");
            this.EmployeeName = EmployeeName;
            this.DayStatusID = DayStatusID;
            this.DayStatuses = DayStatuses;
        }
    }
}

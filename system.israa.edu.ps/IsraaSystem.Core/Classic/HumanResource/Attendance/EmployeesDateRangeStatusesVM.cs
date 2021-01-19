using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeesDateRangeStatusesVM
    {
        public EmployeesDateRangeStatusesFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeesDateRangeStatusesVM(EmployeesDateRangeStatusesFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeesDateRangeStatusesFilter
    {
        public string EmployeeName { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public string DayStatusID { get; set; }
        public string EmployeeStatusID { get; set; }

        public List<SelectListItem> DayStatuses { get; set; }
        public List<SelectListItem> EmployeeStatuses { get; set; }
        public EmployeesDateRangeStatusesFilter()
        {
           
        }

        public EmployeesDateRangeStatusesFilter(string EmployeeName, string DateFrom, string DateTo, string DayStatusID, string EmployeeStatusID,List<SelectListItem> DayStatuses,List<SelectListItem> EmployeeStatuses)
        {
            this.EmployeeName = EmployeeName;
            this.DateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            this.DateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.DayStatusID = DayStatusID;
            this.DayStatuses = DayStatuses;
            this.EmployeeStatusID = EmployeeStatusID;
            this.EmployeeStatuses = EmployeeStatuses;
        }
    }
}

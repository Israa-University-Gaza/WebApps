using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.AttendanceExit
{
    public class AttendanceExitsVM
    {
        public AttendanceExitsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public AttendanceExitsVM(AttendanceExitsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class AttendanceExitsFilter
    {
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public string AttendanceExitTypeID { get; set; }

        public List<SelectListItem> AttendanceExitTypes { get; set; }

        public AttendanceExitsFilter()
        {
            EmployeeID = -1;
        }

        public AttendanceExitsFilter(List<SelectListItem> AttendanceExitTypes)
        {
            EmployeeID = -1;
            DateFrom = DateTime.Now.AddMonths(-1).ToString("yyyy/MM/dd");
            DateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.AttendanceExitTypes = AttendanceExitTypes;
        }
    }
}

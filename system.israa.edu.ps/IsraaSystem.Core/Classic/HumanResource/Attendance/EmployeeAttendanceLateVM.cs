using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeeAttendanceLateVM
    {
        public EmployeeAttendanceLateFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeAttendanceLateVM(EmployeeAttendanceLateFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeAttendanceLateFilter
    {
        public string EmployeeName { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public string LateTypeID { get; set; }

        public List<SelectListItem> LateTypes { get; set; }

        public EmployeeAttendanceLateFilter()
        {
            DateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            DateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public EmployeeAttendanceLateFilter(string EmployeeName, string LateTypeID, List<SelectListItem> LateTypes)
        {
            this.EmployeeName = EmployeeName;
            this.LateTypeID = LateTypeID;
            this.LateTypes = LateTypes;
            DateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            DateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }
}

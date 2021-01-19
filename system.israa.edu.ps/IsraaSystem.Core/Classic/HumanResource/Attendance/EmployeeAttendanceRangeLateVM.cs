using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class EmployeeAttendanceRangeLateVM
    {
        public EmployeeAttendanceRangeLateFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        //public EmployeeAttendanceRangeLateVM(EmployeeAttendanceRangeLateFilter filter, Pagging pagging)
        //{
        //    this.filter = filter;
        //    this.pagging = pagging;
        //}

        public EmployeeAttendanceRangeLateVM(EmployeeAttendanceRangeLateFilter filter)
        {
            this.filter = filter;
        }
    }

    public class EmployeeAttendanceRangeLateFilter
    {
        public string EmployeeID{ get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set;}
        public string LateTypeID { get; set; }

        public List<SelectListItem> LateTypes { get; set; }
        public List<SelectListItem> Employees { get; set; }

        public EmployeeAttendanceRangeLateFilter()
        {
            DateFrom = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            DateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }


        public EmployeeAttendanceRangeLateFilter(string EmployeeID, string DateFrom, string DateTo, string LateTypeID, List<SelectListItem> LateTypes, List<SelectListItem> Employees)
        {
            this.EmployeeID = EmployeeID;
            this.LateTypeID = LateTypeID;
            this.LateTypes = LateTypes;
            this.Employees=Employees;
           this. DateFrom = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
           this .DateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }
}

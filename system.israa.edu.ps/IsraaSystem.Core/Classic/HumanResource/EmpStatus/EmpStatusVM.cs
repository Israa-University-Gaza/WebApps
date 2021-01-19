using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmpStatus
{
    public class EmpStatusVM
    {
        public EmpStatusFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmpStatusVM(EmpStatusFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmpStatusFilter
    {

        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeStatusID { get; set; }
        public string Date { get; set; }

        public List<SelectListItem> EmployeeStatuses { get; set; }




        public EmpStatusFilter()
        {
            EmployeeID = -1;
        }

        public EmpStatusFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }


        public EmpStatusFilter(string EmployeeName, string EmployeeStatusID, List<SelectListItem> EmployeeStatuses)
        {
            EmployeeID = -1;
            this.EmployeeName = EmployeeName;
            this.EmployeeStatusID = EmployeeStatusID;
            this.EmployeeStatuses = EmployeeStatuses;
            Date = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }
}

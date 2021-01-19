using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceMonthlyVM
    {
        public AttendanceMonthlyFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public AttendanceMonthlyVM(AttendanceMonthlyFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class AttendanceMonthlyFilter
    {
        public string EmployeeName { get; set; }
        public string Year { get; set; }
        public string MonthID { get; set; }

        public string VacationBalanceYearID { get; set; }
        
        public List<SelectListItem> Monthes { get; set; }
        public List<SelectListItem> VacationBalanceYears { get; set; }

        public AttendanceMonthlyFilter()
        {
        }

        public AttendanceMonthlyFilter(string EmployeeName, string Year, string MonthID, string VacationBalanceYearID, List<SelectListItem> Monthes, List<SelectListItem> VacationBalanceYears)
        {
            this.EmployeeName = EmployeeName;
            this.Year = Year;
            this.MonthID = MonthID;
            this.VacationBalanceYearID = VacationBalanceYearID;
            this.Monthes = Monthes;
            this.VacationBalanceYears = VacationBalanceYears;
        }
    }
}

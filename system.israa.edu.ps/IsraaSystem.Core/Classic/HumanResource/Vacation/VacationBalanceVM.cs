using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class VacationBalanceVM
    {
        public VacationBalanceFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public VacationBalanceVM(VacationBalanceFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class VacationBalanceFilter
    {
        public string EmployeeName { get; set; }
        public string VacationTypeID { get; set; }
        public string VacationBalanceYearID { get; set; }

        public List<SelectListItem> VacationTypes { get; set; }
        public List<SelectListItem> VacationBalanceYears { get; set; }
        public VacationBalanceFilter()
        {
        }

        public VacationBalanceFilter(string EmployeeName, string VacationTypeID,string VacationBalanceYearID, List<SelectListItem> VacationTypes, List<SelectListItem> VacationBalanceYears)
        {
            this.EmployeeName = EmployeeName;
            this.VacationTypeID = VacationTypeID;
            this.VacationBalanceYearID = VacationBalanceYearID;
            this.VacationTypes = VacationTypes;
            this.VacationBalanceYears = VacationBalanceYears;
        }
        public VacationBalanceFilter(string EmployeeName,string VacationBalanceYearID, List<SelectListItem> VacationBalanceYears)
        {
            this.EmployeeName = EmployeeName;
            this.VacationBalanceYearID = VacationBalanceYearID;
            this.VacationBalanceYears = VacationBalanceYears;
        }
    }
}

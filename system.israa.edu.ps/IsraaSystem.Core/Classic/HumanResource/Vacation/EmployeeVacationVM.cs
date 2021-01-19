using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class EmployeeVacationVM
    {
        public EmployeeVacationsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeVacationVM(EmployeeVacationsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeVacationsFilter
    {
        public string EmployeeName { get; set; }
        public string VacationTypeID { get; set; }
        public string AccreditationStatusID { get; set; }
        public string VacationBalanceYearID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public List<SelectListItem> VacationTypes { get; set; }
        public List<SelectListItem> AccreditationStatuses { get; set; }
        public List<SelectListItem> VacationBalanceYears { get; set; }

        public EmployeeVacationsFilter()
        {
        }

        public EmployeeVacationsFilter(string EmployeeName, string VacationTypeID,string AccreditationStatusID, string VacationBalanceYearID ,string DateFrom, string DateTo, List<SelectListItem> VacationTypes, List<SelectListItem> AccreditationStatuses,List<SelectListItem> VacationBalanceYears)
        {
            this.EmployeeName = EmployeeName;
            this.VacationTypeID = VacationTypeID;
            this.AccreditationStatusID = AccreditationStatusID;
            this.VacationBalanceYearID = VacationBalanceYearID;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.VacationTypes = VacationTypes;
            this.AccreditationStatuses = AccreditationStatuses;
            this.VacationBalanceYears = VacationBalanceYears;
        }
    }
}

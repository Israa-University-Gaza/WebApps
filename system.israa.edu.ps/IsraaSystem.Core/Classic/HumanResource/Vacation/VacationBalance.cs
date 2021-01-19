using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class VacationBalance
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء إختيار الموظف")]
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "الرجاء إختيار سنة الرصيد")]
        public int VacationBalanceYearID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخل تاريخ بدء الرصيد")]
        public string DateFrom { get; set; }

        [Required(ErrorMessage = "الرجاء ادخل تاريخ نهاية الرصيد")]
        public string DateTo { get; set; }

        [Required(ErrorMessage = "الرجاء ادخل  الرصيد المرحل")]
        public int PostponeDays { get; set; }

        [Required(ErrorMessage = "الرجاء ادخل  الرصيد الافتراضي")]
        public int DefualtDays { get; set; }

        public int UserID { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> VacationTypes { get; set; }
        public List<SelectListItem> VacationBalanceYears { get; set; }
    }
}

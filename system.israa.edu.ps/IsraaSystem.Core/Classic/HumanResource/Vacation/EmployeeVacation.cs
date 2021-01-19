using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class EmployeeVacation
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الإجازة")]
        public int VacationTypeID { get; set; }
        public string RequestDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج بداية الإجازة")]
        public string VacationStartDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج نهاية الإجازة")]
        public string VacationEndDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال سبب الإجازة")]
        public string VacationReason { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار مكان الإجازة")]
        public int VacationPlaceID { get; set; }
        public int ReplaceEmployeeName { get; set; }
        public string HumanResourceNote { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> VacationTypes { get; set; }
        public List<SelectListItem> VacationPlaces { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

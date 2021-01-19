using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class EmployeeVacationTypeEdit
    {
        public int ID { get; set; }
        public string EmployeeName { get; set; }
        [Required(ErrorMessage = "الرجاءاختيار نوع الاجازة")]
        public int VacationTypeID { get; set; }
        public string VacationStartDate { get; set; }
        public string VacationEndDate { get; set; }
        public string VacationDays { get; set; }

        [Required(ErrorMessage = "الرجاءادخال سبب تغير نوع الاجازة")]
        public string HumanResourceNote { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> VacationTypes { get; set; }
    }
}

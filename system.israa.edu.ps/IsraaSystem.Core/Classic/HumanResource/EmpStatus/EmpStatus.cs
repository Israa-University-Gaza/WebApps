using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmpStatus
{
   public class EmpStatus
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار حالة الموظف")]
        public int EmployeeStatusID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية الفترة")]
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public string Notes { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> EmployeeStatuses { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class EmployeeBonus
    {



        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار راتب الموظف")]
        public int BasicSalaryID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار العلاوة")]
        public int BonusID { set; get; }
        public float Amount { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج تاريخ بداية العلاوة")]
        public string DateFrom { set; get; }
        public string DateTo { set; get; }
        public string Note { set; get; }
        public int UserID { set; get; }

        public string EmployeeName { set; get; }
        public string BasicSalaryAmount { set; get; }
        public List<SelectListItem> Bonuses { get; set; }
        public List<SelectListItem> BasicSalaries { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

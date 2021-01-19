using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class EmployeeSalary
    {
        [Required(ErrorMessage = "الرجاء ادراج السنة")]
        public int Year { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار الشهر")]
        public int MonthID { set; get; }
        public string EmployeeID { set; get; }
        public int BasicSalaryID { set; get; }
        public float BasicSalary { set; get; }
        public float TotalBonus { set; get; }
        public float TotalDeduction { set; get; }
        public float FinalSalary { set; get; }
        public int UserID { set; get; }

        public string EmployeeName { set; get; }

        public List<SelectListItem> Months { set; get; }
        public List<SelectListItem> Employees { set; get; }
    }
}

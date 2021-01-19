using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class EmployeeDeduction
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار راتب الموظف")]
        public int BasicSalaryID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الخصمية")]
        public int DeductionID { set; get; }
        public float Amount { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج تاريخ بداية الخصمية")]
        public string DateFrom { set; get; }
        public string DateTo { set; get; }
        public string Note { set; get; }
        public int UserID { set; get; }

        public string EmployeeName { set; get; }
        public string BasicSalaryAmount { set; get; }
        public List<SelectListItem> Deductions { get; set; }
        public List<SelectListItem> BasicSalaries { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

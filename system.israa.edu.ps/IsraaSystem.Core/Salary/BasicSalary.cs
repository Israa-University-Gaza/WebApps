using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class BasicSalary
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار صندوق الراتب")]
        public int SalaryBoxID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار العملة")]
        public int CurrencyID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج قيمة الراتب")]
        public float Amount { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج تاريخ بداية قيمة الراتب")]
        public string DateFrom { set; get; }
        public string DateTo { set; get; }
        public int UserID { set; get; }

        public List<SelectListItem> SalaryBoxes { get; set; }
        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> Currencies { get; set; }
    }
}

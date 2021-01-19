using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmpEmploymentType
{
    public class EmpEmploymentType
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج رقم الموظف")]
        public string EmployeeNo { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع التوظيف")]
        public int EmploymentTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج بداية تاريخ التوظيف")]
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public int UserID { get; set; }

        public string EmployeeName { get; set; }
        public string EmploymentType { get; set; }

        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

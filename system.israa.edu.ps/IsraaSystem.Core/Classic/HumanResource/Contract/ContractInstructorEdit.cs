using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Contract
{
    public class ContractInstructorEdit
    {

        public int ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال سعر الساعة")]
        public decimal HourPrice { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار العملة")]
        public int CurrencyID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار درجة المحاضر")]
        public int InstructorTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع توظيف المحاضر")]
        public int EmploymentTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار البرنامج")]
        public int ProgramID { get; set; }
        public string InstructorName { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية فترة العقد ")]
        public string DateFrom { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال نهاية فترة العقد ")]
        public string DateTo { get; set; }
        public int EmployeeID { get; set; }
        public List<SelectListItem> Currencies { get; set; }
        public List<SelectListItem> InstructorTypes { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> Programs { get; set; }
    }
}

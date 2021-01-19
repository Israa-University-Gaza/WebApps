using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class SalaryBox
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار نوع صندوق الراتب")]
        public int SalaryBoxTypeID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج صندوق الراتب")]
        public string Name { set; get; }
        public int UserID { set; get; }

        public List<SelectListItem> SalaryBoxTypes { get; set; }
    }
}

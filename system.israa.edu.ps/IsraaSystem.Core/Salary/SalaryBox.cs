using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
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

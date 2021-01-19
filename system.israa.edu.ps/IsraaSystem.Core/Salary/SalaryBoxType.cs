using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class SalaryBoxType
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج نوع صندوق الراتب")]
        public string Name { set; get; }
        public int UserID { set; get; }
    }
}

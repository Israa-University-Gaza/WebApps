using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class BonusType
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج نوع علاوة الراتب")]
        public string Name { set; get; }
        public int UserID { set; get; }
    }
}

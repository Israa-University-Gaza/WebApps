using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class SalaryBoxType
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج نوع صندوق الراتب")]
        public string Name { set; get; }
        public int UserID { set; get; }
    }
}

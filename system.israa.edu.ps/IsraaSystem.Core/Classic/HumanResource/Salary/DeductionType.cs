using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class DeductionType
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج نوع خصمية الراتب")]
        public string Name { set; get; }
        public int UserID { set; get; }
    }
}

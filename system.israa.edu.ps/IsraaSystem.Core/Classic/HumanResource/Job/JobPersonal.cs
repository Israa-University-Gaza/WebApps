using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobPersonal
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج المواصفات الشخصية")]
        public string Name { get; set; }
        public int UserID { get; set; }
    }
}

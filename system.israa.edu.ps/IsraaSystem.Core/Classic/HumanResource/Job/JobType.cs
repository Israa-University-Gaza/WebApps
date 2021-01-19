using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobType
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج نوع الوظيفة بالعربية")]
        public string ArName { get; set; }

        public string EnName { get; set; }

        public int EmployeeID { get; set; }
    }
}

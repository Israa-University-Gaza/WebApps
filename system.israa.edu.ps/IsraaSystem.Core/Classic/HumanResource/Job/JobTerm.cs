using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobTerm
    {
        public int? ID { get; set; }

        public int JobID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج شروط شغل الوظيفة بالعربية")]
        public string ArName { get; set; }

        public string EnName { get; set; }

        public int OrderNum { get; set; }

        public int EmployeeID { get; set; }
    }
}

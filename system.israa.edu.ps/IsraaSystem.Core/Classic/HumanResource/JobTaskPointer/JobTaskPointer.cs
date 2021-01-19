using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.JobTaskPointer
{
    public class JobTaskPointer
    {
        public int? ID { get; set; }

        public int JobID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج مؤشر أداء الوظيفة بالعربية")]
        public string ArName { get; set; }

        public string EnName { get; set; }

        public int OrderNum { get; set; }

        public int EmployeeID { get; set; }

    }
}

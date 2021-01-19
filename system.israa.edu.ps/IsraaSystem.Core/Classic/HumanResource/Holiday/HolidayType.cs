using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Holiday
{
    public class HolidayType
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج نوع الإجازة بالعربية")]
        public string ArName { get; set; }

        public int EmployeeID { get; set; }
    }
}

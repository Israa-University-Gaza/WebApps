using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceFormat
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج نسق الدوام بالعربية")]
        public string ArName { get; set; }
        public string EnName { get; set; }
        public int InsertEmployeeID { get; set; }
    }
}

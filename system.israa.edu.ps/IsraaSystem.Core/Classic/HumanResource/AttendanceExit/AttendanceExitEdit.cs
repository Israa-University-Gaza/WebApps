using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.AttendanceExit
{

    public class AttendanceExitEdit
    {
        public int ID { get; set; }
        public string EmployeeName { get; set; }
        public string AttendanceExitType { get; set; }
        public string ExitDate { get; set; }
        public string ExpectedTimeFrom { get; set; }
        public string ExpectedTimeTo { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال ساعة الخروج الفعلية")]
        public string ActualTimeFrom { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة الخروج الفعلية")]
        public string ActualTimeTo { get; set; }
        public int UserID { get; set; }
    }
}

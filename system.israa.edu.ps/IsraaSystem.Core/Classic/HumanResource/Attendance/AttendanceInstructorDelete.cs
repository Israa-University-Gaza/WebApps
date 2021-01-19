using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceInstructorDelete
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال سبب الحذف")]
        public string DeleteReason { get; set; }
        public int UserID { get; set; }
    }
}

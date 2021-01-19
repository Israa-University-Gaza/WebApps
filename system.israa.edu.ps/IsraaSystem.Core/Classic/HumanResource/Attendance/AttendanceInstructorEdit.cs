using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceInstructorEdit
    {
        public int? ID { get; set; }


        [Required(ErrorMessage = "الرجاء ادخال تاريخ المحاضرة")]
        public string LectureDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة بدء المحاضرة")]
        public string LectureFrom { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة نهاية المحاضرة")]
        public string LectureTo { get; set; }
        public int UserID { get; set; }
        public string Semester { get; set; }
        public string InstructorName { get; set; }
        public string Course { get; set; }
        public string SectionNum { get; set; }
    }
}

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceInstructor
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار المحاضر")]
        public int InstructorID { get; set; }
        public int SemesterID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار المحاضرة")]
        public int LectureID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال تاريخ المحاضرة")]
        public string LectureDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة بدء المحاضرة")]
        public string LectureFrom { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة نهاية المحاضرة")]
        public string LectureTo { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> Instructors { get; set; }
        public List<SelectListItem> Lectures { get; set; }

        //public AttendanceInstructor()

        //{
        //    SemesterID = 8;
        //}

    }

}

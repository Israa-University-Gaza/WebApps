using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Academic.Section;

namespace IsraaSystem.Core.Classic.Academic.OfferdCourse
{
    public class OfferdCourse
    {
        public int? ID { get; set; }
        public int ? OfferdCourseTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الفصل الدراسي")]
        public int SemesterID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار القسم")]
        public int DepartmentID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار المساق")]
        public int CourseID { get; set; }
        public string InstructorID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال عدد شعب الطلاب ")]
        public int MSectionCount { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال عدد شعب الطالبات ")]
        public int FSectionCount { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال عدد الشعب المشتركة ")]
        public int MFSectionCount { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال سعة الشعبة الواحدة ")]
        public int Capacity { get; set; }
        public bool IsActive { get; set; }
        public int UserID { get; set; }

        public string ProgramName { get; set; }
        public string CollegeName { get; set; }
        public string DepartmentName { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string CourseHours { get; set; }
        public string InstructorName { get; set; }

        
        public SectionVM SectionVM { get; set; }

        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> Programs { get; set; }
        public List<SelectListItem> Colleges { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Courses { get; set; }
        public List<SelectListItem> Instructors { get; set; }
    }
}

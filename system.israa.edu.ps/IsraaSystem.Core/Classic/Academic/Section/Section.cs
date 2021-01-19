using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.Section
{
    public class Section
    {
        public int OfferdCourseID { get; set; }

        public string CourseName { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار المحاضر")]
        public int InstructorID { get; set; }
        public int SectionID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال رقم الشعبة")]
        public string SectionNum { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الشعبة")]
        public int SectionType { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار جنس الشعبة")]
        public int Gender { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال سعة الشعبة")]
        public int Capacity { get; set; }
        public bool IsActive { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> Instructors { get; set; }
        public List<SelectListItem> Sections { get; set; }
        public List<SelectListItem> SectionTypes { get; set; }
        public List<SelectListItem> Genders { get; set; }
    }
}

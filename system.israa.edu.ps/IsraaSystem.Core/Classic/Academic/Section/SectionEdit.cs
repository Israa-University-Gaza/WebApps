using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.Section
{
    public class SectionEdit
    {
        public int ID { get; set; }
        public int OfferdCourseID { get; set; }
        public string CourseName { get; set; }
        public string InstructorName { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال رقم الشعبة")]
        public int SectionNum { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الشعبة")]
        public int SectionType { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار جنس الشعبة")]
        public int Gender { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال سعة الشعبة")]
        public int Capacity { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> SectionTypes { get; set; }
        public List<SelectListItem> Genders { get; set; }
    }
}

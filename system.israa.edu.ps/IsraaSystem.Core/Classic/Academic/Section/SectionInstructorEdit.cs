using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.Section
{
    public class SectionInstructorEdit
    {

        public int ID { get; set; }
        public int OfferdCourseID { get; set; }
        public string CourseName { get; set; }
        public string SectionNum { get; set; }
        public string SectionTypeName { get; set; }
        public string GenderName { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار المحاضر")]
        public int InstructorID { get; set; }
        public int UserID { get; set; }
        public bool IsPined { get; set; }
        public int PinEmployeeID { get; set; }



        public List<SelectListItem> Instructors { get; set; }
    }
}

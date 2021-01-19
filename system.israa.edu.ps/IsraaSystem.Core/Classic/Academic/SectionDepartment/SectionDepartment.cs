using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.SectionDepartment
{
    public class SectionDepartment
    {
        public int SectionID { get; set; }
        public string CourseName { get; set; }
        public string SectionNum { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار القسم ")]
        public int DepartmentID { get; set; }

        [Required(ErrorMessage = "الرجاء تحديد المستوى الدراسي ")]
        public int StudyLevelID { get; set; }

        public int UserID { get; set; }

        public DataTable SectionDepartments { get; set; }

        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> StudyLevels { get; set; }
    }
}

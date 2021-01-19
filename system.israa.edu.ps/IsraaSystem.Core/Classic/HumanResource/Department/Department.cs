using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Department
{
    public class Department
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج إسم القسم بالعربية")]
        public string ArName { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار لمن يتبع القسم")]
        public int ParentID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار نوع القسم")]
        public int DepartmentTypeID { get; set; }

        public bool IsActive { get; set; }

        public int EmployeeID { get; set; }

        public List<SelectListItem> Departments { get; set; }

        public List<SelectListItem> DepartmentTypes { get; set; }


    }
}

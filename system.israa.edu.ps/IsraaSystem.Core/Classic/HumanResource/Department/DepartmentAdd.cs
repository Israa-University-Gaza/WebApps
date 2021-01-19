using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Department
{
    public class DepartmentAdd
    {
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار نوع القسم")]
        public int DepartmentTypeID { get; set; }

        public List<string> ArNames { get; set; }

        public List<SelectListItem> DepartmentTypes { get; set; }
    }
}

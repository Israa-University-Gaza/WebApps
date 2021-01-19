using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePlacement
{
    public class EmployeePlacement
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        
        [Required(ErrorMessage = "الرجاء اختيار الوظيفة")]
        public int DepartmentID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال المسؤول المباشر")]
        public int JobID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال المسؤول المباشر")]
        public int DManagerID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار صفة الموظف")]
        public int PlacementStatusID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الموظف")]
        public int PlacementTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار كادر الموظف")]
        public int CaderID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية الفترة")]
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public int UserID { get; set; }

        public string DepartmentName { get; set; }
        public string EmployeeName { get; set; }
        public string MangerName { get; set; }
        public string JobName { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Jobs { get; set; }
        public List<SelectListItem> PlacementStatuses { get; set; }
        public List<SelectListItem> PlacementTypes { get; set; }
        public List<SelectListItem> Caders { get; set; }
    }
}

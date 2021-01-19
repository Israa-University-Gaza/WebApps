using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Employee
{
    public class EmployeeAdd
    {
        public EmployeeAdd()
        {
        }

        public EmployeeAdd(string EmployeeNo)
        {
            this.EmployeeNo = EmployeeNo;
        }

        public int? EmployeeID { get; set; }

        public string EmployeeNo { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج الإسم الأول بالعربية")]
        public string ArFirstName { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج الإسم الثاني بالعربية")]
        public string ArSecoundName { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج الإسم الثالث بالعربية")]
        public string ArThirdName { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج اسم العائلة بالعربية")]
        public string ArFamilyName { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج رقم الهوية")]
        public string SSN { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج رقم الجوال")]
        public string Mobile { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار قسم الموظف")]
        public int DepartmentID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار وظيفة الموظف")]
        public int JobID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال مسؤول الموظف")]
        public int DManagerID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار صفة الموظف")]
        public int PlacementStatusID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الموظف")]
        public int PlacementTypeID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار كادر الموظف")]
        public int CaderID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية الفترة")]
        public string PlacementDateFrom { get; set; }
        public string PlacementDateTo { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع التوظيف التابع له الموظف")]
        public int EmploymentTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية الفترة")]
        public string EmploymentDateFrom { get; set; }
        public string EmploymentDateTo { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار حالة الموظف")]
        public int EmployeeStatusID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال بداية الفترة")]
        public string EmployeeStatusDateFrom { get; set; }
        public string EmployeeStatusDateTo { get; set; }
        public string Notes { get; set; }
        public int InsertEmployeeID { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Jobs { get; set; }
        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> PlacementStatuses { get; set; }
        public List<SelectListItem> PlacementTypes { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> EmployeeStatuses { get; set; }
        public List<SelectListItem> Caders { get; set; }
    }
}

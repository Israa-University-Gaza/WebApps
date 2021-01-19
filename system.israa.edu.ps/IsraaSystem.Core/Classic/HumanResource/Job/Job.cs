using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class Job
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج المسمى الوظيفي")]
        public string JobTitle { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج الهدف العام للوظيفة")]
        public string JobGoal { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار قسم الوظيفة")]
        public int DepartmentID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار كادر الوظيفة")]
        public int CaderID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار درجة الوظيفة")]
        public int CaderDegreeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار المسؤول المباشر عن الوظيفة")]
        public int ManagerJobID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج علاقة الوظيفة بالوظائف الأخرى")]
        public string OtherJobRelation { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار عدد الموظفين المطلوب")]
        public int EmployeeCount { get; set; }
        public bool IsActive { get; set; }
        public int UserID { get; set; }

        public string DepartmentName { get; set; }
        
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Caders { get; set; }
        public List<SelectListItem> CaderDegrees { get; set; }
        public List<SelectListItem> ManagerJobs { get; set; }
    }
}

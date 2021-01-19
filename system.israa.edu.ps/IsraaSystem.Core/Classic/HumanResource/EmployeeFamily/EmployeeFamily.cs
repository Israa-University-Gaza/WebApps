using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeFamily
{
    public class EmployeeFamily
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج صلة القرابة")]
        public int RelativeTypeID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم الاول")]
        public string ArFirstName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم الأب")]
        public string ArSecoundName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم الجد")]
        public string ArThirdName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم العائلة")]
        public string ArFamilyName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الجنس")]
        public int GenderID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج رقم الهوية")]
        public string SSN { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج مكان الميلاد")]
        public string PlaceOfBirth { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج تاريخ الميلاد")]
        public string DateOfBirth { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الحالة الإجتماعية")]
        public int MaritalStatusID { get; set; }

        public string MarriageDate { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج حالة صلة القرابة")]
        public int PersonStatusID { get; set; }
        public int InsertEmployeeID { get; set; }

        public string DeathDate { get; set; }

        public List<SelectListItem> RelativeTypes { get; set; }
        public List<SelectListItem> Genders { get; set; }
        public List<SelectListItem> MaritalStatuses { get; set; }
        public List<SelectListItem> PersonStatuses { get; set; }
    }
}

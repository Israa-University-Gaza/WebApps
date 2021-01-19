using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePersonal
{
    public class EmployeeMainData
    {
        public int EmployeeID { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string ArNameTitle { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string ArFirstName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string ArSecoundName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string ArThirdName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string ArFamilyName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string EnNameTitle { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string EnFirstName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string EnSecoundName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string EnThirdName { get; set; }

        [MaxLength(15, ErrorMessage = "الرجاء ادخال اقل من 15 حرف")]
        public string EnFamilyName { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string SSN { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الجنس")]
        public int GenderID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الحالة الإجتماعية")]
        public int MaritalStatusID { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string Passport { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج مكان الميلاد")]
        public string PlaceOfBirth { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج تاريخ الميلاد")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string DateOfBirth { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الديانة")]
        public int ReligionID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الجنسية")]
        public int NationalityID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج إسم الأم")]
        public string MotherName { get; set; }
        public int UserID { get; set; }
        public int HrDManagerID {get; set;}

        public List<SelectListItem> Genders { get; set; }
        public List<SelectListItem> MaritalStatuses { get; set; }
        public List<SelectListItem> Religions { get; set; }
        public List<SelectListItem> Nationalities { get; set; }
        public List<SelectListItem> HrDManagers { get; set; }
    }
}

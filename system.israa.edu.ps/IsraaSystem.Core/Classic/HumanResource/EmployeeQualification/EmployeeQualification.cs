using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeQualification
{
    public class EmployeeQualification
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع المؤهل")]
        public int QualificationTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الدولة")]
        public int CountryID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج اسم الجامعة")]
        public string UniversityName { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج معدل التخرج")]
        public string GPAGraduate { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج سنة التخرج")]
        public int GraduateYear { get; set; }
        public int GraduateMonthID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج الكلية")]
        public string College { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج القسم")]
        public string Department { get; set; }
        public string GraduateCertificateUrl { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج الإعتماد")]
        public bool IsAccredit { get; set; }
        public int UserID { get; set; }



        public bool IsEquation { get; set; }

        public DateTime EquationDate { get; set; }

        public List<SelectListItem> QualificationTypes { get; set; }
        public List<SelectListItem> Countries { get; set; }
        public List<SelectListItem> Months { get; set; }
    }
}

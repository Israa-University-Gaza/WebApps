using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.ManualFingerprint
{
    public class ManualFingerprint
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال نوع البصمة")]
        public int FingerprintTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال تاريخ البصمة")]
        public string FingerprintDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة البصمة")]
        public string FingerprintTime { get; set; }
        //[Required(ErrorMessage = "الرجاء ادخال الملاحظات")]
        public string Note { get; set; }
        public int UserID { get; set; }
        public int BranchID { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> FingerprintTypes { get; set; }
        public List<SelectListItem> Branch { get; set; }

        public ManualFingerprint()
        {
            FingerprintDate = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }


}

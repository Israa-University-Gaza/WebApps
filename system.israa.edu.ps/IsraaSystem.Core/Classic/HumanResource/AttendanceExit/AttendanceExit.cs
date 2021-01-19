using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.AttendanceExit
{
    public class AttendanceExit
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الإذن")]
        public int AttendanceExitTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال تاريخ الإذن")]
        public string ExitDate { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة الخروج المتوقعة")]
        public string ExpectedTimeFrom { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال ساعة العودة المتوقعة")]
        public string ExpectedTimeTo { get; set; }
        public string ActualTimeFrom { get; set; }
        public string ActualTimeTo { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال سبب الخروج")]
        public string ExitReason { get; set; }
        public string EditReason { get; set; }
        public string Mobile { get; set; }
        public string Notes { get; set; }
        public bool DMAccreditation { get; set; }
        public string DeleteReason { get; set; }

        public string EmployeeName { get; set; }
        public string AttendanceExitType { get; set; }

        public int UserID { get; set; }

        public List<SelectListItem> Employees { get; set; }

        public List<SelectListItem> AttendanceExitTypes { get; set; }

        public List<SelectListItem> DeductionStatuses { get; set; }
    }
}
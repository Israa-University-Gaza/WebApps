using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Vacation
{
    public class VacationBalanceEdit
    {
        public int ID { get; set; }
        public string EmployeeName { get; set; }
        public string VacationBalanceYear { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال تاريخ بدء الرصيد")]
        public string DateFrom { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال تاريخ نهاية الرصيد")]
        public string DateTo { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال  الرصيد المرحل")]
        [Range(0, int.MaxValue, ErrorMessage = "الرجاء ادخال  الرصيد المرحل بشكل صحيح")]
        public int PostponeDays { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال  الرصيد الافتراضي")]
        [Range(0, int.MaxValue, ErrorMessage = "الرجاء ادخال  الرصيد الافتراضي بشكل صحيح")]
        public int DefualtDays { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال ملاحظة التعديل على رصيد الإجازة")]
        public string Note { get; set; }
        public int UserID { get; set; }
    }
}

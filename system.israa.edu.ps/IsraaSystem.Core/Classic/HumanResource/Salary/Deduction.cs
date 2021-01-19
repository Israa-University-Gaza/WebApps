using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class Deduction
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الخصمية")]
        public int DeductionTypeID { set; get; }
        [Required(ErrorMessage = "الرجاء تحديد نوع القيمة")]
        public int RVTypeID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج اسم الخصمية")]
        public string Name { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج قيمة الخصمية")]
        public float Amount { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار العملة")]
        public int CurrencyID { set; get; }
        public int UserID { set; get; }

        public string DeductionTypeName { set; get; }
        public List<SelectListItem> DeductionTypes { get; set; }
        public List<SelectListItem> Currencies { get; set; }
    }
}

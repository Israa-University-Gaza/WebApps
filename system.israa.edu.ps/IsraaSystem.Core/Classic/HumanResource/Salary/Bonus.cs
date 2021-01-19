using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Salary
{
    public class Bonus
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار نوع العلاوة")]
        public int BonusTypeID { set; get; }
        [Required(ErrorMessage = "الرجاء تحديد نوع القيمة")]
        public int RVTypeID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج اسم العلاوة")]
        public string Name { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج قيمة العلاوة")]
        public float Amount { set; get; }
        [Required(ErrorMessage = "الرجاء اختيار العملة")]
        public int CurrencyID { set; get; }
        public int UserID { set; get; }

        public string BonusTypeName { set; get; }
        public List<SelectListItem> BonusTypes { get; set; }
        public List<SelectListItem> Currencies { get; set; }
    }
}

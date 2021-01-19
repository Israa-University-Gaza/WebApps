using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Holiday
{
    public class Holiday
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج عنوان العطلة")]
        public string Title { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار نوع العطلة")]
        public int HolidayTypeID { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج تاريخ بداية العطلة")]
        public string DateFrom { get; set; }

        [Required(ErrorMessage = "الرجاء ادراج تاريخ نهاية العطلة")]
        public string DateTo { get; set; }

        public string Notes { get; set; }

        public bool IsActive { get; set; }

        public int EmployeeID { get; set; }


        public List<SelectListItem> HolidayTypes { get; set; }
    }
}

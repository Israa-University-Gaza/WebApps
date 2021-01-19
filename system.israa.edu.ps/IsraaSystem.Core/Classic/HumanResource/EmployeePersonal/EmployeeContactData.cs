using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePersonal
{
    public class EmployeeContactData
    {
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الدولة")]

        public int CountryID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج المحافظة")]
        public int GovernorateID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج المدينة")]
        public int CityID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الحي")]
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string Neighborhood { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الشارع")]
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string Street { get; set; }

        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string HomeNo { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج تفاصيل العنوان")]
        [MaxLength(200, ErrorMessage = "الرجاء ادخال اقل من 200 حرف")]
        public string AddressDetails { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج رقم الهاتف")]
        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]

        public string Phone { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج رقم الجوال")]
        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string Mobile { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string Fax { get; set; }

        public string Email { get; set; }

        public string UniversityEmail { get; set; }

        public int UserID { get; set; }

        public List<SelectListItem> Countries { get; set; }
        public List<SelectListItem> Governorates { get; set; }
        public List<SelectListItem> Cities { get; set; }
    }
}

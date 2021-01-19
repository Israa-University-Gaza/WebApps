using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeEmergencyInfo
{
    public class EmployeeEmergencyInfo
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج الإسم الاول")]
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم العائلة")]
        public string ArFamilyName { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار صلة القرابة")]
        public int RelativeTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار المحافظة ")]
        public int GovernoratesID { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال رقم الهاتف")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "الرجاء ادخال رقم الجوال")]
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string AddressDetails { get; set; }

        public int UserID { get; set; }

        public List<SelectListItem> RelativeTypes { get; set; }
        public List<SelectListItem> Governorates { get; set; }
    }
}

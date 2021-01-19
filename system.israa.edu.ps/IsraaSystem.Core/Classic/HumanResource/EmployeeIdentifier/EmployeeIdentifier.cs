using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeIdentifier
{
    public class EmployeeIdentifier
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم الاول")]
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string ArFirstName { get; set; }
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string ArSecoundName { get; set; }
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string ArThirdName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج الإسم العائلة")]
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string ArFamilyName { get; set; }
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string IdentifierJob { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string Phone { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "الرجاء ادخال أرقام فقط")]
        public string Mobile { get; set; }
        [MaxLength(50, ErrorMessage = "الرجاء ادخال اقل من 50 حرف")]
        public string Email { get; set; }
        [MaxLength(150, ErrorMessage = "الرجاء ادخال اقل من 150 حرف")]
        public string AddressDetails { get; set; }
        public int UserID { get; set; }
    }
}

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeBank
{
    public class EmployeeBank
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار البنك")]
        public int BankID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج رقم البنك")]
        public string BankNo { get; set; }

        public string BankBranch { get; set; }
        public string Note { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> Banks { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeePracticalExperience
{
    public class EmployeePracticalExperience
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج عنوان العمل")]
        public string Job { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج مكان العمل")]
        public string WorkPlace { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج مجال العمل")]
        public string WorkField { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج تاريخ بداية العمل")]
        public string WorkFromDate { get; set; }
        public string WorkToDate { get; set; }
        public string WorkDetails { get; set; }
        public string WorkLeavingReason { get; set; }
        public string IdentifiersName { get; set; }
        public string IdentifiersMobile { get; set; }
        public string WorkCertificateUrl { get; set; }
        public bool IsAccredit { get; set; }
        public int UserID { get; set; }
    }
}

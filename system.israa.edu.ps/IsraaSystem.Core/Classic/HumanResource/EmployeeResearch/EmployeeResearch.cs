using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeResearch
{
    public class EmployeeResearch
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج عنوان البحث")]
        public string ResearchTitle { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج الجهة المقدمة لها")]
        public string ResearchOrganization { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج نبذة مختصرة عن البحث")]
        public string ResearchDetails { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج تاريخ البحث")]
        public string ResearchDate { get; set; }
        public int UserID { get; set; }
    }
}

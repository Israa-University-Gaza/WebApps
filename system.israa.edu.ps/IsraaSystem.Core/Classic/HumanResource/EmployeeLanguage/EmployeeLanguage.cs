using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeLanguage
{
    public class EmployeeLanguage
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار اللغة")]
        public int languageID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار مستوى القراءة")]
        public int ReadingKnowLevelID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار مستوى الكتابة")]
        public int WritingKnowLevelID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار مستوى التكلم باللغة")]
        public int SpeakingKnowLevelID { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> languages { get; set; }
        public List<SelectListItem> ReadingKnowLevels { get; set; }
        public List<SelectListItem> WritingKnowLevels { get; set; }
        public List<SelectListItem> SpeakingKnowLevels { get; set; }
    }
}

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeSkill
{
    public class EmployeeSkill
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع المهارة")]
        public int SkillTypeID { get; set; }
        [Required(ErrorMessage = "الرجاء ادراج اسم المهارة")]
        public string Name { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار مستوى المعرفة")]
        public int KnowLevelID { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> SkillTypes { get; set; }
        public List<SelectListItem> KnowLevels { get; set; }
    }
}

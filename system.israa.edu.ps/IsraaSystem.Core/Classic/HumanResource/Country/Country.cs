using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Country
{
    public class Country
    {
        public int? ID { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج الإسم بالعربية")]
        public string ArName { set; get; }
        [Required(ErrorMessage = "الرجاء ادراج الإسم بالإنجليزية")]
        public string EnName { set; get; }
        public int UserID { set; get; }
    }
}

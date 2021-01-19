using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Document
{
    public class DocumentType
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج  نوع المستند بالعربية")]
        public string ArName { get; set; }
        public int UserID { get; set; }
    }
}

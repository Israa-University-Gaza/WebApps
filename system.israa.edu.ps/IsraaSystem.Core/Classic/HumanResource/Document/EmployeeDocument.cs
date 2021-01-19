using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.Document
{
    public class EmployeeDocument
    {
        public int? ID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار الموظف")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "الرجاء اختيار نوع الملف")]
        public int DocumentTypeID { get; set; }
        public int DocumentPID { get; set; }
        public string DocumentURL { get; set; }
        public string Notes { get; set; }
        public int UserID { get; set; }

        public string EmployeeName { get; set; }
        public string DocumentTypeName { get; set; }

        public List<SelectListItem> DocumentTypes { get; set; }
        public List<SelectListItem> Employees { get; set; }
    }
}

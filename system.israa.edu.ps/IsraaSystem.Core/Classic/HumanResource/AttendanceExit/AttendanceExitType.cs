using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.AttendanceExit
{
    public class AttendanceExitType
    {
        public int? ID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج إسم نوع الإذن بالعربية")]
        public string ArName { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج إسم نوع الإذن بالإنجليزية")]
        public string EnName { get; set; }

        [Required(ErrorMessage = "الرجاء إختيار آلية الخصم")]
        public int DeductionStatusID { get; set; }

        public bool IsActive { get; set; }

        public int EmployeeID { get; set; }

        public List<SelectListItem> DeductionStatuses { get; set; }
    }
}

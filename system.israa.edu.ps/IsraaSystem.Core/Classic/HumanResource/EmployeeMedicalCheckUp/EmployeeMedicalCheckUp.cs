using System;
using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeMedicalCheckUp
{
    public class EmployeeMedicalCheckUp
    {

        public int? ID { get; set; }

        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "  الرجاء ادخال تاريخ الفحص")]

        public DateTime CheckUpDate { get; set; }

        public string MedicalCheckUpUrl { get; set; }


        public int UserID { get; set; }


        public bool IsAccredit { get; set; }

        public string Notes { get; set; }



    }
}

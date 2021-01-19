using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeTrainingCourse
{
    public class EmployeeTrainingCourse
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "الرجاء إدراج اسم المادة التدريبية")]
        public string CourseName { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج اسم المؤسسة")]
        public string CourseOrganisers { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج اختصاص المادة التدريبية")]
        public string CourseSpecialization { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج عدد الساعات")]
        public string CourseHours { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج بداية تاريخ التدريب")]
        public string CourseFromDate { get; set; }
        [Required(ErrorMessage = "الرجاء إدراج نهاية تاريخ التدريب")]
        public string CourseToDate { get; set; }
        public string CourseCertificateUrl { get; set; }
        public string Note { get; set; }
        public int UserID { get; set; }
    }
}

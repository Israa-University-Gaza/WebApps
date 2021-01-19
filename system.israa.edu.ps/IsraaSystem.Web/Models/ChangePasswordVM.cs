using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Web.Models
{
    public class ChangePasswordVM
    {

        [Required(ErrorMessage = "الرجاء إدخال كلمة المرور الحالية")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "الرجاء إدخال كلمة المرور الجديدة")]
        [StringLength(100, ErrorMessage = "يجب أن تحتوي كلمة المرور علي 6 أحرف علي الأقل", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Compare("NewPassword", ErrorMessage = "كلمة المرور الجديدة غير متطابقة")]
        public string ConfirmPassword { get; set; }
    }
}
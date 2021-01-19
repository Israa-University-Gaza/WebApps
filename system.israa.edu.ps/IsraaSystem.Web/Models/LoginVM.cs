using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IsraaSystem.Web.Models
{
    public class LoginVM
    {
        [Required(ErrorMessage = "الرجاء إدخال اسم المستخدم")]
        public string Username { get; set; }


        [Required(ErrorMessage = "الرجاء إدخال كلمة المرور")]
        public string Password { get; set; }
    }
}
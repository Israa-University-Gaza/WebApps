using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IsraaSystem.Web.Models.IdentityUser
{
    public class AppUser : Microsoft.AspNet.Identity.EntityFramework.IdentityUser
    {
        //add your custom properties which have not included in IdentityUser before
        public string MyExtraProperty { get; set; }
    }
}
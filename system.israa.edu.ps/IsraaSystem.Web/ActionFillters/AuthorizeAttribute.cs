using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Web.Security;

namespace IsraaSystem.Web.ActionFillters
{
    public class AuthorizeAttribute : System.Web.Mvc.AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (!HttpContext.Current.Request.IsAuthenticated)
            {
                filterContext.Result = new RedirectResult("/Home/Login");
            }
        }

    }
}
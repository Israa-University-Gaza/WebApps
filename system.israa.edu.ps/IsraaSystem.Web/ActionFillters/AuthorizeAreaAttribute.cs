using System;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Web.Security;

namespace IsraaSystem.Web.ActionFillters
{
    public class AuthorizeAreaAttribute : System.Web.Mvc.AuthorizeAttribute
    {



        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            string area = HttpContext.Current.Request.RequestContext.RouteData.DataTokens["area"].ToString();
            if (!HttpContext.Current.Request.IsAuthenticated)
            {
                filterContext.Result = new RedirectResult("/Home/Login");
            }
            else
            {

                IsraaUser user = new IsraaUser(Convert.ToInt32(HttpContext.Current.User.Identity.Name));
                if (user.IsSuperAdmin) return;
                if (!user.IsInArea(area))
                {

                    filterContext.Result = new RedirectResult("/Home/AccessDenid");
                }
            }
        }


    }
}



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using IsraaSystem.Web.Security;

namespace IsraaSystem.Web.ActionFillters
{
    public class AuthenticateAttribute : System.Web.Mvc.AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            string requiredPermission = String.Format("{0}.{1}.{2}",
                filterContext.ActionDescriptor.ControllerDescriptor.ControllerType.FullName.Split('.')[3],
                filterContext.ActionDescriptor.ControllerDescriptor.ControllerName,
                filterContext.ActionDescriptor.ActionName);
            int userId = Convert.ToInt32(filterContext.RequestContext.HttpContext.User.Identity.Name);
            IsraaUser requestingUser = new IsraaUser(userId);
            if (requestingUser.IsSuperAdmin) return;
            if (!requestingUser.HasAction(requiredPermission))
            {

                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                    {{"area", ""},{"action", "AccessDenid"}, {"controller", "Home"}});
            }
        }
    }
}

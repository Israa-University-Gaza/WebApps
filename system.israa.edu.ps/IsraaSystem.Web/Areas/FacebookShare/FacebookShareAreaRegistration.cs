using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.FacebookShare
{
    public class FacebookShareAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "FacebookShare";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "FacebookShare_default",
                "FacebookShare/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
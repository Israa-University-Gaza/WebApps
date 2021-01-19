using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.Affairs
{
    public class AffairsAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Affairs";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Affairs_default",
                "Affairs/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
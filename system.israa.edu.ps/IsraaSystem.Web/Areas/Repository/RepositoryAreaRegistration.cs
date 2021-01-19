using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.Repository
{
    public class RepositoryAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Repository";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Repository_default",
                "Repository/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
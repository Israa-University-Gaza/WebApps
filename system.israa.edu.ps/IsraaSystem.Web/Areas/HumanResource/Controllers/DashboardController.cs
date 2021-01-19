using System.Web.Mvc;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class DashboardController : BaseController
    {

        public ActionResult Index()
        {
            return View();
        }
    }
}
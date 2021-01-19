using IsraaSystem.Web.Controllers;
using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.Admission.Controllers
{
    public class DashboardController : BaseController
    {

        public ActionResult Index()
        {
            return View();
        }
    }
}
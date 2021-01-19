using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.Financial.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Financial/Dashboard
        public ActionResult Index()
        {
            return View();
        }
    }
}
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IsraaSystem.Web.Areas.Exam.Controllers
{
    public class ExamController : BaseController
    {
        // GET: Exam/Exam
        public ActionResult Index()
        {
            return View();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class AcademicWarningController : IsraaBaseController
    {
        private IAcademicWarningService AcademicWarningService;
        public AcademicWarningController(ILog looger, IUnitOfWork unitOfWork, IAcademicWarningService academicWarningService) : base(looger, unitOfWork)
        {
            AcademicWarningService = academicWarningService;
        }
        // GET: Academic/AcademicWarning
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions, int ? semesterId)
        {

            var data = AcademicWarningService.GetAllAcademicWarningStudents(queryOptions, semesterId);

            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");

        }



        public ActionResult GetStudentAcademicWarningsRowChild(int studentId)
        {

            var model = AcademicWarningService.GetStudentAcademicWarnings(studentId);
            return PartialView("_GetStudentAcademicWarningsRowChild", model);
        }



    }
}
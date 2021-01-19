using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Web.Controllers
{
    public class TestController : ApiController
    {
        private IInstallmentService _installmentService;

        public TestController(IInstallmentService installmentService)
        {
            _installmentService = installmentService;
        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetStudentInfo")]
        public JsonResult<StudentsView> GetStudentInfo(int studentId)
        {

            StudentsView model = new StudentsView();
            using (var db = new IsraaAcademicEntities())
            {
                model = db.StudentsView.FirstOrDefault(x => x.ID == studentId);
            }
            return Json(model);
        }






    }
}

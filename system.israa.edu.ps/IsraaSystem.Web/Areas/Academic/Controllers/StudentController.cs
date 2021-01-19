using System.Collections.Generic;
using System.Web.Mvc;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;
using log4net;
using StdSemesterDto = IsraaSystem.Application.Academic.MarkManager.Dtos.StdSemesterDto;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class StudentController : IsraaBaseController
    {
        private IStudentService StudentService;

        private ICalculationManager GpaService;


        public StudentController(ILog looger, IUnitOfWork unitOfWork, IStudentService studentService, ICalculationManager gpaService) : base(looger, unitOfWork)
        {
            StudentService = studentService;
            GpaService = gpaService;
        }



        public PartialViewResult _AllStudentsList()
        {
            return PartialView("_AllStudentsList");
        }

        //GET: Academic/Student
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions)
        {
            var data = StudentService.GetAll(queryOptions);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");
        }

        [Authenticate]
        // GET: Academic/Student
        public ActionResult Profile()
        {
            return View();
        }


        public PartialViewResult _StudentDetailsData()
        {
            var model = StudentService.GetStudentInfo(4, (int)SemestersEnum.CurentSemester);
            return PartialView(model);
        }




        public PartialViewResult _StudentGpaDetails()
        {
            StudentGpaDetailsVm model = new StudentGpaDetailsVm();
            decimal GpaGraduate;
            decimal GpaUniversity;
            model.Data = GpaService.GetStudentStdSemesterGpaDetails(4, out GpaGraduate, out GpaUniversity);
            model.GpaGraduate = GpaGraduate;
            model.GpaUniversity = GpaUniversity;
            return PartialView(model);
        }




        public class StudentGpaDetailsVm
        {
            public decimal GpaGraduate { get; set; }
            public decimal GpaUniversity { get; set; }
            public List<StdSemesterDto> Data { get; set; }
        }

    }
}
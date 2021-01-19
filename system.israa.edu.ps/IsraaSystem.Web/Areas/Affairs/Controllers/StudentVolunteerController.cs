using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Affairs;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;

namespace IsraaSystem.Web.Areas.Affairs.Controllers
{
    public class StudentVolunteerController : IsraaBaseController
    {
        private readonly IStudentVolunteerService StudentVolunteerService;
        private readonly IStudentService _studentService;

        public StudentVolunteerController(ILog looger, IUnitOfWork unitOfWork,
            IStudentVolunteerService studentVolunteerService, IStudentService studentService) : base(looger, unitOfWork)
        {
            StudentVolunteerService = studentVolunteerService;
            _studentService = studentService;
        }

        // GET: Affairs/StudentVolunteer
        public ActionResult Index()
        {
            return View();
        }

        [Authenticate]
        public ActionResult Add(int studentId)
        {
            var model = new StudentVolunteerDto();
            model.IsActive = true;
            model.StudentID = studentId;
            return PartialView("_Add", model);
        }

        [Authenticate]
        [HttpPost]
        public ActionResult Add(StudentVolunteerDto model)
        {
            model.InsertEmployeeID = Convert.ToInt32(User.Identity.Name);

            StudentVolunteerService.AddStudentVolunteer(model);
            UnitOfWork.Complete();
            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult LoadData(QueryOptions queryOptions)
        {
            var query = StudentVolunteerService.GetAllVolunteerStudents(queryOptions);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }


        public PartialViewResult StudentVolunteerRequests(int studentId)
        {
            var data = StudentVolunteerService.StudentVolunteerRequests(studentId);

            return PartialView("_StudentVolunteerRequests", data);
        }

        [Authenticate]
        public ActionResult AccreditRequest(int id)
        {
            StudentVolunteerService.AccreditRequest(id);
            UnitOfWork.Complete();
            return OkJsonResult();
        }

        [Authenticate]
        public ActionResult Print(int studentId)
        {
            var a1 = new ArrayList();
            a1.Add("dsModelReport");
            var data = _studentService.GetStudentInfo(studentId, (int)SemestersEnum.CurentSemester);
            var mydata = new List<StudentDto>();
            mydata.Add(data);
            var a2 = new ArrayList();
            a2.Add(mydata);
            CreatePdfFromList("StudentVolunteer", @"Areas\Affairs\Reports\StudentVolunteer.rdlc", a1, a2);
            return OkJsonResult();
        }
    }
}
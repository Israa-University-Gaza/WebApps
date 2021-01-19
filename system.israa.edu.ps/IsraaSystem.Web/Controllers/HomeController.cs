using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.Web.Models;
using IsraaSystem.Web.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Audit.Mvc;
using IsraaSystem.Application.Academic.StudentManager;
using Hangfire;
using IsraaSystem.Application.Test;
using IsraaSystem.Application.Academic.CourseManger;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Academic.LectureManger;
using IsraaSystem.Application.Academic.OfferdcourseManger;
using IsraaSystem.Application.Academic.StdSemesterManger;
using IsraaSystem.Application.Academic.StudentManager.Specifications;
using IsraaSystem.Application.Academic.TransformationManger;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.RepositoryPattern;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Application.HumanResource.Attendance;
using IsraaSystem.Application.HumanResource.JobManger;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermissions;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.DataAccess.Sql.Shared;
using IsraaSystem.Web.ActionFillters;
using Newtonsoft.Json;
using Controller = System.Web.Mvc.Controller;

namespace IsraaSystem.Web.Controllers
{
    public class ELearningStudentsExcelDto
    {
        public int Cource { get; set; }
        public string Section { get; set; }
        public int name { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
    }

    public class HomeController : Controller
    {
        private UnitOfWork unitOfWork;
        ICalculationManager gpaService;
        IStudentReportService _studentReportService;
        IStdSemesterService _stdSemesterService;
        ISectionService _sectionService;
        ILectureService _lectureService;
        IAcademicWarningService AcademicWarningService;
        private ITestService _testService;
        private IStudentService _studentService;
        private readonly IJobService _jobService;
        private readonly IFingerPrintService _fingerPrintService;
        private readonly IEmloyeeReportService _emloyeeReportService;
        private readonly IOfferdcourseService _offerdcourseService;
        private readonly IAcademicRepository<StudentAcademic> _studentAcademicRepository;

        private ITransformationService _transformationService;
        public HomeController(ITestService testService, UnitOfWork unitOfWork, ICalculationManager gpaService, IStudentReportService studentReportService, IStdSemesterService stdSemesterService, ISectionService sectionService, ILectureService lectureService, IAcademicWarningService academicWarningService, ITransformationService transformationService, IJobService jobService, IStudentService studentService, IFingerPrintService fingerPrintService, IEmloyeeReportService emloyeeReportService, OfferdcourseService offerdcourseService, IAcademicRepository<StudentAcademic> studentAcademicRepository)
        {
            _testService = testService;
            this.unitOfWork = unitOfWork;
            this.gpaService = gpaService;
            _studentReportService = studentReportService;
            _stdSemesterService = stdSemesterService;
            _lectureService = lectureService;
            //this.unitOfWork = unitOfWork;
            //this.gpaService = gpaService;
            _sectionService = sectionService;
            AcademicWarningService = academicWarningService;
            _transformationService = transformationService;
            _studentService = studentService;
            _fingerPrintService = fingerPrintService;
            _emloyeeReportService = emloyeeReportService;
            _jobService = jobService;
            _offerdcourseService = offerdcourseService;
            _studentAcademicRepository = studentAcademicRepository;


            //this._logger = logger;
        }


        [AutomaticRetry(Attempts = 0)]
        [Audit]
        public ActionResult Index()
        {



            return View();

        }

        private string ListToCSV<T>(IEnumerable<T> list)
        {
            StringBuilder sList = new StringBuilder();

            Type type = typeof(T);
            var props = type.GetProperties();
            sList.Append(string.Join(",", props.Select(p => p.Name)));
            sList.Append(Environment.NewLine);

            foreach (var element in list)
            {
                sList.Append(string.Join(",", props.Select(p => p.GetValue(element, null))));
                sList.Append(Environment.NewLine);
            }

            return sList.ToString();
        }

        [Authenticate]
        public FileContentResult ELearningStudentsExcel()
        {

            var HR = new IsraaHumanResourceEntities();
            var AC = new IsraaAcademicEntities();
            var per = new IsraPermissionEntities();

            var studentPer = new IsraPermissionsEntities();

            var studentsPer = studentPer.Student.ToList();

            var result = AC
                        .StdSection
                        .Clean()
                        .Where(x => x.StdSemester.SemesterID == 20)
                        .Where(x => x.CourseStatusID == 1)
                        .Select(x => new ELearningStudentsExcelDto
                        {
                            Cource = x.CourseID,
                            Section = "Section_" + x.Section.SectionNum.ToString(),
                            name = x.StudentAcademic.StudentNo,
                            Password = " ",
                            Firstname = x.StudentAcademic.StudentPersonal.ArFirstName,
                            Lastname = x.StudentAcademic.StudentPersonal.ArFamilyName
                        })
                        .ToList();


            foreach (var item in result)
            {
                item.Password = studentsPer.FirstOrDefault(x => x.StudentNo == item.name.ToString())?.Password;
            }

            var gresult = result.GroupBy(x => x.name);

            var r = gresult.Select(x => new
            {
                username = x.Key,
                Password = "\t" + x.FirstOrDefault()?.Password,
                Firstname = x.FirstOrDefault()?.Firstname,
                Lastname = x.FirstOrDefault()?.Lastname,
                Email = "Student@israa.edu.ps",



                Course1 = x.ElementAtOrDefault(0)?.Cource,
                role1 = "student",
                group1 = x.ElementAtOrDefault(0)?.Section,

                Course2 = x.ElementAtOrDefault(1)?.Cource,
                role2 = "student",
                group2 = x.ElementAtOrDefault(1)?.Section,

                Course3 = x.ElementAtOrDefault(2)?.Cource,
                role3 = "student",
                group3 = x.ElementAtOrDefault(2)?.Section,

                Course4 = x.ElementAtOrDefault(3)?.Cource,
                role4 = "student",
                group4 = x.ElementAtOrDefault(3)?.Section,

                Course5 = x.ElementAtOrDefault(4)?.Cource,
                role5 = "student",
                group5 = x.ElementAtOrDefault(4)?.Section,

                Course6 = x.ElementAtOrDefault(5)?.Cource,
                role6 = "student",
                group6 = x.ElementAtOrDefault(5)?.Section,

                Course7 = x.ElementAtOrDefault(6)?.Cource,
                role7 = "student",
                group7 = x.ElementAtOrDefault(6)?.Section,

                Course8 = x.ElementAtOrDefault(7)?.Cource,
                role8 = "student",
                group8 = x.ElementAtOrDefault(7)?.Section,

                Course9 = x.ElementAtOrDefault(8)?.Cource,
                role9 = "student",
                group9 = x.ElementAtOrDefault(8)?.Section,

                Course10 = x.ElementAtOrDefault(9)?.Cource,
                role10 = "student",
                group10 = x.ElementAtOrDefault(9)?.Section,

                Course11 = x.ElementAtOrDefault(10)?.Cource,
                role11 = "student",
                group11 = x.ElementAtOrDefault(10)?.Section,

                Course12 = x.ElementAtOrDefault(11)?.Cource,
                role12 = "student",
                group12 = x.ElementAtOrDefault(11)?.Section,

                Course13 = x.ElementAtOrDefault(12)?.Cource,
                role13 = "student",
                group13 = x.ElementAtOrDefault(12)?.Section,

                Course14 = x.ElementAtOrDefault(13)?.Cource,
                role14 = "student",
                group14 = x.ElementAtOrDefault(13)?.Section,

                Course15 = x.ElementAtOrDefault(14)?.Cource,
                role15 = "student",
                group15 = x.ElementAtOrDefault(14)?.Section,

            }).ToList();



            var sb = new StringBuilder();
            var list = r.ToList();
            var grid = new System.Web.UI.WebControls.GridView();
            grid.DataSource = list;
            grid.DataBind();



            string csv = ListToCSV(list);

            return File(new System.Text.UTF8Encoding().GetBytes(csv), "text/csv", "ELearningStudentsExcel.csv");








            //  Response.ClearContent();
            //  Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
            // // Response.AddHeader("content-disposition", "attachment; filename=students.xls");
            // // Response.ContentType = "application/vnd.ms-excel";

            //  Response.ContentType = "application/csv";
            //  Response.AddHeader("content-disposition", @"attachment;filename=""export.csv""");   //necessary to return a 'filename' to the user



            //  //Response.ContentEncoding = System.Text.Encoding.UTF8;


            //  StringWriter sw = new StringWriter();
            //  System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            //  grid.RenderControl(htw);
            //  Response.Write(sw.ToString());
            //  Response.End();


        }

        [Authenticate]
        public FileContentResult ELearningCoursesExcel()
        {

            var AC = new IsraaAcademicEntities();

            var r = AC
                        .OfferdCourse
                        .Clean()
                        .Where(x => x.SemesterID == 20)
                        .Select(x => new
                        {
                            category = 2,
                            shortname = x.CourseID,
                            fullname = x.Course.ArName
                        })
                        .ToList();


            var sb = new StringBuilder();
            var list = r.ToList();
            var grid = new System.Web.UI.WebControls.GridView();
            grid.DataSource = list;
            grid.DataBind();



            string csv = ListToCSV(list);

            return File(new System.Text.UTF8Encoding().GetBytes(csv), "text/csv", "ELearningCourses.csv");







        }

        [Authenticate]
        public FileContentResult ELearningEmployeesExcel()
        {
            var HR = new IsraaHumanResourceEntities();
            var AC = new IsraaAcademicEntities();
            var per = new IsraPermissionEntities();



            var sections = AC.OfferdCourse
                .Where(x => !x.IsDelete)
                .Where(x => x.SemesterID == 20)
                .SelectMany(x => x.Section)
                .Select(x => new
                {
                    x.OfferdCourse.Course.ID,
                    InstructorID = x.EmployeeID,
                    x.SectionNum
                })
                .ToList();


            var emps = HR.EmployeePersonal.ToList();

            var perEmps = per.Employee.ToList();

            var t = (from c in sections
                     join emp in emps on c.InstructorID equals emp.EmployeeID
                     select new
                     {
                         Cource = c.ID,
                         Section = "Section_" + c.SectionNum,
                         empID = emp.EmployeeID,
                         username = emp.EmployeeNo,
                         Password = "",
                         Firstname = emp.ArFirstName,
                         Lastname = emp.ArFamilyName,
                         emp.Email
                     }).ToList();

            var g = t.GroupBy(x => x.username);

            var r = g.Select(x => new
            {
                username = x.Key,
                perEmps.FirstOrDefault(c => c.ID == x.FirstOrDefault().empID)?.Password,
                x.FirstOrDefault()?.Firstname,
                x.FirstOrDefault()?.Lastname,
                x.FirstOrDefault()?.Email,


                Course1 = x.ElementAtOrDefault(0)?.Cource,
                role1 = "editingteacher",
                group1 = x.ElementAtOrDefault(0)?.Section,

                Course2 = x.ElementAtOrDefault(1)?.Cource,
                role2 = "editingteacher",
                group2 = x.ElementAtOrDefault(1)?.Section,

                Course3 = x.ElementAtOrDefault(2)?.Cource,
                role3 = "editingteacher",
                group3 = x.ElementAtOrDefault(2)?.Section,

                Course4 = x.ElementAtOrDefault(3)?.Cource,
                role4 = "editingteacher",
                group4 = x.ElementAtOrDefault(3)?.Section,

                Course5 = x.ElementAtOrDefault(4)?.Cource,
                role5 = "editingteacher",
                group5 = x.ElementAtOrDefault(4)?.Section,

                Course6 = x.ElementAtOrDefault(5)?.Cource,
                role6 = "editingteacher",
                group6 = x.ElementAtOrDefault(5)?.Section,

                Course7 = x.ElementAtOrDefault(6)?.Cource,
                role7 = "editingteacher",
                group7 = x.ElementAtOrDefault(6)?.Section,

                Course8 = x.ElementAtOrDefault(7)?.Cource,
                role8 = "editingteacher",
                group8 = x.ElementAtOrDefault(7)?.Section,

                Course9 = x.ElementAtOrDefault(8)?.Cource,
                role9 = "editingteacher",
                group9 = x.ElementAtOrDefault(8)?.Section,

                Course10 = x.ElementAtOrDefault(9)?.Cource,
                role10 = "editingteacher",
                group10 = x.ElementAtOrDefault(9)?.Section,

                Course11 = x.ElementAtOrDefault(10)?.Cource,
                role11 = "editingteacher",
                group11 = x.ElementAtOrDefault(10)?.Section,

                Course12 = x.ElementAtOrDefault(11)?.Cource,
                role12 = "editingteacher",
                group12 = x.ElementAtOrDefault(11)?.Section,

                Course13 = x.ElementAtOrDefault(12)?.Cource,
                role13 = "editingteacher",
                group13 = x.ElementAtOrDefault(12)?.Section,

                Course14 = x.ElementAtOrDefault(13)?.Cource,
                role14 = "editingteacher",
                group14 = x.ElementAtOrDefault(13)?.Section,

                Course15 = x.ElementAtOrDefault(14)?.Cource,
                role15 = "editingteacher",
                group15 = x.ElementAtOrDefault(14)?.Section
            }).ToList();




            var sb = new StringBuilder();
            var list = r.ToList();
            var grid = new System.Web.UI.WebControls.GridView();
            grid.DataSource = list;
            grid.DataBind();



            string csv = ListToCSV(list);

            return File(new System.Text.UTF8Encoding().GetBytes(csv), "text/csv", "ELearningEmps.csv");




        }

        public ActionResult Login()
        {
            if (User.Identity.IsAuthenticated)
            {
                var user = new IsraaUser(Convert.ToInt32(User.Identity.Name));


                if (user.Areas.Count != 0) return Redirect("/Dashboard");

                FormsAuthentication.SignOut();
            }

            return View(new LoginVM());
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginVM model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "الرجاء إدخال الحقول المطلوبة بشكل صحيح");
                return View(model);
            }
            //DataTable DT = AccountDA.IsValidEmployee(model.Username, model.Password);


            using (var _data = new IsraPermissionEntities())
            {
                var user = _data.Employee.First(x => x.EmployeeNo == model.Username);
                if (user != null)
                {
                    if (user.EmployeeNo == model.Username && user.Password == model.Password)
                    {
                        if (user.IsDelete)
                        {
                            ModelState.AddModelError("", "المستخدم محذوف");
                            return View(model);
                        }

                        if (!user.IsActive)
                        {
                            ModelState.AddModelError("", "المستخدم غير فعال");
                            return View(model);
                        }

                        var israaUser = new IsraaUser(user.ID);
                        FormsAuthentication.RedirectFromLoginPage(user.ID.ToString(), true);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "المستخدم غير موجود");
                    return View(model);
                }

                ModelState.AddModelError("", "خطأ في إسم المستخدم أو كلمة المرور");
                return View(model);
            }
        }


        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordVM model)
        {
            if (ModelState.IsValid)
            {
                var employeeID = User.Identity.Name.Split(';')[0];
                var DT = AccountDA.EmpChangePassword(employeeID, model.Password, model.NewPassword);
                TempData["change-msg"] = DT.Rows[0]["status"] + ";" + DT.Rows[0]["msg"];
            }

            return View(model);
        }


        public ActionResult LogOut()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }


        public ActionResult AccessDenid()
        {
            return View();
        }


        public static string HttpRequestPost(string id)
        {
            System.Net.ServicePointManager.Expect100Continue = false;
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://eservices.mtit.gov.ps/ws/gov-services/ws/getData");
            req.Method = "POST";
            req.ContentType = "application/json";
            string postData = "{\"WB_USER_NAME_IN\":\"ISRAA_UNIV4GOVDATA\",\"WB_USER_PASS_IN\":\"6CA03SS8GTULP36E82207C1D\",\"DATA_IN\":{\"package\":\"MOI_GENERAL_PKG\",\"procedure\":\"CITZN_INFO\",\"ID\":" + id + "},\"WB_AUDIT_IN\":{\"ip\":\"10.12.0.32\",\"pc\":\"hima-pc\"}}";
            req.ContentLength = postData.Length;

            StreamWriter stOut = new
            StreamWriter(req.GetRequestStream(),
            System.Text.Encoding.ASCII);
            stOut.Write(postData);
            stOut.Close();

            string strResponse;

            StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
            strResponse = stIn.ReadToEnd();
            stIn.Close();
            return strResponse;



        }
        public class Result
        {
            public List<AppController.Data> DATA { get; set; }
            public string MSG_TYPE_OUT { get; set; }
            public string MSG_OUT { get; set; }
        }
        public class Data
        {
            public string IDNO { get; set; }
            public string FNAME_ARB { get; set; }
            public string SNAME_ARB { get; set; }
            public string TNAME_ARB { get; set; }
            public string LNAME_ARB { get; set; }
            public string MOTHER_ARB { get; set; }
            public string PREV_LNAME_ARB { get; set; }
            public string DETH_DT { get; set; }
            public string ENG_NAME { get; set; }
            public string BIRTH_DT { get; set; }
            public string STREET_ARB { get; set; }
            public string SEX_CD { get; set; }
            public string SOCIAL_STATUS_CD { get; set; }
            public string REGION_CD { get; set; }
            public string CITY_CD { get; set; }
            public string RELIGION_CD { get; set; }
            public string BIRTH_MAIN_CD { get; set; }
            public string BIRTH_SUB_CD { get; set; }
            public string SEX { get; set; }
            public string SOCIAL_STATUS { get; set; }
            public string CI_REGION { get; set; }
            public string CI_CITY { get; set; }
            public string CI_RELIGION { get; set; }
            public string BIRTH_PMAIN { get; set; }
            public string BIRTH_PSUB { get; set; }
        }

    }


}
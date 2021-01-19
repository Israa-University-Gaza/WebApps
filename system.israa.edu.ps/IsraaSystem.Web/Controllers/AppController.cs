using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using Hangfire;
using IsraaSystem.Application.Academic.BackgroundJobManger;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.Registration;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Academic.StdSemesterManger;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Academic.TransformationManger;
using IsraaSystem.Application.Administration.Notification;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using IsraaSystem.DataAccess.Sql.Shared;
using Newtonsoft.Json;

namespace IsraaSystem.Web.Controllers
{
    [System.Web.Http.RoutePrefix("app")]
    public class AppController : ApiController
    {
        private IMarkService MarkService;
        private IAcademicWarningService AcademicWarningService;
        private IBackgroundJobService BackgroundJobService;
        private ITransactionService _transactionService;
        private IStudentService StudentService;
        private IStudentReportService _studentReportService;
        private IEmloyeeReportService EmloyeeReportService;
        private IUnitOfWork UnitOfWork;
        private readonly ICalculationManager _gpaService;
        private INotificationService NotificationService;
        private readonly IRegisterSectionService _registerSectionService;
        private readonly IRegisterSemesterService _registerSemesterService;
        private readonly IStudentFinancialService _studentFinancialService;
        private readonly ITransformationService _transformationService;


        public AppController(IMarkService markService, IStudentService studentService, IEmloyeeReportService emloyeeReportService, IAcademicWarningService academicWarningService, IUnitOfWork unitOfWork, INotificationService notificationService, IStudentReportService studentReportService, IRegisterSectionService registerSectionService, IRegisterSemesterService registerSemesterService, ITransactionService transactionService, IStudentFinancialService studentFinancialService, ITransformationService transformationService)
        {
            MarkService = markService;
            EmloyeeReportService = emloyeeReportService;
            AcademicWarningService = academicWarningService;
            UnitOfWork = unitOfWork;
            NotificationService = notificationService;
            _studentReportService = studentReportService;
            StudentService = studentService;
            _registerSectionService = registerSectionService;
            _registerSemesterService = registerSemesterService;
            _transactionService = transactionService;
            _studentFinancialService = studentFinancialService;
            _transformationService = transformationService;

        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("login")]
        public HttpResponseMessage Verify(string token, string username, string password)
        {
            if (token != "elib")
            {
                return Request.CreateResponse(HttpStatusCode.OK, new { status = "0", msg = "Unauthorized" });
            }
            DataTable DT = AccountDA.IsValidUser(username, password);
            return Request.CreateResponse(HttpStatusCode.OK, DT);
        }




        #region AcademicAPI
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetSectionStudentsMarks")]
        public async Task<JsonResult<List<MarkDto>>> GetSectionStudentsMarks(int sectionID)
        {
            var result = await MarkService.GetSectionStudentsMarks(null, sectionID);
            return Json(result);
        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateGpa")]
        public JsonResult<string> CalculateGpa(int studentId, int? stdSemesterId, AccreditationStatusEnum accreditationStatusEnum)
        {
            var result = BackgroundJob.Enqueue<CalculationManager>(f => f.CalculateGpa(studentId, stdSemesterId, accreditationStatusEnum));

            return Json(result);
        }




        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterGpa")]
        public JsonResult<string> CalculateSemesterGpa(int stdSemesterId, bool isForGraduate)
        {
            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterGpa(stdSemesterId, isForGraduate));

            return Json(result);
        }





        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterCumulativeGpa")]
        public JsonResult<string> CalculateSemesterCumulativeGpa(int stdSemesterId, bool isForGraduate)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterCumulativeGpa(stdSemesterId, isForGraduate));

            return Json(result);

        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterGpaChick")]
        public JsonResult<string> CalculateSemesterGpaChick(int studentid, bool isForGraduate)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterGpaChick(studentid, isForGraduate));

            return Json(result);
        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterCumulativeGpaChick")]
        public JsonResult<string> CalculateSemesterCumulativeGpaChick(int studentid, bool isForGraduate)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterCumulativeGpaChick(studentid, isForGraduate));

            return Json(result);

        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterCumulativeRegisteredHours")]
        public JsonResult<string> CalculateSemesterCumulativeRegisteredHours(int stdSemesterId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterCumulativeRegisteredHours(stdSemesterId));

            return Json(result);

        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterCumulativeRegisteredHoursChick")]
        public JsonResult<string> CalculateSemesterCumulativeRegisteredHoursChick(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterCumulativeRegisteredHoursChick(studentId));
            return Json(result);

        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateSemesterRegisteredHoursChick")]
        public JsonResult<string> CalculateSemesterRegisteredHoursChick(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterRegisteredHoursChick(studentId));

            return Json(result);

        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatSemesterFailedHour")]
        public JsonResult<string> CalculatSemesterFailedHour(int stdSemesterId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateSemesterFailedHour(stdSemesterId));

            return Json(result);

        }
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatSemesterFailedHourChick")]
        public JsonResult<string> CalculatSemesterFailedHourChick(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculatSemesterFailedHourChick(studentId));

            return Json(result);

        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatSemesterRichnessHour")]
        public JsonResult<string> CalculatSemesterRichnessHour(int stdSemesterId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculatSemesterRichnessHour(stdSemesterId));

            return Json(result);

        }
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatSemesterRichnessHourChick")]
        public JsonResult<string> CalculatSemesterRichnessHourChick(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculatSemesterRichnessHourChick(studentId));

            return Json(result);

        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatStudentRichnessHours")]
        public JsonResult<string> CalculatStudentRichnessHours(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculatStudentRichnessHours(studentId));

            return Json(result);

        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculatStudentStudiedHour")]
        public JsonResult<string> CalculatStudentStudiedHour(int studentId)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculatStudentStudiedHour(studentId));
            UnitOfWork.Complete();
            return Json(result);

        }








        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("AllCalculatOfStdSemester")]
        public JsonResult<string> AllCalculatOfStdSemester(int stdSemesterId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.AllCalculatOfStdSemester(stdSemesterId, IsReg, accreditationStatusEnum));
            return Json(result);

        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("AllCalculatOfStdSemesterChick")]
        public JsonResult<string> AllCalculatOfStdSemesterChick(int studentId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {

            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.AllCalculatOfStdSemesterChick(studentId, IsReg, accreditationStatusEnum));
            return Json(result);

        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("UpdateGraduationStatusID")]
        public JsonResult<string> UpdateGraduationStatusID(int studentId)
        {
            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.UpdateGraduationStatusID(studentId));

            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("DeleteAcademicWarning")]
        public JsonResult<string> DeleteAcademicWarning(int stdSemesterId)
        {
            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.DeleteAcademicWarning(stdSemesterId));

            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetStudentInternalTransformation")]
        public JsonResult<List<StudentInternalTransformationDto>> GetStudentInternalTransformation(int studentId, bool Istrans, int? stdSemesterId = null)
        {
            var result = _studentReportService.GetStudentInternalTransformation(studentId, Istrans, stdSemesterId);
            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetStudentAcademicWarningNumber")]
        public JsonResult<int> GetStudentAcademicWarningNumber(int studentId)
        {
            var result = AcademicWarningService.GetStudentAcademicWarningNumber(studentId);
            return Json(result);
        }



        public class GetStudentAcademicWarningOutPut
        {
            public int status { get; set; }
            public string title { get; set; }
            public string msg { get; set; }

            public string AcademicTitle { get; set; }
            public bool IsRegestedCurrentSemester { get; set; }
        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetStudentAcademicWarning")]
        public JsonResult<GetStudentAcademicWarningOutPut> GetStudentAcademicWarning(int studentId)
        {
            var IsRegested = StudentService.IsRegestedSemester(studentId);
            var result = AcademicWarningService.GetStudentAcademicWarningNumber(studentId);

            if (result == 1)
            {
                return Json(new GetStudentAcademicWarningOutPut
                {
                    status = 1,
                    IsRegestedCurrentSemester = IsRegested,
                    title = "الإنذار الأكاديمي الأول",
                    AcademicTitle = "محذر أكاديميا _ انذار أول",
                    msg =
                        "عزيزي الطالب تم ايقاف صفحتك الشخصية بسبب التحذير الأكاديمي الأول، يرجى مراجعة دائرة القبول والتسج"
                });
            }

            if (result == 2)
            {
                return Json(new GetStudentAcademicWarningOutPut
                {
                    status = 1,
                    IsRegestedCurrentSemester = IsRegested,
                    title = "الإنذار الأكاديمي الثاني",
                    AcademicTitle = "محذر أكاديميا _ انذار ثاني",
                    msg =
                        "عزيزي الطالب تم ايقاف صفحتك الشخصية بسبب التحذير الأكاديمي الثاني، يرجى مراجعة دائرة القبول والتسجيل"
                });
            }

            if (result >= 3)
            {
                return Json(new GetStudentAcademicWarningOutPut
                {
                    status = 1,
                    IsRegestedCurrentSemester = IsRegested,
                    title = "الإنذار الأكاديمي الثالث",
                    AcademicTitle = "محذر أكاديميا _ انذار ثالث",
                    msg =
                        "عزيزي الطالب لقد تم فصلك بناء على التحذيرات الأكاديمية ، يرجى مراجعة دائرة القبول والتسجيل"
                });
            }

            return Json(new GetStudentAcademicWarningOutPut
            {
                status = 0,
                IsRegestedCurrentSemester = IsRegested,
                title = "",
                AcademicTitle = "بلا تحذير",
                msg = ""
            });
        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("RegisterSection")]
        public JsonResult<List<CheckResult>> RegisterSection(int stdSemesterId, int sectionId, int? rEmployeeId = null, int? rStudentId = null)
        {
            var result = _registerSectionService.RegisterSection(stdSemesterId, sectionId, rEmployeeId, rStudentId);
            return Json(result);
        }

        //[System.Web.Http.HttpGet]
        //[System.Web.Http.Route("AddStdSemester")]
        //public JsonResult<List<CheckResult>> AddStdSemester(int studentId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? employeeId = null)
        //{

        //    int? id;

        //    var result = _registerSemesterService.RegisterSemester(out id, studentId, SemestersEnum.RegitrationSemester, employeeId);
        //    return Json(result);
        //}


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("RegisterCourse")]
        public JsonResult<string> RegisterCourse(int studentId, int sectionId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? rEmployeeId = null, int? rStudentId = null)
        {
            var result = BackgroundJob.Enqueue<RegisterSectionService>(f => f.RegisterCourse(studentId, sectionId, semestersEnum, rEmployeeId, rStudentId));

            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("RefreshPlanSumofHours")]
        public JsonResult<string> RefreshPlanSumofHours(int planId)
        {
            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.RefreshPlanSumofHours(planId));
            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("RefreshStudentAcademicTransformationHour")]
        public JsonResult<string> RefreshStudentAcademicTransformationHour(int studentId)
        {
            var result = BackgroundJob.Enqueue<TransformationService>(f => f.RefreshStudentAcademicTransformationHour(studentId));
            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("RefreshStudentAcademicOldUniversityTransformationHours")]
        public JsonResult<string> RefreshStudentAcademicOldUniversityTransformationHours(int studentId)
        {
            var result = BackgroundJob.Enqueue<TransformationService>(f => f.RefreshStudentAcademicOldUniversityTransformationHours(studentId));
            return Json(result);
        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetTransformations")]
        public JsonResult<List<GetTransformationsDto>> GetTransformations(QueryOptions queryOptions)
        {
            var result = _transformationService.GetTransformations(null);
            return Json(result);
        }


        #endregion

        #region Affairs

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetStudentInfo")]
        public JsonResult<StudentDto> GetStudentInfo(int studentId)
        {
            var result = StudentService.GetStudentInfo(studentId, (int)SemestersEnum.CurentSemester);
            return Json(result);
        }

        #endregion


        #region Financial
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("TransactionAdd")]
        public JsonResult<List<CheckResult>> TransactionAdd(int studentId, decimal amount, int actionId, SemestersEnum semestersEnum = SemestersEnum.CurentSemester, int? voucherId = null, int? accountId = null, float? quantity = null, int? insertStudentId = null, int? insertEmployeeId = null)
        {

            int? id;
            var result = _transactionService.TransactionAdd(out id, studentId, amount, actionId, semestersEnum, voucherId, accountId, quantity, insertStudentId, insertEmployeeId);
            return Json(result);
        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("CalculateBalance")]
        public JsonResult<string> CalculateBalance(int studentId)
        {
            var result = BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateBalance(studentId));

            return Json(result);
        }




        #endregion


        #region EmployeeAPI

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("EmployeeReportData")]
        public JsonResult<List<EmployeeDto>> EmployeeReportData()
        {
            var result = EmloyeeReportService.EmployeeReportData();

            return Json(result);
        }
        #endregion

        #region another

        public class testDto
        {
            public string name { get; set; }
            public int id { get; set; }
            public ICollection<MaterialType> children { get; set; }
        }
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("Test")]
        public JsonResult<List<testDto>> Test()

        {

            UnitOfWork.Repository.Configuration.ProxyCreationEnabled = false;




            var result = UnitOfWork.Repository.MaterialType.AsQueryable().Include(x => x.MaterialType1).Clean().Select(x =>


             new testDto { name = x.Name, id = x.ID, children = x.MaterialType1 }).ToList();




            return Json(result);










        }



        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("PublishNotification")]
        public void PublishNotification()
        {
            NotificationService.Send(5101, 1, "test test test test", "test test test test", "http://localhost:28406/Home/Index");

        }




        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("GetAllNotifications")]
        public JsonResult<List<Notifications>> GetAllNotifications(int recipientID)
        {
            var result = NotificationService.GetAll(recipientID);

            return Json(result);
        }
        #endregion

        public JsonResult<int[]> RefreshTotalMark(int stdSectionId)
        {
            int oldmark;
            int newmark;
            newmark = MarkService.RefreshTotalMark(stdSectionId, out oldmark);
            var result = new[]
            {
                oldmark,
                newmark

            };
            UnitOfWork.Complete();
            return Json(result);
        }


        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("govServices")]
        public JsonResult<Result> govServices(int studentId)
        {
            var student = UnitOfWork.Academic.StudentAcademic.FirstOrDefault(x => x.StudentID == studentId);

            string s = HttpRequestPost(student.StudentPersonal.SSN);

            Result res = JsonConvert.DeserializeObject<Result>(s);


            if (res.DATA.Count > 0)
            {
                var info = res.DATA.FirstOrDefault();
                student.StudentPersonal.ArFirstName = info.FNAME_ARB;
                student.StudentPersonal.ArSecoundName = info.SNAME_ARB;
                student.StudentPersonal.ArThirdName = info.TNAME_ARB;
                student.StudentPersonal.ArFamilyName = info.LNAME_ARB;
                student.StudentPersonal.MotherName = info.MOTHER_ARB;

                student.StudentPersonal.EnFirstName = info.ENG_NAME;
                student.StudentPersonal.DateOfBirth = DateTime.ParseExact(info.BIRTH_DT, "dd/MM/yyyy", null);

                student.StudentPersonal.Gender = Convert.ToInt32(info.SEX_CD);

            }

            UnitOfWork.Complete();

            return Json(res);
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
            public List<Data> DATA { get; set; }
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
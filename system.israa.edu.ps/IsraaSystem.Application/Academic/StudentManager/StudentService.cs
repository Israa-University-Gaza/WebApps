using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using AutoMapper;
using Hangfire;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.StudentManager.Specifications;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.RepositoryPattern;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.StudentManager
{
    public interface IStudentService : IIsraaService
    {

        StudentDto GetStudentInfo(int studentId, int? semesterId);
        int GetStudentStatus(int studentId);
        bool IsRegestedSemester(int studentId, int semesterId = (int)SemestersEnum.CurentSemester);
        int GetStudentAvalibleRegistedHour(int studentId);
        bool IsStudentAcademicallyWarning(int studentId);
        List<StudentDto> GetAll(QueryOptions queryOptions);
        List<StudentAcademic> GetRegularStudents();

    }

    public class StudentDto
    {


        public int studentNo { get; set; }
        public string studentName { get; set; }
        public string studentbalncename { get; set; }
        public string programName { get; set; }
        public string collegeName { get; set; }
        public string departmentName { get; set; }
        public string studentType { get; set; }
        public StdStatus studentstatus { get; set; }
        public string StudyLevel { get; set; }
        public decimal GPAGraduate { get; set; }
        public double? CumulativeGPA { get; set; }
        public int StdRegHour { get; set; }
        public int? StudiedHour { get; set; }
        public int? SucceedHour { get; set; }
        public int? PlanSucceedHour { get; set; }
        public int internaltransformaitionNumofHours { get; set; }
        public string GraduationStatus { get; set; }
        public int? CurrentWarningNo { get; set; }
        public string FileNumber { get; set; }
        public string SuspendedStatus { get; set; }
        public int StudentID { get; set; }
        public string studentAddress { get; set; }
        public string studentMobile { get; set; }
        public DateTime reportDate { get; set; }
        public string yearName { get; set; }
        public string semesterName { get; set; }
    }

    public class StudentService : IsraaService, IStudentService
    {

        private readonly ISettingService _settingService;
        private readonly IStudentFinancialService _financialDataService;
        private readonly ICalculationManager _gpaService;

        private readonly IAcademicWarningService _academicWarningService;
        private readonly IAcademicRepository<StudentAcademic> _studentAcademicRepository;

        public StudentService(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService, IStudentFinancialService financialDataService, ICalculationManager gpaService, IAcademicWarningService academicWarningService, IAcademicRepository<StudentAcademic> studentAcademicRepository) : base(unitOfWork, logger)
        {
            _settingService = settingService;
            _financialDataService = financialDataService;
            _gpaService = gpaService;
            _academicWarningService = academicWarningService;
            _studentAcademicRepository = studentAcademicRepository;
        }



        public StudentDto GetStudentInfo(int studentId, int? semesterId)
        {
            //var studentbalnce = _financialDataService.GetStudentBalance(studentId);
            //var studentstatus = unitOfWork.Academic.StdStatus.LastOrDefault(x => x.StudentID == studentId);



            var semester = unitOfWork.Academic.Semester.Find(semesterId.Value);
            var semesterName = semester.ArName.Between("الدراسي", "للعام");
            var reportDate = DateTime.Now.Date;
            var yearName = semester.ArName.After("الجامعي");
            var result = unitOfWork.Academic.StudentAcademic.Where(x => x.StudentID == studentId)
          .Select(b => new StudentDto
          {
              studentNo = b.StudentNo,
              studentName = b.StudentPersonal.ArFirstName + " " + b.StudentPersonal.ArSecoundName + " " + b.StudentPersonal.ArFamilyName,
              //studentbalncename = studentbalnce > 0 ? "عليك" + studentbalnce + "دينار" : "لك" + studentbalnce + "دينار",
              programName = b.Program.ArName,
              collegeName = b.Department.College.ArName,
              departmentName = b.Department.ArName,
              studentType = b.StudentTypes.ArName,
              //studentstatus = studentstatus,
              StudyLevel = b.StudyLevel1.ArName,
              GPAGraduate = b.GPAGraduate,
              //CumulativeGPA = b.StdSemester.OrderBy(x => x.SemesterID).LastOrDefault().SemesterCumulativeGPA,
              //StdRegHour = b.StdSemester.Clean().FirstOrDefault(x => x.SemesterID == semesterId && x.SemesterStatusID == (int)SemesterStatusEnum.Registration).StdSection.Clean().Where(g => g.CourseStatusID == (int)CourseStatusEnum.Register || g.CourseStatusID == (int)CourseStatusEnum.Successful || g.CourseStatusID == (int)CourseStatusEnum.Failure).Select(x => x.IsITransCourse ? x.Course1.NumOfHours : x.Course.NumOfHours).Sum(),
              StudiedHour = b.StudiedHour,
              SucceedHour = b.SucceedHour,
              PlanSucceedHour = b.PlanSucceedHour,
              //internaltransformaitionNumofHours = b.StdSection.Clean().Where(r => r.IsITransCourse).Select(x => x.Course1.NumOfHours).Sum(),
              GraduationStatus = b.GraduationStatus.Name,
              CurrentWarningNo = b.CurrentWarningNo,
              FileNumber = b.FileNumber,
              SuspendedStatus = b.StudentSuspended.Any(x => x.SuspendedStatus) ? " موقوفة " : "فعالة",
              yearName = yearName,
              semesterName = semesterName,
              studentMobile = b.StudentPersonal.Mobile,
              studentAddress = b.StudentPersonal.Governorates.ArName + "/" + b.StudentPersonal.City.ArName,
              reportDate = reportDate

          });

            return result.FirstOrDefault();

        }


        public bool IsRegestedSemester(int studentId, int semesterId = (int)SemestersEnum.CurentSemester)
        {

            var result = unitOfWork.Academic.StudentAcademic.Find(studentId).StdSemester.Clean().Any(X => X.SemesterID == semesterId && X.SemesterStatusID == (int)SemesterStatusEnum.Registration);

            return result;

        }
        public int GetStudentStatus(int studentId)
        {
            var studentstatus = unitOfWork.Academic.StudentAcademic.Find(studentId).CurrentStatusID;

            return studentstatus.Value;
        }

        public int GetStudentAvalibleRegistedHour(int studentId)
        {

            var student = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var maxhour = 20;
            if ((student.GraduationStatusID == (int)GraduationStatusEnum.GraduateStudent || student.GraduationStatusID == (int)GraduationStatusEnum.ExpectedGraduationStudent) && student.GPAUniversity >= 80)
            {
                maxhour = student.ProgramID == (int)ProgramEnum.Diploma ? maxhour + 1 : student.ProgramID == (int)ProgramEnum.Diploma ? maxhour + 3 : maxhour;
            }

            return maxhour;
        }

        public bool IsStudentAcademicallyWarning(int studentId)
        {
            var studentAcademicWarnings = _academicWarningService.GetStudentAcademicWarnings(studentId);
            var IsAcademicallyWarning = false;
            if (studentAcademicWarnings.Any())
            {
                var warningStatusID = studentAcademicWarnings.LastOrDefault().WarningStatusID;

                IsAcademicallyWarning = warningStatusID == (int)WarningStatusEnum.Active;
            }
            return IsAcademicallyWarning;

        }
        public List<StudentDto> GetAll(QueryOptions queryOptions)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            //Search
            string searchKey = queryOptions.search.value;
            var studentNo = 0;
            int.TryParse(searchKey, out studentNo);


            var query = unitOfWork.Academic.StudentAcademic.Clean()
                .WhereIf(studentNo > 0, x => x.StudentNo == studentNo)
                .WhereIf(studentNo == 0 && !string.IsNullOrEmpty(searchKey), x => x.StudentPersonal.ArFirstName.Contains(searchKey) || x.StudentPersonal.ArFamilyName.Contains(searchKey))
                .Select(b => new StudentDto
                {
                    StudentID = b.StudentID,
                    studentNo = b.StudentNo,
                    studentName = b.StudentPersonal.ArFirstName + " " + b.StudentPersonal.ArSecoundName + " " + b.StudentPersonal.ArFamilyName,
                    programName = b.Program.ArName,
                    collegeName = b.Department.College.ArName,
                    departmentName = b.Department.ArName,
                    studentType = b.StudentTypes.ArName,
                    StudyLevel = b.StudyLevel1.ArName,
                    GPAGraduate = b.GPAGraduate,
                    StudiedHour = b.StudiedHour,
                    SucceedHour = b.SucceedHour,
                    PlanSucceedHour = b.PlanSucceedHour,
                    GraduationStatus = b.GraduationStatus.Name,
                    CurrentWarningNo = b.CurrentWarningNo,
                    FileNumber = b.FileNumber,
                    SuspendedStatus = b.StudentSuspended.Any(x => x.SuspendedStatus) ? " موقوفة " : "فعالة"

                });

            query = query.AplayQueryOptions(queryOptions);

            return query.ToList();

        }

        public List<StudentAcademic> GetRegularStudents()
        {
            return _studentAcademicRepository.Get(new RegularStudentAcademicSpecification());
        }



    }

}

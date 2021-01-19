using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using Hangfire;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.StudentManager
{
    public interface IStudentReportService : IIsraaService
    {
        List<StudentInternalTransformationDto> GetStudentInternalTransformation(int studentId, bool Istrans,
            int? stdSemesterId = null);
    }


    public class StudentInternalTransformationDto
    {
        public int Id { get; set; }
        public int courseId { get; set; }
        public string courseName { get; set; }
        public int courseHour { get; set; }
        public string courseCode { get; set; }
        public int? transcourseId { get; set; }
        public string transcourseName { get; set; }
        public int? transCourseHour { get; set; }
        public string transcourseCode { get; set; }
        public int? studentId { get; set; }
        public int studentNo { get; set; }
        public string studentname { get; set; }
        public string studentProgram { get; set; }
        public string studentCollege { get; set; }
        public string studentDepartment { get; set; }
        public string studentLevel { get; set; }
    }

    public class StudentReportService : IsraaService, IStudentReportService
    {

        private readonly ISettingService _settingService;
        private readonly IStudentFinancialService _financialDataService;
        private readonly ICalculationManager _gpaService;
        public StudentReportService(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService, IStudentFinancialService financialDataService, ICalculationManager gpaService) : base(unitOfWork, logger)
        {
            _settingService = settingService;
            _financialDataService = financialDataService;
            _gpaService = gpaService;
        }


        public List<StudentInternalTransformationDto> GetStudentInternalTransformation(int studentId, bool Istrans, int? stdSemesterId = null)
        {
            var planCourses = _gpaService.GetStudentPlaneCourses(studentId);
            var result = unitOfWork.Academic.StudentAcademic.Find(studentId).StdSection.Clean()
                .WhereIf(stdSemesterId.HasValue, x => x.StdSemesterID == stdSemesterId)
                .Where(x => !planCourses.Any(c => c.ID == x.CourseID) &&((x.IsITransCourse && Istrans && x.CourseStatusID==(int)CourseStatusEnum.Successful) || (!x.IsITransCourse && !Istrans && (x.CourseStatusID == (int)CourseStatusEnum.Register || x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister || x.CourseStatusID == (int)CourseStatusEnum.Successful || x.CourseStatusID == (int)CourseStatusEnum.Failure))))
                .OrderBy(x => x.CourseID)
                .Select(x => new StudentInternalTransformationDto
                {
                    Id = x.ID,
                    courseId = x.CourseID,
                    courseName = x.Course.ArName,
                    courseHour = x.Course.NumOfHours,
                    courseCode = x.Course.CourseCode,
                    transcourseId = x.ITransWithCourseID,
                    transcourseName = x.Course1?.ArName,
                    transCourseHour = x.Course1?.NumOfHours,
                    transcourseCode = x.Course1?.CourseCode,
                    studentId = x.StudentID,
                    studentNo = x.StudentAcademic.StudentNo,
                    studentname = x.StudentAcademic.StudentPersonal.ArFirstName + " " + x.StudentAcademic.StudentPersonal.ArSecoundName + " " + x.StudentAcademic.StudentPersonal.ArFamilyName,
                    studentProgram = x.StudentAcademic.Program.ArName,
                    studentCollege = x.StudentAcademic.Department.College.ArName,
                    studentDepartment = x.StudentAcademic.Department.ArName,
                    studentLevel= x.StudentAcademic.StudyLevel1.ArName
                }).ToList();

            return result;
        }

    }

}

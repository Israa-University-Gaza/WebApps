using System.Collections.Generic;
using System.Linq;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.StdSemesterManger
{


    public interface IStdSemesterService : IIsraaService
    {
        int GetStdSemesterRegisteredHours(int stdsemesterId, bool isForReg);
        List<StdSection> GetstdSemesterStdSection(int stdSemesterId);

    }


    public class StdSemesterService : IsraaService, IStdSemesterService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly ICalculationManager _calculationManager;
        public StdSemesterService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService, ICalculationManager calculationManager) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;
            _calculationManager = calculationManager;

        }


        public int GetStdSemesterRegisteredHours(int stdsemesterId, bool isForReg)
        {

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdsemesterId);
            var studentId = stdSemester.StudentID;

            var gpaDtos = _calculationManager.GetGpaData(studentId);
            var planCourses = _calculationManager.GetStudentPlaneCourses(studentId);
            var sumOfHours = 0;
            var result = gpaDtos.Where(co => co.TransactionID != null &&
                    (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                    co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                    co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                    co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                    (((planCourses.Any(r => r.ID == co.CourseID)) || (co.IsITransCourse && planCourses.Any(r => r.ID == co.ITransWithCourseID)))
                    || (!planCourses.Any(r => r.ID == co.CourseID) && isForReg)) && (co.SemesterID == stdSemester.SemesterID)).ToList();


            if (result.Any())

            {
                sumOfHours = result.Sum(a => a.NumOfHours);

            }


            return sumOfHours;
        }

        public List<StdSection> GetstdSemesterStdSection(int stdSemesterId)
        {

            var stdSections = unitOfWork.Academic.StdSemester.Find(stdSemesterId).StdSection.Clean().ToList();
            return stdSections;
        }

    }

}






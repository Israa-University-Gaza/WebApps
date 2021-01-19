using System.Collections.Generic;
using System.Linq;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.CourseManger
{


    public interface ICourseService : IIsraaService
    {
        List<StdSection> GetStudentCourseStdsections(int courseId, int studentId);
        IEnumerable<PreRequest> GetCoursePreRequestCourses(int courseId);

        bool IsCoursepreRequestStudied(int courseId, int studentId);

    }


    public class CourseService : IsraaService, ICourseService
    {

        private readonly ICheckResultService _checkResultService;

        public CourseService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;

        }


        public List<StdSection> GetStudentCourseStdsections(int courseId, int studentId)
        {
            var Stdsection = unitOfWork.Academic.StudentAcademic.Find(studentId).StdSection.Clean().Where(x => x.CourseID == courseId || x.ITransWithCourseID == courseId).ToList();
            return Stdsection;
        }


        public IEnumerable<PreRequest> GetCoursePreRequestCourses(int courseId)

        {
            var prerequestCourse = unitOfWork.Academic.Course.Find(courseId).PreRequest.Clean().Where(t => t.CourseID == courseId);
            return prerequestCourse;
        }

        public bool IsCoursepreRequestStudied(int courseId, int studentId)

        {
            var IspreRequestStudied = false;
            //todo chick all not just last ..
            var preCourse = GetCoursePreRequestCourses(courseId).LastOrDefault();
            var stdsection = GetStudentCourseStdsections(preCourse.PreReqID, studentId).Where(x => x.CourseStatusID == (int)CourseStatusEnum.Successful || x.CourseStatusID == (int)CourseStatusEnum.Transformation);
            if (preCourse != null && stdsection != null)
            {
                IspreRequestStudied = (stdsection.Any(x => x.CourseID == preCourse.PreReqID || x.ITransWithCourseID == preCourse.PreReqID));
            }

            return IspreRequestStudied;
        }

    }

}






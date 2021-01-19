using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Dynamic;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Academic.CourseManger;
using IsraaSystem.Application.Academic.ExamManager.ObserverService;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Academic.StdSemesterManger;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.DtoBase;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;

namespace IsraaSystem.Application.Academic.LectureManger
{


    public interface ILectureService : IIsraaService
    {
        bool IsConflict(TimeSpan from1, TimeSpan from2, TimeSpan to1, TimeSpan to2);
        List<Lecture> GetStdSemesterSectionConflictLecture(int sectionId, int stdSemesterId);
    }


    public class LectureService : IsraaService, ILectureService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly ISectionService _sectionService;
        private readonly IStdSemesterService _stdSemesterService;

        public LectureService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService, ISectionService sectionService, IStdSemesterService stdSemesterService) : base(unitOfWork, logger)
        {
            _checkResultService = checkResultService;
            _sectionService = sectionService;
            _stdSemesterService = stdSemesterService;
        }


        public bool IsConflict(TimeSpan from1, TimeSpan from2, TimeSpan to1, TimeSpan to2)
        {
            if ((from1 >= from2 && from1 < to2) || (to1 > from2 && to1 <= to2) || (from2 > from1 && from2 < to1) || (to1 > from2 && to1 <= to2) || (to2 > from1 && to2 < to1))
                return true;
            else
                return false;
        }


        public List<Lecture> GetSectionLecture(int sectionId)
        {

            var sectionLectures = unitOfWork.Academic.Section.Find(sectionId).Lecture.Clean().ToList();
            return sectionLectures;
        }




        public List<Lecture> GetStdSemesterSectionConflictLecture(int sectionId, int stdSemesterId)
        {
            var courseId = unitOfWork.Academic.Section.Find(sectionId).OfferdCourse.CourseID;
            var stdSemesterLecture = _stdSemesterService.GetstdSemesterStdSection(stdSemesterId).Where(e => e.CourseID != courseId && e.CourseStatusID == (int)CourseStatusEnum.Register).SelectMany(r => r.Section.Lecture).ToList();
            var sectionlecture = GetSectionLecture(sectionId);
            var result = stdSemesterLecture.Where(x => sectionlecture.Any(a => a.CDayID == x.CDayID && IsConflict(x.FromHour, a.FromHour, x.ToHour, a.ToHour))).ToList();
            return result;

        }

    }
}







using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Academic.ExamManager.ObserverService;
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
using IsraaSystem.DataAccess.Sql.Academic;
using log4net;
using OfferdCourse = IsraaSystem.Core.Classic.Academic.OfferdCourse.OfferdCourse;

namespace IsraaSystem.Application.Academic.OfferdcourseManger
{


    public interface IOfferdcourseService : IIsraaService
    {
        int GetOfferdcourseType(int OfferdcourseId);
        void GetSummerCourses();

    }


    public class SummerCoursesInfo
    {
        public int courseId { get; set; }
        public int? instructorId { get; set; }
        public int capacity { get; set; }
        public int semesterId { get; set; }
        public int mSectionCount { get; set; }
        public int fSectionCount { get; set; }
        public int mFSectionCount { get; set; }
        public int employeeId { get; set; }
    }

    public class OfferdcourseService : IsraaService, IOfferdcourseService
    {

        private readonly ICheckResultService _checkResultService;

        public OfferdcourseService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;

        }


        public int GetOfferdcourseType(int OfferdcourseId)
        {
            var OfferdcourseTypeid = unitOfWork.Academic.OfferdCourse.Find(OfferdcourseId).OfferdCourseTypeID;
            return OfferdcourseTypeid;

        }


        public void GetSummerCourses()
        {
            var SummerOfferedCourse = unitOfWork.Academic.OfferdCourse.Clean()
                .Where(x => x.SemesterID == 13).Select(x => x.Course).Distinct();
            var result = unitOfWork.Academic.StdSection.Clean()
                .Where(x =>
                    (x.CourseStatusID == (int)CourseStatusEnum.Withdraw ||
                     x.CourseStatusID == (int)CourseStatusEnum.Failure)
                    && (x.StdSemester.SemesterID == 11 || x.StdSemester.SemesterID == 12)
                    && (!SummerOfferedCourse.Any(r => r.ID == x.CourseID)))

                .Select(x => x.Course)
                .Distinct()
                .Select(x => new
                {
                    courseId = x.ID,
                    instructorId = x.Department.College.CollegeEmployee.FirstOrDefault(r => r.EmployeeTypeID == 4) == null ? null : (int?)x.Department.College.CollegeEmployee.FirstOrDefault(r => r.EmployeeTypeID == 4).EmployeeID,
                    //.FirstOrDefault(r =>
                    //(r.EmployeeTypeID == 4
                    //&& r.CollegeID != 4 && r.CollegeID != 9) ||
                    //(r.CollegeID == 4 && r.EmployeeTypeID == 5) ||
                    //(r.CollegeID == 9 && r.EmployeeTypeID == 5)
                    //)
                    capacity = x.StdSection.Where(r => (r.CourseStatusID == (int)CourseStatusEnum.Withdraw || r.CourseStatusID == (int)CourseStatusEnum.Failure)).Count(),
                })
                .ToList();


            List<OfferdCourse> list = new List<OfferdCourse>();

            foreach (var x in result)
            {
                list.Add(new OfferdCourse()
                {
                    CourseID = x.courseId,
                    InstructorID = x.instructorId.ToString(),
                    Capacity = 15,
                    FSectionCount = 0,
                    MSectionCount = 0,
                    MFSectionCount = 1,
                    UserID = 1,
                    SemesterID = 13,
                    OfferdCourseTypeID = (int)OfferdCourseTypeEnum.Office
                });
            }
            OfferdCourseDA.OfferdCourseAdd(list);
        }


    }

}






using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Dynamic;
using System.Linq.Expressions;
using AutoMapper;
using Hangfire.Annotations;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Academic.ExamManager.ObserverService;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Academic.StudentManager.Specifications;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.DtoBase;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.RepositoryPattern;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.SpecificationPattern;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;
using static IsraaSystem.Application.Academic.SectionManger.SectionService;

namespace IsraaSystem.Application.Academic.SectionManger
{


    public interface ISectionService : IIsraaService
    {
        SearchSectionsOutput SearchSections(SearchSectionsOutput input);
        int GetSectionType(int sectionId);
        void UpdateStudentsCount(int sectionId);


        void UpdateAccerdiationsCount(int sectionId);

        IQueryable<StdSection> GetSectionRegularStdSection(int sectionId, int? departmentId = null,
            int? studyLevelId = null, int? genderId = null);
        List<SectionDepartment> GetSectionSectionDepartments(int sectionId, int? departmentId = null, int? studylevelId = null, int? genderId = null);
        MarkTitle SectionMarkTitleGet(int sectionId);

        SectionInfoDto SectionInfoGet(int sectionId);
    }


    public class SectionService : IsraaService, ISectionService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly IStudentService _studentService;
        private readonly IAcademicRepository<Section> _sectionRepository;

        public SectionService(
                            IUnitOfWork unitOfWork,
                            ILog logger,
                            ICheckResultService checkResultService,
                            IStudentService studentService,
                            IAcademicRepository<Section> sectionRepository
                            ) : base(unitOfWork, logger)
        {
            _checkResultService = checkResultService;
            _studentService = studentService;
            _sectionRepository = sectionRepository;
        }



        public SearchSectionsOutput SearchSections(SearchSectionsOutput input)
        {
            input.SemesterName = unitOfWork.Academic.Semester.Find(input.SemesterId).ArName;

            var searchKey = input.search.value;
            var emps = unitOfWork.Academic.EmplyeeView.ToList();

            var query = _sectionRepository.Query()
                .WhereIf(input.SemesterId.HasValue, a => a.OfferdCourse.SemesterID == input.SemesterId)
                .WhereIf(input.ProgramID.HasValue,
                    a => a.OfferdCourse.Course.Department.College.ProgramID == input.ProgramID)
                .WhereIf(input.CollegeID.HasValue, a => a.OfferdCourse.Course.Department.CollegeID == input.CollegeID)
                .WhereIf(input.DepartmentID.HasValue, a => a.OfferdCourse.Course.DepartmentID == input.DepartmentID)
                .WhereIf(input.OfferdCourseID.HasValue, a => a.OfferdCourseID == input.OfferdCourseID)
                .WhereIf(input.SectionID.HasValue, a => a.SectionID == input.SectionID)
                .WhereIf(!string.IsNullOrEmpty(searchKey), a =>
                    a.OfferdCourse.Course.Department.College.ArName.Contains(searchKey) ||
                    a.OfferdCourse.Course.ArName.Contains(searchKey))
                .Where(a => a.OfferdCourse.AcademicAccreditation)
                .Where(a => !a.OfferdCourse.IsDelete)
                .Where(a => a.StudentCount > 0);


            query = query.AplayQueryOptions(input);
            var dataList = query.ToList();

            foreach (var section in dataList)
            {
                var queryStdSections = GetSectionRegularStdSection(section.ID);
                var marks = queryStdSections.SelectMany(x => x.Mark).Clean().ToList();

                section.StudentCount = queryStdSections.Count();
                section.FinalAcademicAccreditationCount = marks.Count(x => x.AcademicAccreditation);
                section.FinalDeanAccreditationCount = marks.Count(x => x.DeanAccreditation);
                section.MidAcademicAccreditationCount = marks.Count(x => x.MidAcademicAccreditation);
                section.MidDeanAccreditationCount = marks.Count(x => x.MidDeanAccreditation);


                section.IsFinalAcademicAllAccreditation = (section.FinalAcademicAccreditationCount == section.StudentCount);
                section.IsFinalDeanAllAccreditation = (section.FinalDeanAccreditationCount == section.StudentCount);
                section.IsFinalTeacherAllAccreditation = (section.FinalTeacherAccreditationCount == section.StudentCount);

                section.IsMidAcademicAllAccreditation = (section.MidAcademicAccreditationCount == section.StudentCount);
                section.IsMidDeanAllAccreditation = (section.MidDeanAccreditationCount == section.StudentCount);
                section.IsMidTeacherAllAccreditation = (section.MidTeacherAccreditationCount == section.StudentCount);

            }

            var data = Mapper.Map<List<SectionDto>>(dataList);

            foreach (var x in data)
            {
                var emp = emps.FirstOrDefault(d => d.ID == x.EmployeeID);
                x.EmployeeName = emp.ArFirstName + " " + emp.ArSecoundName + " " + emp.ArFamilyName;
            }

            input.data = data;
            input.IsAllAccreditation = input.ExamType == ExamTypeEnum.Mid
                ? input.data.Count(x => x.IsMidAcademicAllAccreditation) == input.recordsFiltered
                : input.data.Count(x => x.IsFinalAcademicAllAccreditation) == input.recordsFiltered;


            return input;

        }

        public int GetSectionType(int sectionId)
        {
            var sectionTypeid = unitOfWork.Academic.Section.Find(sectionId).SectionType;
            return sectionTypeid;

        }

        public void UpdateStudentsCount(int sectionId)

        {
            var section = unitOfWork.Academic.Section.Find(sectionId);
            section.StudentCount = GetSectionRegularStdSection(sectionId).Count();
        }

        public void UpdateAccerdiationsCount(int sectionId)

        {
            var section = unitOfWork.Academic.Section.Find(sectionId);
            var query = GetSectionRegularStdSection(sectionId);
            var marks = query.SelectMany(x => x.Mark).Clean();

            section.FinalAcademicAccreditationCount = marks.Count(x => x.AcademicAccreditation);
            section.FinalDeanAccreditationCount = marks.Count(x => x.DeanAccreditation);
            section.MidAcademicAccreditationCount = marks.Count(x => x.MidAcademicAccreditation);
            section.MidDeanAccreditationCount = marks.Count(x => x.MidDeanAccreditation);

        }

        public IQueryable<StdSection> GetSectionRegularStdSection(int sectionId, int? departmentId = null, int? studyLevelId = null, int? genderId = null)
        {

            unitOfWork.Academic.Configuration.ProxyCreationEnabled = true;

            var query = unitOfWork.Academic.StdSection
                .Where(x => x.SectionID == sectionId)
                .Clean()
                .WhereIf(departmentId.HasValue, x => x.StudentAcademic.DepartmentID == departmentId)
                .WhereIf(studyLevelId.HasValue, x => x.StudentAcademic.StudyLevel == studyLevelId)
                .WhereIf(genderId.HasValue, x => x.StudentAcademic.StudentPersonal.Gender == genderId)
                .Where(x =>
                    (x.CourseStatusID == (int)CourseStatusEnum.Register ||
                     x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                     x.CourseStatusID == (int)CourseStatusEnum.Successful ||
                     x.CourseStatusID == (int)CourseStatusEnum.Failure)
                    && x.StdSemester.SemesterStatus.ID == (int)SemesterStatusEnum.Registration
                //&& x.StudentAcademic.CurrentStatusID == (int)StudentStatusEnum.Regular

                );

            return query;

        }






        public List<SectionDepartment> GetSectionSectionDepartments(int sectionId, int? departmentId = null, int? studylevelId = null, int? genderId = null)
        {
            var result = unitOfWork.Academic.Section.Find(sectionId).SectionDepartment.Clean()
                           .WhereIf(departmentId.HasValue, x => x.DepartmentID == departmentId)
                           .WhereIf(studylevelId.HasValue, x => x.StudyLevelID == studylevelId)
                           .WhereIf(genderId.HasValue, x => (x.Section.Gender == genderId || x.Section.Gender == 3) || (x.Section.Gender != genderId && x.IsSpecial.Value)).ToList();
            return result;
        }

        public void GetSectionLecture(int sectionId)
        {

            var sectionLectures = unitOfWork.Academic.Section.Find(sectionId).Lecture.ToList();

        }


        public SectionInfoDto SectionInfoGet(int sectionId)
        {
            var result = unitOfWork.Academic.Section.Clean().Where(x => x.ID == sectionId).Select(x => new SectionInfoDto
            {
                OfferdCourseTypeID = x.OfferdCourse.OfferdCourseTypeID,
                SemesterID = x.OfferdCourse.SemesterID,
                SemesterTypeID = x.OfferdCourse.Semester.SemesterTypeID,
                courseCatogery = x.OfferdCourse.Course.CourseCategory,
                CourseType = x.OfferdCourse.Course.CourseType1,
                courseId = x.OfferdCourse.Course.ID
            }).FirstOrDefault();
            return result;

        }
        public MarkTitle SectionMarkTitleGet(int sectionId)
        {
            var sectionInfo = SectionInfoGet(sectionId);
            /*
             *  Start Added by RSR
             */

             var marktTitls = unitOfWork.Academic.MarkTitle.Clean().Where(x =>
                                    (x.CourseCategoryID == sectionInfo.courseCatogery.ID ) &&
                                    (x.CourseTypeID == sectionInfo.CourseType.ID ) &&
                                    (x.OfferdCourseTypeID == sectionInfo.OfferdCourseTypeID ) &&
                                    (x.SemesterTypeID == sectionInfo.SemesterTypeID ) &&
                                    (x.SemesterID == sectionInfo.SemesterID));
            if(marktTitls.Count() > 0)
            {
                return marktTitls.ToList().FirstOrDefault();
            }
            else
            {
                marktTitls = unitOfWork.Academic.MarkTitle.Clean().Where(x =>
                                   (x.CourseTypeID == sectionInfo.CourseType.ID) &&
                                   (x.SemesterID == sectionInfo.SemesterID));

                if (marktTitls.Count() > 0)
                {
                    return marktTitls.ToList().FirstOrDefault();
                }
                else
                {
                    marktTitls = unitOfWork.Academic.MarkTitle.Clean().Where(x =>
                                   (x.SemesterID == sectionInfo.SemesterID));
                    return marktTitls.ToList().FirstOrDefault();

                }

            }

           

            /*
            *  End Added by RSR
            */
            /*var marktTitls = unitOfWork.Academic.MarkTitle.Clean().Where(x =>
                (x.CourseCategoryID == sectionInfo.courseCatogery.ID || x.CourseCategoryID == -1) &&
                (x.CourseTypeID == sectionInfo.CourseType.ID || x.CourseTypeID == -1) &&
                (x.OfferdCourseTypeID == sectionInfo.OfferdCourseTypeID || x.OfferdCourseTypeID == -1) &&
                (x.SemesterTypeID == sectionInfo.SemesterTypeID || x.SemesterTypeID == -1) &&
                (x.SemesterID == sectionInfo.SemesterID));
            */
            var y = marktTitls.ToList();
            return y.FirstOrDefault();
        }

        public class SectionInfoDto
        {
            public int OfferdCourseTypeID { get; set; }
            public int? SemesterID { get; set; }
            public int? SemesterTypeID { get; set; }
            public CourseCategory courseCatogery { get; set; }
            public CourseType CourseType { get; set; }
            public int courseId { get; set; }
        }


        public class SearchSectionsOutput : QueryOptions
        {
            [DisplayName("البرنامج")]
            public int? ProgramID { get; set; }

            [DisplayName("القسم")]
            public int? DepartmentID { get; set; }

            [Required]
            [DisplayName("الفصل")]
            public
                int? SemesterId
            { get; set; } = (int)SemestersEnum.CurentSemester;

            [DisplayName("الكلية")]
            public int? CollegeID { get; set; }

            [DisplayName("المساق")]
            public int? OfferdCourseID { get; set; }

            [DisplayName("الشعبة")]
            public int? SectionID { get; set; }

            [Required]
            public ExamTypeEnum ExamType { get; set; }

            public string SemesterName { get; set; }

            public List<SectionDto> data { get; set; }

            public bool IsAllAccreditation { get; set; }
        }

    }



}







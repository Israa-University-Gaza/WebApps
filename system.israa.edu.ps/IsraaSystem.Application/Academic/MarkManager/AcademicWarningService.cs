using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography.X509Certificates;
using Hangfire;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.MarkManager
{
    public interface IAcademicWarningService : IIsraaService
    {
        // void AddAcademicWarning(int stdSemesterId);
        void SetStudentAcademicWarning(int stdSemesterId);
        void SetStudentAcademicWarningChick(int studentId);
        void RemoveAcademicWarning(int stdSemesterId);
        void RemoveAcademicWarninChick(int studentId);

        void DeleteAcademicWarning(int stdSemesterId);

        int GetStudentAcademicWarningNumber(int studentId);

        List<AcademicWarningService.AcademicWarningDto> GetAllAcademicWarningStudents(QueryOptions queryOption, int? semesterId);

        List<AcademicWarningService.AcademicWarningDto> GetStudentAcademicWarnings(int studentId);

        void RefreshWarningNumbers(int studentId);
    }

    public class AcademicWarningService : IsraaService, IAcademicWarningService
    {
        private readonly ISettingService _settingService;

        public AcademicWarningService(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService) : base(
            unitOfWork, logger)
        {
            _settingService = settingService;
        }

        private void AddAcademicWarning(int stdSemesterId)
        {
            var stdSemester = unitOfWork.Academic.StdSemester.Clean().FirstOrDefault(x => x.ID == stdSemesterId);

            var stdAcademicWarning = unitOfWork.Academic.StdAcademicWarning.IsNotDelete()
                .FirstOrDefault(x => x.StdSemesterID == stdSemesterId);

            if (stdSemester == null) return;

            #region first semester Chick

            var studentFirstRegularSemester = unitOfWork.Academic.StdSemester.Clean()
                .OrderBy(x => x.SemesterID)
                .FirstOrDefault(x => x.SemesterID > 1 && x.SemesterStatusID == (int)SemesterStatusEnum.Registration &&
                            x.Semester.SemesterTypeID != (int)SemesterTypeEnum.Summer &&
                            x.StudentID == stdSemester.StudentID);
            if (studentFirstRegularSemester == null) return;
            if (stdSemester.ID == studentFirstRegularSemester.ID) return;

            #endregion

            #region is All marks Accerdiation Chick

            var i = unitOfWork.Academic.Mark.Where(t => !t.IsDelete && !t.HasEdit)
                .Where(m => m.StdSection.StdSemester.ID == stdSemesterId &&
                            (m.StdSection.CourseStatusID == (int)CourseStatusEnum.Register ||
                             m.StdSection.CourseStatusID == (int)CourseStatusEnum.Successful ||
                             m.StdSection.CourseStatusID == (int)CourseStatusEnum.Failure ||
                             m.StdSection.CourseStatusID == (int)CourseStatusEnum.OfficeRegister))
                .ToList();
            if (!i.Any()) return;
            var isallacc = i.All(m => m.AcademicAccreditation);
            if (!isallacc) return;

            #endregion

            var programId = unitOfWork.Academic.StudentsView.FirstOrDefault(e => e.ID == stdSemester.StudentID)
                .ProgramID.Value;
            var warningSetting = _settingService.GetWarningSettings(programId, (int)SemestersEnum.CurentSemester);

            if (warningSetting.DontTakeSummerSemester)
                if (stdSemester.Semester.SemesterTypeID == (int)SemesterTypeEnum.Summer)
                    return;

            if (stdSemester.SemesterStatusID != (int)SemesterStatusEnum.Registration) return;

            #region FatalWarningGPA

            if (stdSemester.SemesterCumulativeGPA <= warningSetting.FatalWarningGPA)
            {
                if (stdAcademicWarning == null)
                {
                    stdSemester.StdAcademicWarning.Add(new StdAcademicWarning()
                    {
                        StudentID = stdSemester.StudentID,
                        StdSemesterID = stdSemester.ID,
                        WarningStatusID = (int)WarningStatusEnum.Active,
                        WarningTypeID = (int)WarningTypeEnum.Fatal,
                        InsertDate = DateTime.Now,
                        InsertEmployeeID = 1,
                        IsActive = true
                    });
                }
                else
                {
                    stdAcademicWarning.WarningTypeID = (int)WarningTypeEnum.Fatal;
                    stdAcademicWarning.IsActive = true;
                    stdAcademicWarning.WarningStatusID = (int)WarningStatusEnum.Active;
                }
            }

            #endregion

            #region WarningGPA

            else if (stdSemester.SemesterCumulativeGPA <= warningSetting.WarningGPA)
            {
                if (stdAcademicWarning == null)
                {
                    stdSemester.StdAcademicWarning.Add(new StdAcademicWarning()
                    {
                        StudentID = stdSemester.StudentID,
                        StdSemesterID = stdSemester.ID,
                        WarningStatusID = (int)WarningStatusEnum.Active,
                        WarningTypeID = (int)WarningTypeEnum.Normal,
                        InsertDate = DateTime.Now,
                        InsertEmployeeID = 1,
                        IsActive = true
                    });
                }

                else
                {
                    stdAcademicWarning.WarningTypeID = (int)WarningTypeEnum.Normal;
                    stdAcademicWarning.IsActive = true;
                    stdAcademicWarning.WarningStatusID = (int)WarningStatusEnum.Active;
                }
            }

            #endregion

            #region Cancel warning if exist

            else
            {
                var warningsList = unitOfWork.Academic.StudentAcademic.Find(stdSemester.StudentID)
                    .StdAcademicWarning.IsNotDelete()
                    .OrderBy(x => x.StdSemester.SemesterID)
                    .ToList();

                var lastWarning = warningsList.LastOrDefault(x => x.StdSemester.SemesterID <= stdSemester.SemesterID);

                if (!warningsList.Any()) return;

                if (lastWarning != null && lastWarning.WarningStatusID != (int)WarningStatusEnum.Active) return;

                if (stdAcademicWarning == null)
                {
                    stdSemester.StdAcademicWarning.Add(new StdAcademicWarning()
                    {
                        StudentID = stdSemester.StudentID,
                        StdSemesterID = stdSemester.ID,
                        WarningStatusID = (int)WarningStatusEnum.Cancel,
                        WarningTypeID = (int)WarningTypeEnum.NoType,
                        InsertDate = DateTime.Now,
                        InsertEmployeeID = 1,
                        IsActive = true
                    });
                }
                else
                {
                    stdAcademicWarning.IsActive = true;
                    stdAcademicWarning.WarningStatusID = (int)WarningStatusEnum.Cancel;
                    stdAcademicWarning.WarningTypeID = (int)WarningTypeEnum.NoType;
                }
            }

            #endregion

            RefreshWarningNumbers(stdSemester.StudentID);

        }

        public void RefreshWarningNumbers(int studentId)
        {
            var warningList = unitOfWork.Academic.StudentAcademic.Find(studentId)
                .StdAcademicWarning.Clean()
                .OrderBy(x => x.StdSemester.SemesterID)
                .ToList();

            var number = 1;

            foreach (var item in warningList)
                if (item.WarningStatusID == (int)WarningStatusEnum.Cancel)
                {
                    item.WarningNo = 0;

                    number = 1;
                }
                else if (item.WarningStatusID == (int)WarningStatusEnum.Active)
                {
                    item.WarningNo = number;

                    number++;
                }

        }

        [AutomaticRetry(Attempts = 0)]
        public void SetStudentAcademicWarning(int stdSemesterId)
        {
            //var stdacademicwarningid = unitOfWork.Academic.StdAcademicWarning.FirstOrDefault(r => r.StdSemesterID == stdSemesterId).ID;

            AddAcademicWarning(stdSemesterId);

            unitOfWork.Complete();


        }


        [AutomaticRetry(Attempts = 0)]
        public void StudentAcademicWarningRefreshAll(int studentId)
        {

            var studentcademic = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var stdSemesterIds = studentcademic.StdSemester.Clean().OrderBy(x => x.SemesterID).Select(x => x.ID).ToList();


            if (!stdSemesterIds.Any()) return;

            stdSemesterIds.ForEach(stdSemesterId =>
            {
                AddAcademicWarning(stdSemesterId);

            });

            RefreshWarningNumbers(studentId);
            studentcademic.CurrentWarningNo = GetStudentAcademicWarningNumberFromStudentAcademic(studentcademic);
            unitOfWork.Complete();

        }

        [AutomaticRetry(Attempts = 0)]
        public void SetStudentAcademicWarningChick(int studentId)
        {
            var stdSemesters = unitOfWork.Academic.StdSemester.Where(x => x.StudentID == studentId)
                .Clean()
                .OrderBy(x => x.SemesterID)
                .Select(x => x.ID)
                .ToList();
            foreach (var stdSemester in stdSemesters) AddAcademicWarning(stdSemester);
        }

        public void RemoveAcademicWarning(int stdSemesterId)
        {
            // var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            var stdAcademicWarning =
                unitOfWork.Academic.StdAcademicWarning.FirstOrDefault(x =>
                    x.StdSemesterID == stdSemesterId && !x.IsDelete);
            if (stdAcademicWarning == null) return;
            stdAcademicWarning.IsActive = false;
            stdAcademicWarning.ActiveDate = DateTime.Now;
            stdAcademicWarning.ActiveEmployeeID = 1;
        }

        [AutomaticRetry(Attempts = 0)]
        public void RemoveAcademicWarninChick(int studentId)
        {
            var stdSemesters = unitOfWork.Academic.StdSemester.Where(x => x.StudentID == studentId)
                .Clean()
                .OrderBy(x => x.SemesterID)
                .Select(x => x.ID)
                .ToList();
            stdSemesters.ForEach(RemoveAcademicWarning);
        }



        public void DeleteAcademicWarning(int stdSemesterId)
        {
            // var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            var stdAcademicWarning =
                unitOfWork.Academic.StdAcademicWarning.FirstOrDefault(x =>
                    x.StdSemesterID == stdSemesterId && !x.IsDelete);
            if (stdAcademicWarning == null) return;
            stdAcademicWarning.IsDelete = true;
            stdAcademicWarning.DeleteDate = DateTime.Now;
            stdAcademicWarning.DeleteEmployeeID = 1;

        }

        [AutomaticRetry(Attempts = 0)]

        public int GetStudentAcademicWarningNumber(int studentId)
        {
            StudentAcademic studentcademic = unitOfWork.Academic.StudentAcademic.Find(studentId);
            return GetStudentAcademicWarningNumberFromStudentAcademic(studentcademic);
        }


        private int GetStudentAcademicWarningNumberFromStudentAcademic(StudentAcademic studentcademic)
        {

            var warnings = studentcademic.StdAcademicWarning.Clean()
                .OrderBy(x => x.StdSemester.SemesterID)
                .ToList();

            if (!warnings.Any()) return 0;

            if (warnings.LastOrDefault().WarningStatusID == (int)WarningStatusEnum.Cancel) return 0;

            var indexCancel = warnings.FindLastIndex(x => x.WarningStatusID == (int)WarningStatusEnum.Cancel);

            var cleanWarning = warnings.Skip(indexCancel);

            if (cleanWarning.Any(x => x.WarningTypeID == (int)WarningTypeEnum.Fatal))
                return 3;
            else
                return cleanWarning.Count(x => x.WarningStatusID != (int)WarningStatusEnum.Cancel);

        }

        public List<AcademicWarningService.AcademicWarningDto> GetAllAcademicWarningStudents(QueryOptions queryOptions, int? semesterId)
        {
            unitOfWork.Academic.Configuration.ProxyCreationEnabled = false;

            //Search'
            string searchKey = null;
            int numValue;
            if (!Int32.TryParse(queryOptions.search.value, out numValue))
            {
                searchKey = queryOptions.search.value;
            }


            var query = unitOfWork.Academic.StudentAcademic
                .Where(x => x.StdAcademicWarning.Any())
                .WhereIf(numValue > 0, x => x.StudentNo == numValue)
                .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.StudentPersonal.ArFirstName.Contains(searchKey)
                                                                     || x.StudentPersonal.ArSecoundName.Contains(searchKey)
                                                                     || x.StudentPersonal.ArThirdName.Contains(searchKey)
                                                                     || x.StudentPersonal.ArFamilyName.Contains(searchKey)
                                                                     || x.Department.ArName.Contains(searchKey))
                .WhereIf(semesterId.HasValue, x => x.StdAcademicWarning.Any(c => c.StdSemester.SemesterID == semesterId))
                .Select(x => new AcademicWarningDto
                {
                    StudentID = x.StudentID,
                    StudentNo = x.StudentNo,
                    StudentFullName = x.StudentPersonal.ArFirstName + " " + x.StudentPersonal.ArSecoundName + " " + x.StudentPersonal.ArFamilyName,
                    DepartmentArName = x.Department.ArName,
                    WarningsCount = x.StdAcademicWarning.Count(),
                    StudentCurrentWarningNo = x.CurrentWarningNo
                });


            query = query.AplayQueryOptions(queryOptions);

            return query.ToList();
        }

        public List<AcademicWarningDto> GetStudentAcademicWarnings(int studentId)
        {
            var result = unitOfWork.Academic.StudentAcademic.Find(studentId)
                .StdAcademicWarning.IsNotDelete()
                .OrderBy(x => x.StdSemester.SemesterID)
                .Select(x => new AcademicWarningDto
                {
                    SemesterID = x.StdSemester.SemesterID,
                    StudentID = x.StudentID,
                    StudentNo = x.StudentAcademic.StudentNo,
                    StudentFullName = x.StudentAcademic.StudentPersonal.ArFirstName + " " + x.StudentAcademic.StudentPersonal.ArSecoundName + " " + x.StudentAcademic.StudentPersonal.ArFamilyName,
                    DepartmentArName = x.StudentAcademic.Department.ArName,
                    SemesterArName = x.StdSemester.Semester.ArName,
                    StatusArName = x.WarningStatus.ArName,
                    WarningNo = x.WarningNo,
                    SemesterGPA = x.StdSemester.SemesterGPA,
                    WarningStatusID = x.WarningStatusID
                });


            return result.ToList();
        }

        public class AcademicWarningDto
        {
            public int SemesterID { get; set; }
            public int StudentID { get; set; }
            public int StudentNo { get; set; }
            public string StudentFullName { get; set; }
            public string DepartmentArName { get; set; }
            public string SemesterArName { get; set; }
            public string StatusArName { get; set; }
            public int? WarningNo { get; set; }

            public int WarningsCount { get; set; }
            public double? SemesterGPA { get; set; }

            public int? StudentCurrentWarningNo { get; set; }
            public int WarningStatusID { get; internal set; }
        }
    }
}
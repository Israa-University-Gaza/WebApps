using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Helpers;
using AutoMapper;
using Hangfire;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaLog;
using log4net;
using static IsraaSystem.Application.Academic.MarkManager.MarkService;

namespace IsraaSystem.Application.Academic.MarkManager
{
    public interface IMarkService : IIsraaService
    {

        SectionDto SectionMarkDetails(int sectionId);

        bool MarKAccrediation(MarKAccrediationPorter marKAccrediationPorter);

        void MarKReturnAccrediation(int stdSectionId, AccreditationTypeEnum accreditationType, int employeeId, ExamTypeEnum examTypeEnum);

        void SectionMarKAccrediation(SectionMarKAccrediationInput input);
        void SectionMarKReturnAccrediation(SectionMarKAccrediationInput input);

        void MultiSectionMarKAccrediation(IList<int> sectionsIds, AccreditationTypeEnum accreditationType, ExamTypeEnum examTypeEnum, int employeeId);

        void MultiSectionMarKReturnAccrediation(IList<int> sectionsIds, AccreditationTypeEnum accreditationType, ExamTypeEnum examTypeEnum, int employeeId);


        Task<List<MarkDto>> GetSectionStudentsMarks(QueryOptions queryOptions, int sectionID);


        int RefreshTotalMark(int stdSectionId, out int oldTotalMark);
        void MarkUpdate(MarkDto input, int employeeId);

        MarkDto MarkGet(int markId);

        List<StudentsSpecialMarksDto> GetStudentsSpecialMarks(QueryOptions queryOptions, GetStudentsSpecialMarksInput input);

        void SetStdSectionTotalMark(SetStdSectionTotalMarkInput input);
    }

    public class MarkService : IsraaService, IMarkService
    {
        private readonly ISectionService _sectionService;
        private readonly ICheckResultService _checkResultService;

        public MarkService(IUnitOfWork unitOfWork, ILog logger, ISectionService sectionService,
            ICheckResultService checkResultService) : base(unitOfWork,
            logger)
        {
            _sectionService = sectionService;
            _checkResultService = checkResultService;
        }



        public async Task<List<MarkDto>> GetSectionStudentsMarks(QueryOptions queryOptions, int sectionID)
        {
            var query = _sectionService.GetSectionRegularStdSection(sectionID);
            var offerCourseID = unitOfWork.Academic.Section.Where(x => x.ID == sectionID).FirstOrDefault().OfferdCourseID;
            var courseID = unitOfWork.Academic.OfferdCourse.Where(x => x.ID == offerCourseID).FirstOrDefault().CourseID;
            var deparmetID = unitOfWork.Academic.Course.Where(x => x.ID == courseID).FirstOrDefault().DepartmentID;
            var collegeID = unitOfWork.Academic.Department.Where(x => x.ID == deparmetID).FirstOrDefault().CollegeID;
            var programID = unitOfWork.Academic.College.Where(x => x.ID == collegeID).FirstOrDefault().ProgramID;

            var passMark = unitOfWork.Academic.Program.Where(x => x.ID == programID).FirstOrDefault().PassMark;

            var result = query
                .Select(item =>
                    new MarkDto
                    {
                        StdSectionId = item.ID,
                        OfferdCourseTypeID = item.Section.OfferdCourse.OfferdCourseTypeID,
                        CourseID = item.Course.ID,
                        CourseTypeID = item.Course.CourseType,
                        IsRemedialCourse = item.IsRemedialCourse.Value ? true : false,
                        MarkId = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).ID,
                        IsInsertMidtermMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidtermMarkEmployeeID != 0,
                        WorkMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).WorkMark,
                        MidtermMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidtermMark,
                        FinalMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).FinalMark,
                        TotalMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).TotalMark,
                        IsSuccess =
                            item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).TotalMark >= passMark,
                        IsMidtermIncomplete = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsMidtermIncomplete,
                        IsMidtermNoMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsMidtermNoMark,
                        IsMidtermNoMarkAccept = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsMidtermNoMarkAccept,
                        IsMidtermZero = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsMidtermZero,
                        IsFinalNoMark = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsFinalNoMark,
                        IsFinalNoMarkAccept = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsFinalNoMarkAccept,
                        IsFinalZero = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsFinalZero,
                        IsFinalIncomplete = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).IsFinalIncomplete,
                        finalTeacherAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).TeacherAccreditation,
                        midTeacherAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidTeacherAccreditation,
                        finalHeadAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).HeadAccreditation,
                        midHeadAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidHeadAccreditation,
                        finalDeanAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).DeanAccreditation,
                        midDeanAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidDeanAccreditation,
                        finalAcademicAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).AcademicAccreditation,
                        midAcademicAccreditation = item.Mark.FirstOrDefault(m => !m.IsDelete & !m.HasEdit).MidAcademicAccreditation,
                        StudentID = item.StudentAcademic.StudentID,
                        StudentName = item.StudentAcademic.StudentPersonal.ArFirstName + " " +
                                      item.StudentAcademic.StudentPersonal.ArSecoundName + " " +
                                      item.StudentAcademic.StudentPersonal.ArFamilyName,
                        StudentNo = item.StudentAcademic.StudentNo
                    })
                .WhereIf(queryOptions != null && !string.IsNullOrEmpty(queryOptions.SearchKey),
                    x => x.StudentName.Contains(queryOptions.SearchKey));
            if (queryOptions != null)
                result = result.AplayQueryOptions(queryOptions);
            else
                result = result.OrderBy(x => x.StudentName);
            return await result.ToListAsync();
        }

        public MarkDto MarkGet(int markId)
        {
            var mark = unitOfWork.Academic.Mark.Find(markId);

            /* Start -- Add by RSR    */
            var sectionID = mark.StdSection.SectionID;
            var offerCourseID = unitOfWork.Academic.Section.Where(x => x.ID == sectionID).FirstOrDefault().OfferdCourseID;
            var courseID = unitOfWork.Academic.OfferdCourse.Where(x => x.ID == offerCourseID).FirstOrDefault().CourseID;
            var deparmetID = unitOfWork.Academic.Course.Where(x => x.ID == courseID).FirstOrDefault().DepartmentID;
            var collegeID = unitOfWork.Academic.Department.Where(x => x.ID == deparmetID).FirstOrDefault().CollegeID;
            var programID = unitOfWork.Academic.College.Where(x => x.ID == collegeID).FirstOrDefault().ProgramID;

            var passMark = unitOfWork.Academic.Program.Where(x => x.ID == programID).FirstOrDefault().PassMark;
            /* End -- Add by RSR    */

            var result = new MarkDto
            {
                StdSectionId = mark.StdSectionID,
                OfferdCourseTypeID = mark.StdSection.Section.OfferdCourse.OfferdCourseTypeID,
                CourseID = mark.StdSection.Course.ID,
                CourseTypeID = mark.StdSection.Course.CourseType,
                IsRemedialCourse = mark.StdSection.IsRemedialCourse.Value ? true : false,
                MarkId = mark.ID,
                IsInsertMidtermMark = mark.MidtermMarkEmployeeID != 0,
                WorkMark = mark.WorkMark,
                MidtermMark = mark.MidtermMark,
                FinalMark = mark.FinalMark,
                TotalMark = mark.TotalMark,
                IsSuccess = mark.TotalMark >= passMark,
                IsMidtermIncomplete = mark.IsMidtermIncomplete,
                IsMidtermNoMark = mark.IsMidtermNoMark,
                IsMidtermNoMarkAccept = mark.IsMidtermNoMarkAccept,
                IsMidtermZero = mark.IsMidtermZero,
                IsFinalNoMark = mark.IsFinalNoMark,
                IsFinalNoMarkAccept = mark.IsFinalNoMarkAccept,
                IsFinalZero = mark.IsFinalZero,
                IsFinalIncomplete = mark.IsFinalIncomplete,
                finalTeacherAccreditation = mark.TeacherAccreditation,
                midTeacherAccreditation = mark.MidTeacherAccreditation,
                finalHeadAccreditation = mark.HeadAccreditation,
                midHeadAccreditation = mark.MidHeadAccreditation,
                finalDeanAccreditation = mark.DeanAccreditation,
                midDeanAccreditation = mark.MidDeanAccreditation,
                finalAcademicAccreditation = mark.AcademicAccreditation,
                midAcademicAccreditation = mark.MidAcademicAccreditation,
                StudentID = mark.StdSection.StudentAcademic.StudentID,
                StudentName = mark.StdSection.StudentAcademic.StudentPersonal.ArFirstName + " " +
                              mark.StdSection.StudentAcademic.StudentPersonal.ArSecoundName + " " +
                              mark.StdSection.StudentAcademic.StudentPersonal.ArFamilyName,
                StudentNo = mark.StdSection.StudentAcademic.StudentNo,
                Note = mark.Note,
                SectionID = mark.StdSection.SectionID
            };


            return result;
        }


        public SectionDto SectionMarkDetails(int sectionId)
        {
            var query = unitOfWork.Academic.Section.Clean().IsActive()
                .Join(unitOfWork.Academic.EmplyeeView,
                    section => section.EmployeeID,
                    employee => employee.ID,
                    (section, employee) => new { section, employee })
                .Select(a => new SectionDto
                {
                    ID = a.section.ID,
                    DepartmentName = a.section.OfferdCourse.Course.Department.ArName,
                    CourseName = a.section.OfferdCourse.Course.ArName,
                    SectionNum = a.section.SectionNum,
                    EmployeeName = a.employee.ArFirstName + " " + a.employee.ArSecoundName + " " +
                                   a.employee.ArFamilyName,
                    MidTeacherAccreditationCount = a.section.MidTeacherAccreditationCount,
                    IsMidTeacherAllAccreditation = a.section.IsMidTeacherAllAccreditation,
                    MidDeanAccreditationCount = a.section.MidDeanAccreditationCount,
                    IsMidDeanAllAccreditation = a.section.IsMidDeanAllAccreditation,
                    MidAcademicAccreditationCount = a.section.MidAcademicAccreditationCount,
                    IsMidAcademicAllAccreditation = a.section.IsMidAcademicAllAccreditation,

                    FinalTeacherAccreditationCount = a.section.FinalTeacherAccreditationCount,
                    IsFinalTeacherAllAccreditation = a.section.IsFinalTeacherAllAccreditation,
                    FinalDeanAccreditationCount = a.section.FinalDeanAccreditationCount,
                    IsFinalDeanAllAccreditation = a.section.IsFinalDeanAllAccreditation,
                    IsFinalAcademicAllAccreditation = a.section.IsFinalAcademicAllAccreditation,
                    FinalAcademicAccreditationCount = a.section.FinalAcademicAccreditationCount
                });

            return query.FirstOrDefault(x => x.ID == sectionId);
        }


        #region Accrediation

        public bool MarKAccrediation(MarKAccrediationPorter porter)
        {
            try
            {
                var stdSection = unitOfWork.Academic.StdSection.Find(porter.StdSectionId);

                var mark = stdSection.Mark.First(x => !x.IsDelete && !x.HasEdit);
                ChickMarKAccrediation(stdSection, mark, porter.AccreditationType, porter.EmployeeId,
                    porter.ExamTypeEnum);
            }
            catch (Exception e)
            {
                var msg = "خطأ اثناء اعتماد العلامة";
                unitOfWork.AddAlert(AlertTypeEnum.danger, msg);
                Logger.Fatal(msg, e);
            }

            return true;
        }


        public void SectionMarKAccrediation(SectionMarKAccrediationInput input)
        {
            var regularStudents = _sectionService.GetSectionRegularStdSection(input.SectionId)
                .WhereIf(input.Ids != null, x => input.Ids.Any(i => i == x.ID))
                .ToList();


            // save Regular student Count
            var section = unitOfWork.Academic.Section.Find(input.SectionId);
            section.StudentCount = regularStudents.Count();


            foreach (var stdSection in regularStudents)
                try
                {
                    var mark = stdSection.Mark.First(m => !m.IsDelete && !m.HasEdit);
                    ChickMarKAccrediation(stdSection, mark, input.AccreditationType, input.EmployeeId,
                        input.ExamTypeEnum);

                    if (input.ExamTypeEnum == ExamTypeEnum.Final)
                    {
                        stdSection.Section.IsFinalTeacherAllAccreditation =
                            stdSection.Section.FinalTeacherAccreditationCount == stdSection.Section.StudentCount;
                        stdSection.Section.IsFinalDeanAllAccreditation =
                            stdSection.Section.FinalDeanAccreditationCount == stdSection.Section.StudentCount;
                        stdSection.Section.IsFinalAcademicAllAccreditation =
                            stdSection.Section.FinalAcademicAccreditationCount == stdSection.Section.StudentCount;
                    }
                    else if (input.ExamTypeEnum == ExamTypeEnum.Mid)
                    {
                        stdSection.Section.IsMidTeacherAllAccreditation =
                            stdSection.Section.MidTeacherAccreditationCount == stdSection.Section.StudentCount;
                        stdSection.Section.IsMidDeanAllAccreditation =
                            stdSection.Section.MidDeanAccreditationCount == stdSection.Section.StudentCount;
                        stdSection.Section.IsMidAcademicAllAccreditation =
                            stdSection.Section.MidAcademicAccreditationCount == stdSection.Section.StudentCount;
                    }
                }
                catch (Exception e)
                {
                    var msg = "خطأ اثناء اعتماد علامة";
                    unitOfWork.AddAlert(AlertTypeEnum.danger, msg);
                    Logger.Fatal(msg, e);
                }
        }

        public void MultiSectionMarKAccrediation(IList<int> sectionsIds, AccreditationTypeEnum accreditationType, ExamTypeEnum examTypeEnum, int employeeId)
        {
            foreach (var sectionsId in sectionsIds)
            {
                SectionMarKAccrediation(new SectionMarKAccrediationInput(sectionsId, accreditationType, employeeId, examTypeEnum));
                _sectionService.UpdateStudentsCount(sectionsId);
                _sectionService.UpdateAccerdiationsCount(sectionsId);


            }


            // BackgroundJob.Enqueue<MarkService>(x => x.SectionMarKAccrediation(sectionsId, accreditationType, employeeId, examTypeEnum));
            //todo Add log Here

        }

        private void ChickMarKAccrediation(StdSection stdSection, Mark mark, AccreditationTypeEnum accreditationType, int employeeId, ExamTypeEnum examTypeEnum)
        {
            /* Start -- commented by RSR
             var passMark = stdSection.Section.OfferdCourse.Course.Department.College.Program.PassMark;
               End -- commented by RSR*/
            /* Start -- Add by RSR    */
            var sectionID = stdSection.SectionID;
            var offerCourseID = unitOfWork.Academic.Section.Where(x => x.ID == sectionID).FirstOrDefault().OfferdCourseID;
            var courseID = unitOfWork.Academic.OfferdCourse.Where(x => x.ID == offerCourseID).FirstOrDefault().CourseID;
            var deparmetID = unitOfWork.Academic.Course.Where(x => x.ID == courseID).FirstOrDefault().DepartmentID;
            var collegeID = unitOfWork.Academic.Department.Where(x => x.ID == deparmetID).FirstOrDefault().CollegeID;
            var programID = unitOfWork.Academic.College.Where(x => x.ID == collegeID).FirstOrDefault().ProgramID;

            var passMark = unitOfWork.Academic.Program.Where(x => x.ID == programID).FirstOrDefault().PassMark;
            /* End -- Add by RSR    */
            if (examTypeEnum == ExamTypeEnum.Final)
                switch (accreditationType)
                {
                    case AccreditationTypeEnum.Teacher:
                        if (mark.TeacherAccreditation) break;
                        if (mark.HeadAccreditation) break;
                        if (mark.DeanAccreditation) break;
                        if (mark.AcademicAccreditation) break;


                        mark.TeacherAccreditation = true;
                        mark.TeacherAccreditationEmployeeID = employeeId;
                        mark.TeacherAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalTeacherAccreditationCount <
                            mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.FinalTeacherAccreditationCount++;


                        break;
                    case AccreditationTypeEnum.Head:
                        if (!mark.TeacherAccreditation) break;
                        if (mark.HeadAccreditation) break;
                        if (mark.DeanAccreditation) break;
                        if (mark.AcademicAccreditation) break;

                        mark.HeadAccreditation = true;
                        mark.HeadAccreditationEmployeeID = employeeId;
                        mark.HeadAccreditationDate = DateTime.Now;

                        break;
                    case AccreditationTypeEnum.Dean:

                        //if (!mark.TeacherAccreditation) break;
                        if (mark.DeanAccreditation) break;
                        if (mark.AcademicAccreditation) break;

                        mark.DeanAccreditation = true;
                        mark.DeanAccreditationEmployeeID = employeeId;
                        mark.DeanAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalDeanAccreditationCount < mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.FinalDeanAccreditationCount++;


                        break;

                    case AccreditationTypeEnum.Academic:

                        //if (!mark.TeacherAccreditation) break;
                        //if (!mark.DeanAccreditation) break;
                        if (mark.AcademicAccreditation) break;

                        mark.AcademicAccreditation = true;
                        mark.AcademicAccreditationEmployeeID = employeeId;
                        mark.AcademicAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalAcademicAccreditationCount <
                            mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.FinalAcademicAccreditationCount++;

                        mark.StdSection.CourseStatusID = mark.TotalMark >= passMark
                            ? (int)CourseStatusEnum.Successful
                            : (int)CourseStatusEnum.Failure;
                        mark.StdSection.Accreditation = true;

                        BackgroundJob.Schedule<CalculationManager>(
                            x => x.CalculateGpa(mark.StdSection.StudentID.Value, mark.StdSection.StdSemesterID,
                                AccreditationStatusEnum.Accredit), TimeSpan.FromSeconds(15));
                        break;
                }
            else if (examTypeEnum == ExamTypeEnum.Mid)
                switch (accreditationType)
                {
                    case AccreditationTypeEnum.Teacher:
                        if (mark.MidTeacherAccreditation) break;

                        mark.MidTeacherAccreditation = true;
                        mark.TeacherAccreditationEmployeeID = employeeId;
                        mark.TeacherAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidTeacherAccreditationCount < mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.MidTeacherAccreditationCount++;
                        break;
                    case AccreditationTypeEnum.Head:
                        if (mark.MidHeadAccreditation) break;
                        mark.MidHeadAccreditation = true;
                        mark.HeadAccreditationEmployeeID = employeeId;
                        mark.HeadAccreditationDate = DateTime.Now;

                        break;
                    case AccreditationTypeEnum.Dean:

                        if (mark.MidDeanAccreditation) break;
                        mark.MidDeanAccreditation = true;
                        mark.DeanAccreditationEmployeeID = employeeId;
                        mark.DeanAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidDeanAccreditationCount < mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.MidDeanAccreditationCount++;

                        break;

                    case AccreditationTypeEnum.Academic:
                        if (mark.MidAcademicAccreditation) break;
                        mark.MidAcademicAccreditation = true;
                        mark.AcademicAccreditationEmployeeID = employeeId;
                        mark.AcademicAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidAcademicAccreditationCount <
                            mark.StdSection.Section.StudentCount)
                            mark.StdSection.Section.MidAcademicAccreditationCount++;

                        break;
                }
        }

        #endregion

        #region ReturnAccrediation

        public void MarKReturnAccrediation(int stdSectionId, AccreditationTypeEnum accreditationType, int employeeId, ExamTypeEnum examTypeEnum)
        {
            var stdSection = unitOfWork.Academic.StdSection.Find(stdSectionId);
            var mark = stdSection.Mark.FirstOrDefault(x => !x.IsDelete && !x.HasEdit);
            if (mark == null) return; // todo chick if is there any stdsection without mark !?
            ChickMarkReturnAccrediationChain(stdSection, mark, accreditationType, employeeId, examTypeEnum);
            //todo add log here
        }

        public void SectionMarKReturnAccrediation(SectionMarKAccrediationInput input)
        {
            var regularStudents = _sectionService.GetSectionRegularStdSection(input.SectionId)
                .WhereIf(input.Ids != null, x => input.Ids.Any(i => i == x.ID))
                .ToList();
            foreach (var regularStd in regularStudents)
            {
                var stdSection = regularStd;
                var mark = stdSection.Mark.FirstOrDefault(m => !m.IsDelete && !m.HasEdit);

                if (mark == null) continue; // todo chick if is there any stdsection without mark !?
                ChickMarkReturnAccrediationChain(stdSection, mark, input.AccreditationType, input.EmployeeId,
                    input.ExamTypeEnum);


                if (input.ExamTypeEnum == ExamTypeEnum.Final)
                {
                    stdSection.Section.IsFinalTeacherAllAccreditation =
                        stdSection.Section.FinalTeacherAccreditationCount == stdSection.Section.StudentCount;
                    stdSection.Section.IsFinalDeanAllAccreditation =
                        stdSection.Section.FinalDeanAccreditationCount == stdSection.Section.StudentCount;
                    stdSection.Section.IsFinalAcademicAllAccreditation =
                        stdSection.Section.FinalAcademicAccreditationCount == stdSection.Section.StudentCount;
                }
                else if (input.ExamTypeEnum == ExamTypeEnum.Mid)
                {
                    stdSection.Section.IsMidTeacherAllAccreditation =
                        stdSection.Section.MidTeacherAccreditationCount == stdSection.Section.StudentCount;
                    stdSection.Section.IsMidDeanAllAccreditation =
                        stdSection.Section.MidDeanAccreditationCount == stdSection.Section.StudentCount;
                    stdSection.Section.IsMidAcademicAllAccreditation =
                        stdSection.Section.MidAcademicAccreditationCount == stdSection.Section.StudentCount;
                }

                //todo add log here
            }
        }

        public void MultiSectionMarKReturnAccrediation(IList<int> sectionsIds, AccreditationTypeEnum accreditationType,
            ExamTypeEnum examTypeEnum, int employeeId)
        {
            foreach (var sectionsId in sectionsIds)
                SectionMarKReturnAccrediation(new SectionMarKAccrediationInput(sectionsId, accreditationType,
                    employeeId, examTypeEnum));
            // BackgroundJob.Enqueue<MarkService>(x => x.SectionMarKAccrediation(sectionsId, accreditationType, employeeId, examTypeEnum));
            //todo Add log Here
        }

        private void ChickMarkReturnAccrediationChain(StdSection stdSection, Mark mark, AccreditationTypeEnum accreditationType, int employeeId, ExamTypeEnum examTypeEnum)
        {
            switch (accreditationType)
            {
                case AccreditationTypeEnum.Academic:
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Academic, employeeId,
                        examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Dean, employeeId, examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Head, employeeId, examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Teacher, employeeId,
                        examTypeEnum);
                    break;
                case AccreditationTypeEnum.Dean:
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Dean, employeeId, examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Head, employeeId, examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Teacher, employeeId,
                        examTypeEnum);
                    break;
                case AccreditationTypeEnum.Head:

                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Head, employeeId, examTypeEnum);
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Teacher, employeeId,
                        examTypeEnum);
                    break;
                case AccreditationTypeEnum.Teacher:
                    ChickMarKReturnAccrediation(stdSection, mark, AccreditationTypeEnum.Teacher, employeeId,
                        examTypeEnum);
                    break;
            }
        }

        private void ChickMarKReturnAccrediation(StdSection stdSection, Mark mark,
            AccreditationTypeEnum accreditationType, int employeeId, ExamTypeEnum examTypeEnum)
        {
            if (examTypeEnum == ExamTypeEnum.Final)
                switch (accreditationType)
                {
                    case AccreditationTypeEnum.Teacher:

                        if (!mark.TeacherAccreditation) break;
                        if (mark.DeanAccreditation) break;
                        mark.TeacherAccreditation = false;
                        mark.TeacherAccreditationEmployeeID = employeeId;
                        mark.TeacherAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalTeacherAccreditationCount > 0)
                            mark.StdSection.Section.FinalTeacherAccreditationCount--;

                        break;
                    case AccreditationTypeEnum.Head:
                        if (!mark.HeadAccreditation) break;
                        mark.HeadAccreditation = false;
                        mark.HeadAccreditationEmployeeID = employeeId;
                        mark.HeadAccreditationDate = DateTime.Now;

                        break;
                    case AccreditationTypeEnum.Dean:

                        if (!mark.DeanAccreditation) break;
                        if (mark.AcademicAccreditation) break;
                        mark.DeanAccreditation = false;
                        mark.DeanAccreditationEmployeeID = employeeId;
                        mark.DeanAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalDeanAccreditationCount > 0)
                            mark.StdSection.Section.FinalDeanAccreditationCount--;

                        break;

                    case AccreditationTypeEnum.Academic:
                        if (!mark.AcademicAccreditation) break;
                        mark.AcademicAccreditation = false;
                        mark.AcademicAccreditationEmployeeID = employeeId;
                        mark.AcademicAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.FinalAcademicAccreditationCount > 0)
                            mark.StdSection.Section.FinalAcademicAccreditationCount--;
                        mark.StdSection.CourseStatusID = (int)CourseStatusEnum.Register;
                        mark.StdSection.Accreditation = false;
                        //BackgroundJob.Enqueue<GpaService>(x => x.CalculateGpa(mark.StdSection.StudentID.Value));
                        BackgroundJob.Schedule<CalculationManager>(
                            x => x.CalculateGpa(mark.StdSection.StudentID.Value, mark.StdSection.StdSemesterID,
                                AccreditationStatusEnum.UnAccredit), TimeSpan.FromSeconds(15));

                        break;
                }
            else if (examTypeEnum == ExamTypeEnum.Mid)
                switch (accreditationType)
                {
                    case AccreditationTypeEnum.Teacher:

                        if (!mark.MidTeacherAccreditation) break;
                        if (mark.MidDeanAccreditation) break;
                        mark.MidTeacherAccreditation = false;
                        mark.TeacherAccreditationEmployeeID = employeeId;
                        mark.TeacherAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidTeacherAccreditationCount > 0)
                            mark.StdSection.Section.MidTeacherAccreditationCount--;

                        break;
                    case AccreditationTypeEnum.Head:
                        if (!mark.MidHeadAccreditation) break;
                        mark.MidHeadAccreditation = false;
                        mark.HeadAccreditationEmployeeID = employeeId;
                        mark.HeadAccreditationDate = DateTime.Now;

                        break;
                    case AccreditationTypeEnum.Dean:

                        if (!mark.MidDeanAccreditation) break;
                        if (mark.MidAcademicAccreditation) break;
                        mark.MidDeanAccreditation = false;
                        mark.DeanAccreditationEmployeeID = employeeId;
                        mark.DeanAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidDeanAccreditationCount > 0)
                            mark.StdSection.Section.MidDeanAccreditationCount--;
                        break;

                    case AccreditationTypeEnum.Academic:
                        if (!mark.MidAcademicAccreditation) break;
                        mark.MidAcademicAccreditation = false;
                        mark.AcademicAccreditationEmployeeID = employeeId;
                        mark.AcademicAccreditationDate = DateTime.Now;
                        if (mark.StdSection.Section.MidAcademicAccreditationCount > 0)
                            mark.StdSection.Section.MidAcademicAccreditationCount--;

                        break;
                }
        }


        public int RefreshTotalMark(int stdSectionId, out int oldTotalMark)
        {
            var stdSection = unitOfWork.Academic.StdSection.Find(stdSectionId);
            var m = stdSection.Mark.Clean().FirstOrDefault();
            oldTotalMark = m.TotalMark;
            m.TotalMark = TotalMarkGet(stdSectionId);
            return m.TotalMark;
        }


        private int TotalMarkGet(int stdsectionID, bool ignorAccredit = false)
        {
            var totalMark = 0;

            var stdsection = unitOfWork.Academic.StdSection.FirstOrDefault(x => x.ID == stdsectionID);
            var section = stdsection.Section;
            var course = section.OfferdCourse.Course;
            var program = stdsection.StudentAcademic.Program;
            var zeroMark = program.ZeroMark;
            var passMark = program.PassMark;
            var mark = stdsection.Mark.Clean().FirstOrDefault();
            var midAccredit = mark.MidAcademicAccreditation;
            var FinalAccredit = mark.AcademicAccreditation;


            var midtermMark = 0;
            var midtermMinusMark = 0;
            var finalMark = 0;
            var finalMinusMark = 0;
            var WorkMark = 0;


            if (ignorAccredit)
            {
                midtermMark = mark.MidtermMark;
                midtermMinusMark = mark.MidtermMinusMark;
                finalMark = mark.FinalMark;
                finalMinusMark = mark.FinalMinusMark;
                WorkMark = mark.WorkMark;
            }
            else
            {
                if (midAccredit)
                {
                    midtermMark = mark.MidtermMark;
                    midtermMinusMark = mark.MidtermMinusMark;
                }


                if (FinalAccredit)
                {
                    finalMark = mark.FinalMark;
                    finalMinusMark = mark.FinalMinusMark;
                    WorkMark = mark.WorkMark;
                }
            }


            var isMidtermZero = mark.IsMidtermZero;
            var isMidtermIncomplete = mark.IsMidtermIncomplete;
            var isFinalZero = mark.IsFinalZero;
            var isTotalMarkZero = mark.IsTotalZero;
            var marktTitle = _sectionService.SectionMarkTitleGet(section.ID);
            var midtermMarkMax = marktTitle.Mark2;
            var finalMarkMax = marktTitle.Mark3;

            if (isMidtermIncomplete || isMidtermZero)
            {
                midtermMark = 0;
            }
            else
            {
                midtermMark = midtermMark - midtermMinusMark;
                if (midtermMark < 0) midtermMark = 0;
            }

            if (isFinalZero)
            {
                finalMark = 0;
            }
            else
            {
                finalMark = finalMark - finalMinusMark;
                if (finalMark < 0) finalMark = 0;
            }

            if (isMidtermIncomplete)
                finalMark = Convert.ToInt32(Math.Ceiling(finalMark * (midtermMarkMax + finalMarkMax) / finalMarkMax));


            totalMark = isTotalMarkZero ? 0 : WorkMark + midtermMark + finalMark;
            totalMark = totalMark < zeroMark.Value ? zeroMark.Value : totalMark;
            totalMark = totalMark == passMark.Value - 1 ? passMark.Value : totalMark;

            return totalMark;
        }

        public void MarkUpdate(MarkDto input, int employeeId)
        {
            var mark = unitOfWork.Academic.Mark.Find(input.MarkId);
            var oldTotalmark = mark.TotalMark;
            var stdsection = mark.StdSection;
            var sectionId = stdsection.SectionID;
            var sectionInfo = _sectionService.SectionInfoGet(sectionId.Value);
            var sectionCourseCatogery = sectionInfo.courseCatogery.ArName;
            var sectionCourseType = sectionInfo.CourseType.ArName;
            var marktTitle = _sectionService.SectionMarkTitleGet(sectionId.Value);

            if (mark.AcademicAccreditation || mark.DeanAccreditation || mark.TeacherAccreditation)
            {
                unitOfWork.AddAlert(AlertTypeEnum.warning, "لا يمكن تعديل العلامة حتى يتم ارجاع جميع الاعتمادات ");
            }
            else
            {
                if (input.WorkMark >= 0 && input.WorkMark <= marktTitle.Mark1 && input.MidtermMark >= 0 &&
                    input.MidtermMark <= marktTitle.Mark2 && input.FinalMark >= 0 && input.FinalMark <= marktTitle.Mark3)
                {
                    if (mark.MidtermMark != input.MidtermMark)
                    {
                        mark.MidtermMark = input.MidtermMark;
                        mark.MidtermMarkEmployeeID = employeeId;
                        mark.MidtermMarkInsertDate = DateTime.Now;
                    }


                    if (mark.FinalMark != input.FinalMark)
                    {
                        mark.FinalMark = input.FinalMark;
                        mark.FinalMarkEmployeeID = employeeId;
                        mark.FinalMarkInsertDate = DateTime.Now;
                        //mark.TotalMark = TotalMarkGet(stdsection.ID);
                    }


                    if (mark.WorkMark != input.WorkMark)
                    {
                        mark.WorkMark = input.WorkMark;
                        mark.WorkMarkEmployeeID = employeeId;
                        mark.WorkMarkInsertDate = DateTime.Now;
                        //mark.TotalMark = TotalMarkGet(stdsection.ID);
                    }

                    mark.IsMidtermNoMark = input.IsMidtermNoMark;
                    mark.IsFinalNoMark = input.IsFinalNoMark;
                    //if (oldTotalmark > 0)
                    //    mark.TotalMark = TotalMarkGet(stdsection.ID);


                    mark.TotalMark = TotalMarkGet(stdsection.ID, true);
                    var markLogJson = Json.Encode(new
                    {
                        Flag = "UpdateMark",
                        mark.WorkMark,
                        mark.MidtermMark,
                        mark.FinalMark,
                        mark.TotalMark,
                        mark.ID,
                        mark.IsMidtermNoMark,
                        mark.IsFinalNoMark
                    });

                    unitOfWork.IsraaLog.MarkLog.Add(new MarkLog
                    {
                        InsertDate = DateTime.Now,
                        InsertEmployeeID = employeeId,
                        MarkID = input.MarkId,
                        Object = markLogJson
                    });
                }
                else
                {
                    unitOfWork.AddAlert(AlertTypeEnum.danger,
                        "الرجاء التأكد من العلامة المدخلة حسب تصنيف المادة" + "  " + sectionCourseCatogery +
                        "ونوع المادة " + sectionCourseType + "حيث أن توزيع العلامات كالتالي : نصفي " + "  " +
                        marktTitle.Mark2 + "نهائي " + marktTitle.Mark3 + "أعمال فصل :" + marktTitle.Mark1);
                }
            }
        }

        #endregion

        public class GetStudentsSpecialMarksInput
        {
            public int semesterId { get; set; }
            public int offeredcourseTypeId { get; set; }
        }

        public List<StudentsSpecialMarksDto> GetStudentsSpecialMarks(QueryOptions queryOptions,
            GetStudentsSpecialMarksInput input)
        {
            var result = unitOfWork.Academic.StdSection.Clean().Where(x =>
                (x.CourseStatusID == (int)CourseStatusEnum.Register ||
                 x.CourseStatusID == (int)CourseStatusEnum.Successful ||
                 x.CourseStatusID == (int)CourseStatusEnum.Failure ||
                 x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister)
                && x.Section.OfferdCourse.SemesterID == input.semesterId
                && x.Section.OfferdCourse.OfferdCourseTypeID == input.offeredcourseTypeId
            ).Select(x => new StudentsSpecialMarksDto
            {
                StdSectionID = x.ID,
                studentId = x.StudentID,
                studentNo = x.StudentAcademic.StudentNo,
                studentName = x.StudentAcademic.StudentPersonal.ArFirstName + " " +
                              x.StudentAcademic.StudentPersonal.ArSecoundName + " " +
                              x.StudentAcademic.StudentPersonal.ArFamilyName,
                courseName = x.Course.ArName,
                studentCollege = x.StudentAcademic.Department.College.ArName,
                totalMark = x.Mark.FirstOrDefault(m => !m.IsDelete && !m.HasEdit).TotalMark,
                academicAccreditation = x.Mark.FirstOrDefault(m => !m.IsDelete && !m.HasEdit).AcademicAccreditation
            });

            var query = result.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }

        public class SetStdSectionTotalMarkInput
        {
            public int stdsectionId { get; set; }

            public int totalMark { get; set; }
            //public int employeeId { get; set; }
        }


        public void SetStdSectionTotalMark(SetStdSectionTotalMarkInput input)
        {
            var stdSection = unitOfWork.Academic.StdSection.Find(input.stdsectionId);
            stdSection.Mark.Clean().FirstOrDefault().TotalMark = input.totalMark;
        }
    }

    #region Classes

    public class MarkDto
    {
        public int StdSectionId { get; set; }

        public int MarkId { get; set; }
        public int WorkMark { get; set; }
        public int MidtermMark { get; set; }
        public int FinalMark { get; set; }
        public int TotalMark { get; set; }
        public bool finalTeacherAccreditation { get; set; }
        public bool midTeacherAccreditation { get; set; }
        public bool finalHeadAccreditation { get; set; }
        public bool midHeadAccreditation { get; set; }
        public bool finalDeanAccreditation { get; set; }
        public bool midDeanAccreditation { get; set; }
        public bool finalAcademicAccreditation { get; set; }
        public bool midAcademicAccreditation { get; set; }
        public int StudentID { get; set; }
        public string StudentName { get; set; }
        public int StudentNo { get; set; }
        public bool IsMidtermNoMark { get; set; }
        public bool IsFinalNoMark { get; set; }
        public int OfferdCourseTypeID { get; set; }
        public int CourseID { get; set; }
        public int? CourseTypeID { get; set; }
        public bool IsRemedialCourse { get; set; }
        public bool IsInsertMidtermMark { get; set; }
        public bool IsSuccess { get; set; }
        public bool IsMidtermIncomplete { get; set; }
        public bool? IsMidtermNoMarkAccept { get; set; }
        public bool? IsMidtermZero { get; set; }
        public bool? IsFinalNoMarkAccept { get; set; }
        public bool IsFinalZero { get; set; }
        public bool IsFinalIncomplete { get; set; }
        public string Note { get; set; }
        public int? SectionID { get; set; }
    }

    public class RegularStudentsStdSectionDto
    {
        public StdSection StdSec { get; set; }
        public StudentsView studentsView { get; set; }
    }

    public class SectionDto
    {
        public int? EmployeeID;
        public int ID { get; set; }

        [DisplayName("اسم القسم")] public string DepartmentName { get; set; }

        [DisplayName("اسم المساق")] public string CourseName { get; set; }

        [DisplayName("رقم الشعبة")] public int SectionNum { get; set; }

        [DisplayName("اسم المحاضر")] public string EmployeeName { get; set; }


        public int MidTeacherAccreditationCount { get; set; }
        public bool IsMidTeacherAllAccreditation { get; set; }
        public int MidDeanAccreditationCount { get; set; }
        public bool IsMidDeanAllAccreditation { get; set; }
        public int MidAcademicAccreditationCount { get; set; }
        public bool IsMidAcademicAllAccreditation { get; set; }


        public int FinalTeacherAccreditationCount { get; set; }
        public bool IsFinalTeacherAllAccreditation { get; set; }
        public int FinalDeanAccreditationCount { get; set; }
        public bool IsFinalDeanAllAccreditation { get; set; }
        public bool IsFinalAcademicAllAccreditation { get; set; }
        public int FinalAcademicAccreditationCount { get; set; }

        public int StudentCount { get; set; }
    }




    public class SectionMarKAccrediationInput
    {
        public SectionMarKAccrediationInput(int sectionId, AccreditationTypeEnum accreditationType, int employeeId,
            ExamTypeEnum examTypeEnum, List<int> ids = null)
        {
            SectionId = sectionId;
            AccreditationType = accreditationType;
            EmployeeId = employeeId;
            ExamTypeEnum = examTypeEnum;
            Ids = ids;
        }

        [Required] public int SectionId { get; }

        [Required] public AccreditationTypeEnum AccreditationType { get; }

        [Required] public int EmployeeId { get; }

        [Required] public ExamTypeEnum ExamTypeEnum { get; }

        public List<int> Ids { get; set; }
    }

    public class MarKAccrediationPorter
    {
        public MarKAccrediationPorter(int stdSectionId, AccreditationTypeEnum accreditationType, int employeeId,
            ExamTypeEnum examTypeEnum)
        {
            StdSectionId = stdSectionId;
            AccreditationType = accreditationType;
            EmployeeId = employeeId;
            ExamTypeEnum = examTypeEnum;
        }

        [Required] public int StdSectionId { get; }

        [Required] public AccreditationTypeEnum AccreditationType { get; }

        [Required] public int EmployeeId { get; }

        [Required] public ExamTypeEnum ExamTypeEnum { get; }
    }

    public class StudentsSpecialMarksDto
    {
        public int StdSectionID { get; set; }
        public int? studentId { get; set; }
        public int studentNo { get; set; }
        public string studentName { get; set; }
        public string courseName { get; set; }
        public string studentCollege { get; set; }
        public int totalMark { get; set; }
        public bool academicAccreditation { get; set; }
    }

    #endregion
}
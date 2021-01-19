using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Hangfire;
using IsraaSystem.Application.Academic.BackgroundJobManger;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.Sql.Financial;
using log4net;

namespace IsraaSystem.Application.Academic.TransformationManger
{


    public interface ITransformationService : IIsraaService
    {
        IQueryable<StdSection> GetStudentTransformation(int studentId, bool? IsforAccredit);
        void RefreshStudentAcademicTransformationHour(int studentId);
        void RefreshStudentAcademicOldUniversityTransformationHours(int studentId);
        List<GetTransformationsDto> GetTransformations(QueryOptions queryOptions);
        List<TransformationPdfDto> GetStudentTransfromationPdf(int studentId, bool? IsforAccredit);
        void TransformationAccreditation(List<int> studentIds, int employeeId, AccreditationTypeEnum accreditationTypeEnum);
        void TransformationCancel(List<int> studentIds, int employeeId, bool isForStudentRequest);
    }


    public class TransformationService : IsraaService, ITransformationService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly ICalculationManager _calculationManager;
        private readonly ITransactionService _transactionService;
        public TransformationService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService, ICalculationManager calculationManager, ITransactionService transactionService) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;
            _calculationManager = calculationManager;
            _transactionService = transactionService;

        }

        public IQueryable<StdSection> GetStudentTransformation(int studentId, bool? IsforAccredit)
        {
            var result = unitOfWork.Academic.StdSection
            .Where(x => x.StudentID == studentId)
            .Where(x => x.StdSemester.SemesterID == 1)
            .Where(x => x.CourseStatusID == (int)CourseStatusEnum.Transformation)
            .WhereIf(IsforAccredit.HasValue, x => x.Accreditation == IsforAccredit).Clean();
            //.Where(x => x.Mark.Any(m => m.DeanAccreditation && !m.IsDelete && !m.HasEdit))

            return result;

        }


        public List<TransformationPdfDto> GetStudentTransfromationPdf(int studentId, bool? IsforAccredit)
        {

            var result = GetStudentTransformation(studentId, IsforAccredit).Select(x => new TransformationPdfDto
            {
                CourseArName = x.Course.ArName,
                CourseNumOfHours = x.Course.NumOfHours,
                ETransWithCourseHours = x.ETransWithCourseHours,
                ETransWithCourseName = x.ETransWithCourseName,
                TotalHours = x.StudentAcademic.TransformationHours,
                TotalHours2 = x.StudentAcademic.OldUniversityTransformationHours,
                StudentID = studentId,
                StudentNo = x.StudentAcademic.StudentNo,
                StudentName = x.StudentAcademic.StudentPersonal.ArFirstName + " " +
                              x.StudentAcademic.StudentPersonal.ArSecoundName + " " +
                              x.StudentAcademic.StudentPersonal.ArFamilyName,
                DepartmentName = x.StudentAcademic.Department.ArName,
                TodayDate = DateTime.Now
            }).ToList();

            return result;

        }
        [AutomaticRetry(Attempts = 0)]
        public void RefreshStudentAcademicTransformationHour(int studentId)
        {
            var student = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var result = GetStudentTransformation(studentId, true);
            if (result.Any())
                student.TransformationHours = result.Select(x => x.Course).Sum(x => x.NumOfHours);
            unitOfWork.Complete();
        }

        [AutomaticRetry(Attempts = 0)]
        public void RefreshStudentAcademicOldUniversityTransformationHours(int studentId)
        {
            var student = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var result = GetStudentTransformation(studentId, true);
            if (result.Any())
                student.OldUniversityTransformationHours = result.Sum(x => x.ETransWithCourseHours.Value);
            unitOfWork.Complete();
        }


        public List<GetTransformationsDto> GetTransformations(QueryOptions queryOptions)
        {


            int studentNo = 0;
            var isInt = int.TryParse(queryOptions.SearchKey, out studentNo);

            var result = unitOfWork.Academic.StdSemester
                .Clean()
                .Where(x => !x.StudentAcademic.IsDelete)
                .Where(x => !x.StudentAcademic.IsRefusal)
                .Where(x => x.SemesterID == 1).Select(x => new GetTransformationsDto
                {
                    StudentID = x.StudentAcademic.StudentID,
                    StudentNo = x.StudentAcademic.StudentNo,
                    StudentName = x.StudentAcademic.StudentPersonal.ArFirstName + " " + x.StudentAcademic.StudentPersonal.ArSecoundName + " " + x.StudentAcademic.StudentPersonal.ArFamilyName,
                    DepartmentName = x.StudentAcademic.Department.ArName,
                    StudentType = x.StudentAcademic.StudentTypes.ArName,
                    SumOfHours = x.StudentAcademic.TransformationHours,
                    SumOfOldUniversityTransformationHours = x.StudentAcademic.OldUniversityTransformationHours,
                    PlanTotalHours = x.StudentAcademic.Plan.NumOfHours,
                    HeadAccreditation = x.StdSection.Where(t => !t.IsDelete).All(s => s.Mark.FirstOrDefault(m => m.HeadAccreditation && !m.IsDelete) != null),
                    DeanAccreditation = x.StdSection.Where(t => !t.IsDelete).All(s => s.Mark.FirstOrDefault(m => m.DeanAccreditation && !m.IsDelete) != null),
                    AcademicAccreditation = x.StdSection.Where(t => !t.IsDelete).All(s => s.Mark.FirstOrDefault(m => m.AcademicAccreditation && !m.IsDelete) != null)
                })
                .WhereIf(studentNo > 0, x => x.StudentNo == studentNo)
                .WhereIf(!string.IsNullOrEmpty(queryOptions.SearchKey) && !isInt, x => x.StudentName.Contains(queryOptions.SearchKey));

            result = result.AplayQueryOptions(queryOptions);


            return result.ToList();
        }

        [AutomaticRetry(Attempts = 0)]
        public void TransformationAccreditation(List<int> studentIds, int employeeId, AccreditationTypeEnum accreditationTypeEnum)
        {


            foreach (var studentId in studentIds)
            {
                var studentStdSectionTransformation = GetStudentTransformation(studentId, false).Clean();
                var stdSemester = studentStdSectionTransformation.FirstOrDefault();

                var stdSemesterId = stdSemester.StdSemesterID;
                var studentMarkTransformation = studentStdSectionTransformation.SelectMany(x => x.Mark).Clean();


                foreach (var mark in studentMarkTransformation)
                {

                    switch (accreditationTypeEnum)
                    {
                        case AccreditationTypeEnum.Teacher:

                            mark.TeacherAccreditation = true;
                            mark.TeacherAccreditationDate = DateTime.Now;
                            mark.TeacherAccreditationEmployeeID = employeeId;
                            break;
                        case AccreditationTypeEnum.Head:
                            mark.HeadAccreditation = true;
                            mark.HeadAccreditationDate = DateTime.Now;
                            mark.HeadAccreditationEmployeeID = employeeId;

                            break;
                        case AccreditationTypeEnum.Dean:

                            mark.DeanAccreditation = true;
                            mark.DeanAccreditationDate = DateTime.Now;
                            mark.DeanAccreditationEmployeeID = employeeId;
                            break;

                        case AccreditationTypeEnum.Academic:
                            mark.AcademicAccreditation = true;
                            mark.AcademicAccreditationDate = DateTime.Now;
                            mark.AcademicAccreditationEmployeeID = employeeId;
                            mark.StdSection.Accreditation = true;
                            mark.StdSection.AccreditationDate = DateTime.Now;
                            mark.StdSection.AccreditationEmployeeID = employeeId;
                            break;
                    }
                }
                int? id;
                var actionId = 13;
                var ActionInfo = _transactionService.GetActionInfoByActionID(actionId);
                var t = unitOfWork.IsraaData.StudentData.Find(studentId).Transaction.Clean().FirstOrDefault(x => x.ActionID == actionId);
                if (t == null)
                {
                    _transactionService.TransactionAdd(out id, studentId, ActionInfo.amount, actionId, SemestersEnum.CurentSemester, null, null, null, null, employeeId);
                }
            }
            unitOfWork.Complete();
            foreach (var studentId in studentIds)
            {
                BackgroundJob.Enqueue<ICalculationManager>(f => f.CalculateGpa(studentId, null, AccreditationStatusEnum.Accredit));
                //BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateBalance(studentId));
                DataTable Dt = TransactionDA.CalculateStudentInstallmentPaid(studentId);
            }
        }
        //[AutomaticRetry(Attempts = 0)]
        //public void TransformationUnAccreditation(int studentId, int employeeId, AccreditationTypeEnum accreditationTypeEnum)
        //{
        //    var studentStdSectionTransformation = GetStudentTransformation(studentId, null).Clean();
        //    var stdSemesterId = studentStdSectionTransformation.FirstOrDefault().StdSemesterID;
        //    var studentMarkTransformation = studentStdSectionTransformation.SelectMany(x => x.Mark).Clean();


        //    foreach (var mark in studentMarkTransformation)
        //    {

        //        switch (accreditationTypeEnum)
        //        {
        //            case AccreditationTypeEnum.Teacher:

        //                mark.TeacherAccreditation = false;
        //                mark.TeacherAccreditationDate = DateTime.Now;
        //                mark.TeacherAccreditationEmployeeID = employeeId;
        //                break;
        //            case AccreditationTypeEnum.Head:
        //                mark.HeadAccreditation = false;
        //                mark.HeadAccreditationDate = DateTime.Now;
        //                mark.HeadAccreditationEmployeeID = employeeId;

        //                break;
        //            case AccreditationTypeEnum.Dean:

        //                mark.DeanAccreditation = false;
        //                mark.DeanAccreditationDate = DateTime.Now;
        //                mark.DeanAccreditationEmployeeID = employeeId;
        //                break;

        //            case AccreditationTypeEnum.Academic:
        //                mark.AcademicAccreditation = false;
        //                mark.AcademicAccreditationDate = DateTime.Now;
        //                mark.AcademicAccreditationEmployeeID = employeeId;
        //                mark.StdSection.Accreditation = false;
        //                mark.StdSection.AccreditationDate = DateTime.Now;
        //                mark.StdSection.AccreditationEmployeeID = employeeId;
        //                break;
        //        }
        //    }


        //    unitOfWork.Complete();
        //    BackgroundJob.Enqueue<ICalculationManager>(f => f.CalculateGpa(studentId, stdSemesterId, AccreditationStatusEnum.UnAccredit));

        //}

        //public void TransformationUnAccreditationChain(int studentId, int employeeId, AccreditationTypeEnum accreditationTypeEnum)
        //{

        //    switch (accreditationTypeEnum)
        //    {
        //        case AccreditationTypeEnum.Academic:
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Academic);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Dean);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Head);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Teacher);
        //            break;
        //        case AccreditationTypeEnum.Dean:
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Dean);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Head);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Teacher);
        //            break;
        //        case AccreditationTypeEnum.Head:
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Head);
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Teacher);
        //            break;
        //        case AccreditationTypeEnum.Teacher:
        //            TransformationUnAccreditation(studentId, employeeId, AccreditationTypeEnum.Teacher);
        //            break;
        //    }
        //}
        [AutomaticRetry(Attempts = 0)]
        public void TransformationCancel(List<int> studentIds, int employeeId, bool isForStudentRequest)
        {
            foreach (var studentId in studentIds)
            {
                var studentStdSectionTransformation = GetStudentTransformation(studentId, true).Clean();
                var stdSemesterId = studentStdSectionTransformation.FirstOrDefault().StdSemesterID;
                var studentMarkTransformation = studentStdSectionTransformation.SelectMany(x => x.Mark).Clean();


                foreach (var mark in studentMarkTransformation)
                {
                    mark.AcademicAccreditation = false;
                    mark.AcademicAccreditationDate = DateTime.Now;
                    mark.AcademicAccreditationEmployeeID = employeeId;

                    mark.DeanAccreditation = false;
                    mark.DeanAccreditationDate = DateTime.Now;
                    mark.DeanAccreditationEmployeeID = employeeId;

                    mark.StdSection.Accreditation = false;
                    mark.StdSection.AccreditationDate = DateTime.Now;
                    mark.StdSection.AccreditationEmployeeID = employeeId;

                }

                //if (isForStudentRequest)
                //{
                //    int? id;
                //    var actionId = 13;
                //    var ActionInfo = _transactionService.GetActionInfoByActionID(actionId);
                //    _transactionService.TransactionAdd(out id, studentId, ActionInfo.amount, actionId, SemestersEnum.CurentSemester, null, null, null, null, employeeId);

                //}
            }

            unitOfWork.Complete();

            foreach (var studentId in studentIds)
            {
                BackgroundJob.Enqueue<ICalculationManager>(f => f.CalculateGpa(studentId, null, AccreditationStatusEnum.Accredit));
                if (isForStudentRequest)
                {
                    BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateBalance(studentId));
                    DataTable Dt = TransactionDA.CalculateStudentInstallmentPaid(studentId);

                }
            }

        }

    }

    public class GetTransformationsDto
    {
        public int StudentID { get; set; }
        public int StudentNo { get; set; }
        public string StudentName { get; set; }
        public string DepartmentName { get; set; }
        public string StudentType { get; set; }
        public int SumOfHours { get; set; }
        public int SumOfOldUniversityTransformationHours { get; set; }
        public int? PlanTotalHours { get; set; }
        public bool HeadAccreditation { get; set; }
        public bool DeanAccreditation { get; set; }
        public bool AcademicAccreditation { get; set; }
    }

    public class TransformationPdfDto
    {
        public string CourseArName { get; set; }
        public int CourseNumOfHours { get; set; }
        public string ETransWithCourseName { get; set; }
        public int? ETransWithCourseHours { get; set; }
        public int TotalHours { get; set; }
        public int TotalHours2 { get; set; }
        public int StudentID { get; set; }
        public int StudentNo { get; set; }
        public string StudentName { get; set; }
        public string DepartmentName { get; set; }
        public DateTime TodayDate { get; set; }
        public string TodayDateformat { get { return (TodayDate.ToString("yyyy/MM/dd")); } }
    }



}








using Hangfire;
using IsraaSystem.Application.Academic.MarkManager.Dtos;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Academic.MarkManager
{
    public interface ICalculationManager : IIsraaService
    {
        Task CalculateGpa(int studentId, int? stdSemesterId, AccreditationStatusEnum accreditationStatusEnum);
        //void SetStudentAcademicWarning(int stdSemesterId);

        Task CalculateSemesterCumulativeGpa(int stdSemesterId, bool isForGraduate);

        Task CalculateSemesterGpa(int stdSemesterId, bool isForGraduate);

        Task CalculateSemesterCumulativeGpaChick(int studentid, bool isForGraduate);

        Task CalculateSemesterGpaChick(int studentid, bool isForGraduate);
        Task CalculateSemesterRegisteredHours(int stdSemesterId);

        Task CalculateSemesterRegisteredHoursChick(int studentId);

        Task CalculateSemesterCumulativeRegisteredHours(int stdSemesterId);

        Task CalculateSemesterCumulativeRegisteredHoursChick(int studentId);

        //ساعات اثرائية
        Task CalculatStudentRichnessHours(int studentId);
        Task CalculatSemesterRichnessHour(int stdSemesterId);

        Task CalculatSemesterRichnessHourChick(int studentId);


        //ساعات الدراسة
        Task CalculatStudentStudiedHour(int studentId);
        Task UpdateGraduationStatusID(int studentId);

        Task AllCalculatOfStdSemester(int stdSemesterId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum);
        Task AllCalculatOfStdSemesterChick(int studentId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum);

        Task CalculateSemesterFailedHour(int stdSemesterId);

        Task CalculatSemesterFailedHourChick(int studentId);

        IQueryable<Course> GetStudentPlaneCourses(int studentId);

        List<StdSemesterDto> GetStudentStdSemesterGpaDetails(int studentId, out decimal gpaGraduate, out decimal gpaUniversity);
        List<GpaDto> GetGpaData(int studentId);


    }

    public class CalculationManager : IsraaService, ICalculationManager
    {
        #region Fields

        private List<Course> _planCourses;
        private List<GpaDto> _gpaDtos;
        private List<GpaDto> _gpaDtosNoDuplicate;
        private List<int> _stdSemesters;

        private readonly ISettingService _settingService;
        private readonly IAcademicWarningService _academicWarningService;
        private readonly IStudentService _studentService;
        private readonly bool isForGraduate;

        #endregion

        #region Constructor

        public CalculationManager(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService,
            IAcademicWarningService academicWarningService) : base(unitOfWork, logger)
        {
            _settingService = settingService;
            _academicWarningService = academicWarningService;
        }

        #endregion

        #region Properties

        private int StudentId { get; set; }

        private List<GpaDto> GpaDtos
        {

            get
            {
                if (_gpaDtos == null) _gpaDtos = GetGpaData(StudentId);

                return _gpaDtos;
            }

        }

        public List<Course> PlanCourses
        {
            get
            {
                if (_planCourses == null) _planCourses = GetStudentPlaneCourses(StudentId).ToList();

                return _planCourses;
            }
        }



        public List<int> StdSemesters
        {
            get
            {
                if (_stdSemesters == null)
                {
                    var student = unitOfWork.Academic.StudentAcademic.Find(StudentId);
                    _stdSemesters = student.StdSemester.Clean().OrderBy(x => x.SemesterID).Select(x => x.ID).ToList();
                }

                return _stdSemesters;
            }
        }

        #endregion

        #region Methods

        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateGpa(int studentId, int? stdSemesterId, AccreditationStatusEnum accreditationStatusEnum)
        {
            #region  vars
            StudentId = studentId;
            var studentAcademic = await unitOfWork.Academic.StudentAcademic.FindAsync(studentId);

            var program = unitOfWork.Academic.Program.Find(studentAcademic.ProgramID);
            if (studentAcademic == null) return;

            var studentAcademicLog = new StudentAcademicLog
            {
                StudentID = studentId,
                PrevGPAGraduate = studentAcademic.GPAGraduate,
                PrevGPAUniversity = studentAcademic.GPAUniversity,
                PrevPlanSucceedHour = studentAcademic.PlanSucceedHour,
                PrevStudiedHour = studentAcademic.StudiedHour,
                PrevSucceedHour = studentAcademic.SucceedHour,
                PrevStudyLevelID = studentAcademic.StudyLevel,
                InsertDate = DateTime.Now,
                InsertEmployeeID = 1,
            };

            var programId = (int)studentAcademic.ProgramID;

            var departmentId = (int)studentAcademic.DepartmentID;
            var planId = studentAcademic.PlanID;
            var maxStudyLevelId = unitOfWork.Academic.Department.Find(departmentId).MaxStudyLevelID;


            if (studentAcademic.IsDelete) return;
            var list = GpaDtos;
            var resultList = list.Where(a => a.AcademicAccreditation);

            #endregion

            #region  GPAUniversity

            var m = resultList.Where(co =>
                co.TransactionID != null && (co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                                             co.CourseStatusID == (int)CourseStatusEnum.Failure))
                //فصل التعليم الالكتروني غير داخل في المعدل
                .Where(co => co.SemesterID != 16);
            if (m.Any())
            {
                var gpaDtosWithoutDuplicate = GpaDtosWithoutDuplicate(m);
                var SumOFHours1 = gpaDtosWithoutDuplicate.Sum(f => f.NumOfHours);
                var SumOfHourMark = gpaDtosWithoutDuplicate.Sum(f => f.NumOfHours * f.TotalMark);
                studentAcademic.GPAUniversity = (Math.Round((decimal)(SumOfHourMark) / ((decimal)SumOFHours1), 2,
                    MidpointRounding.AwayFromZero));
            }
            else
            {
                studentAcademic.GPAUniversity = 0;
            }

            #endregion

            #region GPAGraduate && PlanSucceedHour

            var x = resultList.Where(co =>
                co.TransactionID != null && co.CourseStatusID == (int)CourseStatusEnum.Successful &&
                ((PlanCourses.Any(r => r.ID == co.CourseID)) ||
                 (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))));

            if (x.Any())
            {
                // ساعات نجاح الخطة
                studentAcademic.PlanSucceedHour = GpaDtosWithoutDuplicate(x).Sum(f => f.NumOfHours);

                //فصل التعليم الالكتروني غير داخل في المعدل
                x = x.Where(co => co.SemesterID != 16);

                var gpaDtosWithoutDuplicate = GpaDtosWithoutDuplicate(x);
                // عدد الساعات
                var SumOFHours1 = GpaDtosWithoutDuplicate(x).Sum(f => f.NumOfHours);
                // مجموع العلامات * عدد سعات كل علامة
                var SumOfHourMark = GpaDtosWithoutDuplicate(x).Sum(f => f.NumOfHours * f.TotalMark);
                // معدل الخريج

                //المعدل
                decimal gpaGraduate = 0;

                if (SumOfHourMark > 0)
                {

                    gpaGraduate = (Math.Round((decimal)(SumOfHourMark) / ((decimal)SumOFHours1), 2, MidpointRounding.AwayFromZero));

                }

                studentAcademic.GPAGraduate = gpaGraduate;

            }
            else
            {
                studentAcademic.GPAGraduate = 0;
                studentAcademic.PlanSucceedHour = 0;
            }

            #endregion

            #region StudiedHour

            var y = list.Where(co =>
                co.TransactionID != null && (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                                             co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                                             co.CourseStatusID == (int)CourseStatusEnum.Failure ||
                                             co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister));
            if (y.Any())
            {
                studentAcademic.StudiedHour = y.Sum(d => d.NumOfHours);
            }
            else
            {
                studentAcademic.StudiedHour = 0;
            }

            #endregion

            #region RichnessHour
            var result = list.Where(co => co.TransactionID != null &&
                                    (co.CourseStatusID == (int)CourseStatusEnum.Register || co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister || co.CourseStatusID == (int)CourseStatusEnum.Successful || co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                                    ((!PlanCourses.Any(r => r.ID == co.CourseID) && !co.IsITransCourse))
                                  );

            if (result.Any())

            {
                var sumOfHours = result.Sum(a => a.NumOfHours);
                studentAcademic.RichnessHour = sumOfHours;

            }
            else
            {
                studentAcademic.RichnessHour = 0;

            }
            #endregion

            #region SucceedHour

            var W = resultList.Where(co =>
                co.TransactionID != null && co.CourseStatusID == (int)CourseStatusEnum.Successful);
            if (W.Any())
            {
                studentAcademic.SucceedHour = W.Sum(d => d.NumOfHours);
            }
            else
            {
                studentAcademic.SucceedHour = 0;
            }

            #endregion

            #region StudentETransHour

            var q = list.Where(co => co.Accreditation && co.CourseStatusID == (int)CourseStatusEnum.Transformation);
            var studentETransHour = 0;
            if (q.Any())
            {
                studentETransHour = q.Sum(a => a.NumOfHours);
                var oldHour = q.Sum(d => d.ETransWithCourseHours);
                studentAcademic.OldUniversityTransformationHours = oldHour.Value;
            }
            else
            {

                studentAcademic.OldUniversityTransformationHours = 0;
            }
            studentAcademic.TransformationHours = studentETransHour;


            #endregion

            #region StudyLevelID

            studentAcademic.StudyLevel = unitOfWork.Academic.ProgramLevel.Where(u =>
                    u.HoursFrom <= (studentAcademic.TransformationHours + studentAcademic.PlanSucceedHour) && u.ProgramID == programId &&
                    u.StudyLevelID <= maxStudyLevelId)
                .Max(b => b.StudyLevelID);

            #endregion

            #region GraduationStatusID

            var planHour = PlanCourses.Sum(t => t.NumOfHours);
            if (planHour != 0 && planId != null)
            {
                var GraduationStatusID = (int)GraduationStatusEnum.NotExpectedGraduationStudent;
                var PlanSucceedHour = studentAcademic.PlanSucceedHour;
                var remainHour = planHour - (PlanSucceedHour + studentAcademic.TransformationHours);
                if (remainHour <= 0)
                {
                    GraduationStatusID = (int)GraduationStatusEnum.GraduateStudent;
                }
                else if ((programId == (int)ProgramEnum.Diploma &&
                          remainHour <= (int)GraduationRemainHourEnum.DiplomaHour) ||
                         (programId == (int)ProgramEnum.BA && remainHour <= (int)GraduationRemainHourEnum.BAHour))
                {
                    GraduationStatusID = (int)GraduationStatusEnum.ExpectedGraduationStudent;
                }
                else
                    GraduationStatusID = (int)GraduationStatusEnum.NotExpectedGraduationStudent;

                studentAcademic.GraduationStatusID = GraduationStatusID;
            }

            #endregion

            #region insertStudentAcademicLog

            studentAcademicLog.NewGPAGraduate = studentAcademic.GPAGraduate;
            studentAcademicLog.NewGPAUniversity = studentAcademic.GPAUniversity;
            studentAcademicLog.NewPlanSucceedHour = studentAcademic.PlanSucceedHour;
            studentAcademicLog.NewStudiedHour = studentAcademic.StudiedHour;
            studentAcademicLog.NewSucceedHour = studentAcademic.SucceedHour;
            studentAcademicLog.NewStudyLevelID = studentAcademic.StudyLevel;

            unitOfWork.Academic.StudentAcademicLog.Add(studentAcademicLog);

            #endregion

            Logger.Info(studentAcademicLog);

            if (stdSemesterId.HasValue)
            {
                var stdsemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
                if (stdsemester.SemesterID != 1)
                {

                    CalculateSemesterCumulativeGpa(stdSemesterId.Value, isForGraduate: true);
                    CalculateSemesterGpa(stdSemesterId.Value, isForGraduate: true);
                    CalculateSemesterCumulativeGpa(stdSemesterId.Value, isForGraduate: false);
                    CalculateSemesterGpa(stdSemesterId.Value, isForGraduate: false);
                    CalculateSemesterRegisteredHours(stdSemesterId.Value);
                    CalculateSemesterCumulativeRegisteredHours(stdSemesterId.Value);
                    CalculateSemesterFailedHour(stdSemesterId.Value);
                    CalculatSemesterRichnessHour(stdSemesterId.Value);

                    if (accreditationStatusEnum == AccreditationStatusEnum.Accredit)
                    {
                        _academicWarningService.SetStudentAcademicWarning(stdSemesterId.Value);
                    }
                    else if (accreditationStatusEnum == AccreditationStatusEnum.UnAccredit)
                    {
                        _academicWarningService.RemoveAcademicWarning(stdSemesterId.Value);
                    }
                }
            }

            else
            {

                CalculateSemesterCumulativeGpaChick(studentId, isForGraduate: true);
                CalculateSemesterGpaChick(studentId, isForGraduate: true);
                CalculateSemesterCumulativeGpaChick(studentId, isForGraduate: false);
                CalculateSemesterGpaChick(studentId, isForGraduate: false);
                CalculateSemesterRegisteredHoursChick(studentId);
                CalculateSemesterCumulativeRegisteredHoursChick(studentId);
                CalculatSemesterRichnessHourChick(studentId);
                CalculatSemesterFailedHourChick(studentId);

                if (accreditationStatusEnum == AccreditationStatusEnum.Accredit)
                {
                    _academicWarningService.SetStudentAcademicWarningChick(studentId);
                }
                else if (accreditationStatusEnum == AccreditationStatusEnum.UnAccredit)
                {
                    _academicWarningService.RemoveAcademicWarninChick(studentId);
                }
            }

            studentAcademic.CurrentWarningNo = _academicWarningService.GetStudentAcademicWarningNumber(studentId);

            unitOfWork.Complete();
            // return studentAcademicLog;
        }

        /// <summary>
        /// المعدل الفصلي التراكمي 
        /// </summary>
        /// <param name="stdSemesterId"> فصل الطالب</param>
        /// <param name="isForGraduate"> المعدل الفصلي التركامي خريج ؟ تستثني المواد الراسب بها الطلب</param>
        /// <returns></returns>
        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterCumulativeGpa(int stdSemesterId, bool isForGraduate)
        {

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);

            StudentId = stdSemester.StudentID;
            var resultList = GpaDtos.Where(a => a.AcademicAccreditation).ToList();
            var result = resultList.Where(co => co.TransactionID != null &&
                                                (co.CourseStatusID == (int)CourseStatusEnum.Successful ||


                                                 (co.CourseStatusID == (int)CourseStatusEnum.Failure && !isForGraduate)) &&

                                                ((PlanCourses.Any(r => r.ID == co.CourseID)) || (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))) &&
                                                (co.SemesterID <= stdSemester.SemesterID));


            if (result.Any())
            {



                //ازالة التكرار 
                var resultWithoutDuplicate = GpaDtosWithoutDuplicate(result);

                //مجموع الساعات
                var sumOfHours = resultWithoutDuplicate.Sum(f => f.NumOfHours);

                //update
                stdSemester.SemesterCumulativeHours = (!isForGraduate) ? sumOfHours : stdSemester.SemesterCumulativeHours;
                stdSemester.SemesterCumulativeGraduateHours = (isForGraduate) ? sumOfHours : stdSemester.SemesterCumulativeGraduateHours;


                // عدد الساعات في العلامات 
                var SumOfHourMark = resultWithoutDuplicate.Sum(f => f.NumOfHours * f.TotalMark);


                //فصل التعليم الالكتروني
                if (stdSemester.SemesterID == 16)
                {

                    //حساب المعدل بدون فصل التعليم الالكتروني 
                    sumOfHours = resultWithoutDuplicate.Where(co => co.SemesterID != 16).Sum(f => f.NumOfHours);
                    SumOfHourMark = resultWithoutDuplicate.Where(co => co.SemesterID != 16).Sum(f => f.NumOfHours * f.TotalMark);

                }


                //المعدل
                var gpa = 0.0;

                if (SumOfHourMark > 0)
                {

                    gpa = (Math.Round((double)(SumOfHourMark) / ((double)sumOfHours), 2, MidpointRounding.AwayFromZero));

                }



                stdSemester.SemesterCumulativeGPA = (!isForGraduate) ? gpa : stdSemester.SemesterCumulativeGPA;

                stdSemester.SemesterCumulativeGraduateGPA = (isForGraduate) ? gpa : stdSemester.SemesterCumulativeGraduateGPA;

            }
            else
            {
                stdSemester.SemesterCumulativeGPA = 0;
                stdSemester.SemesterCumulativeHours = 0;
                stdSemester.SemesterCumulativeGraduateGPA = 0;
                stdSemester.SemesterCumulativeGraduateHours = 0;


            }
        }


        /// <summary>
        /// المعدل الفصلي التركامي لجميع فصول الطالب
        /// </summary>
        /// <param name="studentId">الطالب</param>
        /// <param name="isForGraduate">احتساب المعدل الفصلي التراكمي خريج</param>
        /// <returns></returns>
        public async Task CalculateSemesterCumulativeGpaChick(int studentId, bool isForGraduate)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculateSemesterCumulativeGpa(x, isForGraduate); });
        }


        /// <summary>
        /// المعدل الفصلي
        /// </summary>
        /// <param name="stdSemesterId">فصل الطالب</param>
        /// <param name="isForGraduate">المعدل الفصلي خريج؟</param>
        /// <returns></returns>
        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterGpa(int stdSemesterId, bool isForGraduate)
        {
            #region SemesterGPA

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            StudentId = stdSemester.StudentID;
            var resultList = GpaDtos.Where(a => a.AcademicAccreditation);

            var semester16SumOfHours = 0;


            //مدخلات علامات الطالب لكل الفصول
            var list = resultList.Where(co => co.TransactionID != null &&
                                              (co.CourseStatusID == (int)CourseStatusEnum.Successful || (co.CourseStatusID == (int)CourseStatusEnum.Failure && !isForGraduate)) &&
                                              ((PlanCourses.Any(r => r.ID == co.CourseID)) || (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))));


            //فصل التعليم الالكتروني نفس معدل الفصل السابق
            if (stdSemester.SemesterID == 16)
            {
                //اخر فصل مسجل للطالب
                var LastRegisteredStdSemester = unitOfWork.Academic.StdSemester
                    .Where(x => !x.IsDelete)
                    .Where(x => x.SemesterID != 16 && x.SemesterID<16)
                    .Where(x => x.StudentID == stdSemester.StudentID)
                    .Where(x => x.SemesterStatusID == (int)SemesterStatusEnum.Registration)
                    .OrderByDescending(x => x.ID)
                    .FirstOrDefault();


                // عدد ساعات الانجاز  يأخذ من الفصل 16
                semester16SumOfHours = list.Where(co => co.SemesterID == 16).Sum(a => a.NumOfHours);

                if (LastRegisteredStdSemester != null && semester16SumOfHours > 0)
                {
                    stdSemester.SemesterGPA = LastRegisteredStdSemester.SemesterGPA;
                    stdSemester.SemesterGraduateGpa = LastRegisteredStdSemester.SemesterGraduateGpa;
                    stdSemester.SemesterPlanSucceedHour = semester16SumOfHours;
                }
                else
                {
                    stdSemester.SemesterGPA = 0;
                    stdSemester.SemesterGraduateGpa = 0;
                    stdSemester.SemesterPlanSucceedHour = semester16SumOfHours;
                }
            }
            else
            {
                var result = list.Where(co => co.SemesterID == stdSemester.SemesterID);


                if (result.Any())
                {
                    var sumOfHours = result.Sum(a => a.NumOfHours);

                    var semesterGpa = (Math.Round(result.Sum(a => a.NumOfHours * a.TotalMark) / ((double)sumOfHours), 2, MidpointRounding.AwayFromZero));
                    stdSemester.SemesterGPA = (!isForGraduate) ? semesterGpa : stdSemester.SemesterGPA;
                    stdSemester.SemesterGraduateGpa = (isForGraduate) ? semesterGpa : stdSemester.SemesterGraduateGpa;
                    stdSemester.SemesterPlanSucceedHour = (isForGraduate) ? sumOfHours : stdSemester.SemesterPlanSucceedHour;
                }
                else
                {
                    stdSemester.SemesterGPA = 0;
                    stdSemester.SemesterGraduateGpa = 0;
                    stdSemester.SemesterPlanSucceedHour = 0;
                }
            }

            #endregion
        }

        /// <summary>
        /// احتساب المعدل الفصلي لجميع فصول الطالب
        /// </summary>
        /// <param name="studentId">الطالب</param>
        /// <param name="isForGraduate">احتساب المعدل الفصلي خريج؟</param>
        /// <returns></returns>
        public async Task CalculateSemesterGpaChick(int studentId, bool isForGraduate)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculateSemesterGpa(x, isForGraduate); });
        }


        /// <summary>
        /// ساعات الانجاز الفصلية التراكمية
        /// </summary>
        /// <param name="stdSemesterId">فصل الطالب</param>
        /// <returns></returns>
        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterCumulativeRegisteredHours(int stdSemesterId)
        {
            #region SemesterRegestedHour

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            StudentId = stdSemester.StudentID;
            var resultList = GpaDtos;
            var result = resultList.Where(co => co.TransactionID != null &&
                        (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                            co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                            co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                            co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                        ((PlanCourses.Any(r => r.ID == co.CourseID)) || (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))) &&
                       (co.SemesterID <= stdSemester.SemesterID));

            if (result.Any())
            {
                var resultWithoutDuplicate = GpaDtosWithoutDuplicate(result);
                var sumOfHours = resultWithoutDuplicate.Sum(f => f.NumOfHours);
                stdSemester.SemesterCumulativeRegisteredHours = sumOfHours;
            }
            else
            {
                stdSemester.SemesterCumulativeRegisteredHours = 0;
            }



            #endregion
        }


        /// <summary>
        /// ساعات الانجاز الفصلية التراكمية لجميع فصول الطالب
        /// </summary>
        /// <param name="studentId">الطالب</param>
        /// <returns></returns>
        public async Task CalculateSemesterCumulativeRegisteredHoursChick(int studentId)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculateSemesterCumulativeRegisteredHours(x); });
        }



        /// <summary>
        /// ساعات الفصل المسجلة
        /// </summary>
        /// <param name="stdSemesterId"></param>
        /// <returns></returns>
        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterRegisteredHours(int stdSemesterId)
        {
            #region SemesterRegestedHour

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            StudentId = stdSemester.StudentID;
            var result = GpaDtos.Where(co => co.TransactionID != null &&
                    (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                    co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                    co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                    co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                    ((PlanCourses.Any(r => r.ID == co.CourseID)) ||
                    (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))
                    ) && (co.SemesterID == stdSemester.SemesterID));

            if (result.Any())

            {
                var sumOfHours = result.Sum(a => a.NumOfHours);
                stdSemester.SemesterRegisteredHours = sumOfHours;
            }
            else
            {
                stdSemester.SemesterRegisteredHours = 0;
            }


            #endregion
        }



        /// <summary>
        /// الساعات الفصلية المسجلة لجميع فصول الطال
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task CalculateSemesterRegisteredHoursChick(int studentId)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculateSemesterRegisteredHours(x); });
        }


        /// <summary>
        /// عدد الساعات الاثرائية الفصلية
        /// </summary>
        /// <param name="stdSemesterId"></param>
        /// <returns></returns>
        public async Task CalculatSemesterRichnessHour(int stdSemesterId)
        {
            #region SemesterRichnessHour

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            StudentId = stdSemester.StudentID;
            var result = GpaDtos.Where(co => co.TransactionID != null &&
                    (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                    co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                    co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                    co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                    (!co.IsITransCourse && !PlanCourses.Any(r => r.ID == co.CourseID)
                    ) && (co.SemesterID == stdSemester.SemesterID));

            if (result.Any())

            {
                var sumOfHours = result.Sum(a => a.NumOfHours);
                stdSemester.SemesterRichnessHour = sumOfHours;
            }
            else
            {
                stdSemester.SemesterRichnessHour = 0;
            }


            #endregion
        }


        /// <summary>
        /// عدد الساعات الاثرائية الفصلية لجميع فصول الطالب
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task CalculatSemesterRichnessHourChick(int studentId)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculatSemesterRichnessHour(x); });
        }

        /// <summary>
        /// عدد ساعات الرسوب الفصلية
        /// </summary>
        /// <param name="stdSemesterId"></param>
        /// <returns></returns>
        public async Task CalculateSemesterFailedHour(int stdSemesterId)
        {
            #region SemesterFailedHour

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            StudentId = stdSemester.StudentID;
            var resultList = GpaDtos.Where(a => a.AcademicAccreditation);
            var result = resultList.Where(co => co.TransactionID != null &&
                 (co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                 ((PlanCourses.Any(r => r.ID == co.CourseID)) || (co.IsITransCourse && PlanCourses.Any(r => r.ID == co.ITransWithCourseID))) &&
                 (co.SemesterID == stdSemester.SemesterID));

            if (result.Any())

            {
                var sumOfHours = result.Sum(a => a.NumOfHours);
                stdSemester.SemesterFailedHour = sumOfHours;


            }
            else
            {
                stdSemester.SemesterFailedHour = 0;
            }


            #endregion
        }

        /// <summary>
        /// عدد ساعات الرسوب الفصلية لجميع فصول الطالب
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task CalculatSemesterFailedHourChick(int studentId)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { CalculateSemesterFailedHour(x); });
        }


        /// <summary>
        /// حالة تخرج الطالب
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task UpdateGraduationStatusID(int studentId)

        {
            StudentId = studentId;
            var q = GpaDtos.Where(co => co.Accreditation && co.CourseStatusID == (int)CourseStatusEnum.Transformation);
            var studentETransHour = 0;
            if (q.Any())
            {
                studentETransHour = q.Sum(a => a.NumOfHours);
            }
            else
            {
                studentETransHour = 0;
            }

            var studentAcademic = await unitOfWork.Academic.StudentAcademic.FindAsync(studentId);
            var programId = (int)studentAcademic.ProgramID;
            var planHour = PlanCourses.Sum(t => t.NumOfHours);
            var planId = studentAcademic.PlanID;
            if (planHour != 0 && planId != null)
            {
                var GraduationStatusID = (int)GraduationStatusEnum.NotExpectedGraduationStudent;
                var PlanSucceedHour = studentAcademic.PlanSucceedHour;
                var remainHour = planHour - (PlanSucceedHour + studentETransHour);
                if (remainHour <= 0)
                {
                    GraduationStatusID = (int)GraduationStatusEnum.GraduateStudent;
                }
                else if ((programId == (int)ProgramEnum.Diploma &&
                          remainHour <= (int)GraduationRemainHourEnum.DiplomaHour) ||
                         (programId == (int)ProgramEnum.BA && remainHour <= (int)GraduationRemainHourEnum.BAHour))
                {
                    GraduationStatusID = (int)GraduationStatusEnum.ExpectedGraduationStudent;
                }
                else
                    GraduationStatusID = (int)GraduationStatusEnum.NotExpectedGraduationStudent;

                studentAcademic.GraduationStatusID = GraduationStatusID;
            }

        }


        /// <summary>
        /// عدد الساعات الاثرائية
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task CalculatStudentRichnessHours(int studentId)
        {


            #region RichnessHour
            StudentId = studentId;
            var studentAcademic = await unitOfWork.Academic.StudentAcademic.FindAsync(studentId);
            var list = GpaDtos;
            var result = list.Where(co => co.TransactionID != null &&
                                    (co.CourseStatusID == (int)CourseStatusEnum.Register || co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister || co.CourseStatusID == (int)CourseStatusEnum.Successful || co.CourseStatusID == (int)CourseStatusEnum.Failure) &&
                                    ((!PlanCourses.Any(r => r.ID == co.CourseID) && !co.IsITransCourse))
                                  ).ToList();

            if (result.Any())

            {
                var sumOfHours = result.Sum(a => a.NumOfHours);
                studentAcademic.RichnessHour = sumOfHours;

            }
            else
            {
                studentAcademic.RichnessHour = 0;

            }
            #endregion

        }


        /// <summary>
        /// عدد ساعات دراسة الطالب
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public async Task CalculatStudentStudiedHour(int studentId)
        {

            #region StudiedHour
            StudentId = studentId;
            var studentAcademic = await unitOfWork.Academic.StudentAcademic.FindAsync(studentId);
            var y = GpaDtos.Where(co =>
                co.TransactionID != null && (co.CourseStatusID == (int)CourseStatusEnum.Register ||
                co.CourseStatusID == (int)CourseStatusEnum.Successful ||
                co.CourseStatusID == (int)CourseStatusEnum.Failure ||
                co.CourseStatusID == (int)CourseStatusEnum.OfficeRegister));
            if (y.Any())
            {
                studentAcademic.StudiedHour = y.Sum(d => d.NumOfHours);
            }
            else
            {
                studentAcademic.StudiedHour = 0;
            }
            #endregion

        }


        public async Task AllCalculatOfStdSemester(int stdSemesterId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {
            var stdsemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            var student = stdsemester.StudentAcademic;


            if (!IsReg)
            {
                _academicWarningService.DeleteAcademicWarning(stdSemesterId);
            }

            CalculateSemesterGpa(stdSemesterId, false);
            CalculateSemesterGpa(stdSemesterId, true);
            CalculateSemesterCumulativeGpa(stdSemesterId, false);
            CalculateSemesterCumulativeGpa(stdSemesterId, true);
            CalculateSemesterRegisteredHours(stdSemesterId);
            CalculateSemesterCumulativeRegisteredHours(stdSemesterId);
            CalculatStudentRichnessHours(stdsemester.StudentID);
            CalculatStudentStudiedHour(stdsemester.StudentID);
            CalculatSemesterRichnessHour(stdsemester.StudentID);

            if (!IsReg)
            {

                if (accreditationStatusEnum == AccreditationStatusEnum.Accredit)
                {
                    _academicWarningService.SetStudentAcademicWarning(stdSemesterId);

                }
                else if (accreditationStatusEnum == AccreditationStatusEnum.UnAccredit)
                {
                    _academicWarningService.RemoveAcademicWarning(stdSemesterId);

                }
                student.CurrentWarningNo = _academicWarningService.GetStudentAcademicWarningNumber(student.StudentID);

            }

        }


        public async Task AllCalculatOfStdSemesterChick(int studentId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {
            StudentId = studentId;

            StdSemesters.ForEach(x => { AllCalculatOfStdSemester(x, IsReg, accreditationStatusEnum); });

        }
        public List<StdSemesterDto> GetStudentStdSemesterGpaDetails(int studentId, out decimal gpaGraduate, out decimal gpaUniversity)
        {
            var StudentAcademic = unitOfWork.Academic.StudentAcademic.Find(studentId);

            gpaGraduate = StudentAcademic.GPAGraduate;
            gpaUniversity = StudentAcademic.GPAUniversity;

            var result = StudentAcademic.StdSemester.OrderByDescending(x => x.Semester.ID)
                .Clean()
                .Select(x => new StdSemesterDto
                {
                    StdSemesterId = x.ID,
                    SemesterArShortName = x.Semester.ArShortName,
                    SemesterGPA = x.SemesterGPA,
                    SemesterCumulativeGPA = x.SemesterCumulativeGPA,
                    SemesterRegestedHour = x.SemesterRegisteredHours,
                    SemesterCumulativeHours = x.SemesterCumulativeHours,
                    SemesterGraduateGpa = x.SemesterGraduateGpa
                })
                .ToList();

            return result;
        }

        public List<GpaDto> GetGpaData(int studentId)
        {
            StudentId = studentId;
            var student = unitOfWork.Academic.StudentAcademic.Find(StudentId);
            int planeSumOfHourse = PlanCourses.Sum(x => x.NumOfHours);
            var data = student.StdSection.Clean()
                .Where(a => a.Mark.Any(ma => !ma.IsDelete && !ma.HasEdit))
                .Select(co => new GpaDto
                {
                    stdSectionID = co.ID,
                    StdSemesterID = co.StdSemesterID,
                    TransactionID = co.TransactionID,
                    CourseStatusID = co.CourseStatusID,
                    CourseID = co.CourseID,
                    IsITransCourse = co.IsITransCourse,
                    ITransWithCourseID = co.ITransWithCourseID,
                    Accreditation = co.Accreditation,
                    TotalMark = co.Mark.FirstOrDefault(ma => !ma.IsDelete && !ma.HasEdit).TotalMark,
                    AcademicAccreditation =
                    co.Mark.FirstOrDefault(ma => !ma.IsDelete && !ma.HasEdit).AcademicAccreditation,
                    NumOfHours = co.IsITransCourse ? co.Course1.NumOfHours : co.Course.NumOfHours,
                    MainNumOfHours = co.Course.NumOfHours,
                    ETransWithCourseName = co.ETransWithCourseName,
                    ETransWithCourseHours = co.ETransWithCourseHours,
                    SemesterTypeID = co.StdSemester.Semester.SemesterTypeID,
                    SemesterIsDelete = co.StdSemester.Semester.IsDelete,
                    StdSemesterIsDelete = co.StdSemester.IsDelete,
                    SemesterID = co.StdSemester.SemesterID,

                    SemesterStatusID = co.StdSemester.SemesterStatusID,
                    SemesterGPA = co.StdSemester.SemesterGPA,
                    SemesterCumulativeGPA = co.StdSemester.SemesterCumulativeGPA,
                    SemesterCumulativeHours = co.StdSemester.SemesterCumulativeHours,
                    PlaneSumOfHourse = planeSumOfHourse,
                    FilterdCourseID = co.IsITransCourse ? co.ITransWithCourseID : co.CourseID
                })
                .ToList();

            return data;
        }




        public IQueryable<Course> GetStudentPlaneCourses(int studentId)
        {
            var student = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var planId = student.PlanID;
            var planCourses = unitOfWork.Academic.PlanCourse.Clean()
                .Where(x => x.PlanID == planId)
                .Select(x => x.Course)
                .Clean();




            return planCourses;



        }

        private IEnumerable<GpaDto> GpaDtosWithoutDuplicate(IEnumerable<GpaDto> GpaDtos)
        {
            return GpaDtos.GroupBy(w => w.FilterdCourseID)
                .Select(a => a.First(c => c.TotalMark == a.Max(f => f.TotalMark)));
        }

        #endregion

    }
}

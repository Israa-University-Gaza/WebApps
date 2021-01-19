using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Hangfire;
using IsraaSystem.Application.Academic.BackgroundJobManger;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Academic.CourseManger;
using IsraaSystem.Application.Academic.LectureManger;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.OfferdcourseManger;
using IsraaSystem.Application.Academic.SectionDepartmentManger;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Academic.StdSemesterManger;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.Sql.Financial;
using log4net;

namespace IsraaSystem.Application.Academic.Registration
{


    public interface IRegisterSectionService : IIsraaService
    {
        List<CheckResult> RegisterSection(int stdSemesterId, int sectionId, int? rEmployeeId = null, int? rStudentId = null);
        List<CheckResult> RegisterCourse(int studentId, int sectionId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? rEmployeeId = null, int? rStudentId = null);
    }


    public class RegisterSectionService : IsraaService, IRegisterSectionService
    {
        private readonly ISemesterCalendarService _semesterCalendarService;
        private readonly ICheckResultService _checkResultService;
        private readonly ISectionService _sectionService;
        private readonly ISectionDepartmentService _sectionDepartmentService;
        private readonly IOfferdcourseService _offerdcourseService;
        private readonly ITransactionService _TransactionService;
        private readonly ICourseService _CourseService;
        private readonly IStudentFinancialService _studentFinancialService;
        private readonly IStudentService _StudentService;
        private readonly IRegisterSemesterService _registerSemesterService;
        private readonly IInstallmentService _installmentService;
        private readonly IStdSemesterService _stdSemesterService;
        private readonly ICalculationManager _calculationManager;
        private readonly ILectureService _lectureService;
        private readonly IBackgroundJobService _backgroundJobService;
        public RegisterSectionService(IUnitOfWork unitOfWork, ILog logger, ISemesterCalendarService semesterCalendarService, ICheckResultService checkResultService, ISectionService sectionService, ISectionDepartmentService sectionDepartmentService, IOfferdcourseService offerdcourseService, ITransactionService transactionService, ICourseService courseServic, IStudentService studentService, IStudentFinancialService studentFinancialService, IRegisterSemesterService registerSemesterService, IInstallmentService installmentService, IStdSemesterService stdSemesterService, ICalculationManager calculationManager, ILectureService lectureService, IBackgroundJobService backgroundJobService) : base(unitOfWork, logger)
        {
            _semesterCalendarService = semesterCalendarService;
            _checkResultService = checkResultService;
            _sectionService = sectionService;
            _offerdcourseService = offerdcourseService;
            _TransactionService = transactionService;
            _CourseService = courseServic;
            _StudentService = studentService;
            _studentFinancialService = studentFinancialService;
            _registerSemesterService = registerSemesterService;
            _installmentService = installmentService;
            _stdSemesterService = stdSemesterService;
            _calculationManager = calculationManager;
            _lectureService = lectureService;
            _backgroundJobService = backgroundJobService;
        }


        public List<CheckResult> RegisterSection(int stdSemesterId, int sectionId, int? rEmployeeId = null, int? rStudentId = null)
        {

            #region var
            var result = _checkResultService.GetResult();
            var section = unitOfWork.Academic.Section.Find(sectionId);
            var sectionTypeId = _sectionService.GetSectionType(sectionId);

            var offerdCoursetype = _offerdcourseService.GetOfferdcourseType(section.OfferdCourseID);

            var course = section.OfferdCourse.Course;
            var courseId = course.ID;
            var courseFID = course.CourseFID != null ? course.CourseFID : course.ID;
            var courseNumOfHours = course.NumOfHours;

            var stdSemester = unitOfWork.Academic.StdSemester.Find(stdSemesterId);
            var student = stdSemester.StudentAcademic;
            var studentId = student.StudentID;
            var departmentId = student.DepartmentID.Value;
            var studyLevelId = student.StudyLevel;
            var genderId = student.StudentPersonal.Gender;
            var hourCost = student.Department.HourCost;

            var studentStdSection = student.StdSection.Clean().FirstOrDefault(x => x.StdSemesterID == stdSemesterId && x.CourseID == courseId && x.Section.SectionType == sectionTypeId && (x.CourseStatusID == (int)CourseStatusEnum.Register || x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister));
            int currentSectionId = 0;
            var studentMark = studentStdSection?.Mark;

            var semsterId = (SemestersEnum)stdSemester.SemesterID;

            var activeScholarship = _studentFinancialService.GetActiveStudentSemesterScholarship(studentId, semsterId);
            var amount = (courseNumOfHours * hourCost);
            var actionId = activeScholarship.ActionID;
            var actionValue = activeScholarship.Action.Value;
            var scholarshipValue = (float)actionValue / 100;
            var scholarshipAmount = (decimal)(amount * scholarshipValue);

            var studentBalance = _studentFinancialService.GetStudentBalance(studentId);
            var installment = _installmentService.GetAllStudentSemesterInstallment(studentId, semsterId);


            var stdSemesterRegisteredHours = _stdSemesterService.GetStdSemesterRegisteredHours(stdSemesterId, true);
            var studentAvalibleRegistedHour = _StudentService.GetStudentAvalibleRegistedHour(studentId);
            #endregion
            var IsAcademicallyWarning = _StudentService.IsStudentAcademicallyWarning(studentId);
            var plancourse = _calculationManager.GetStudentPlaneCourses(studentId);

            #region chicks
            if ((_semesterCalendarService.IsEndRegester(semsterId)))
            {
                _checkResultService.AddResult(0, "لقد إنتهي موعد التسجيل الفصلي", null);

            }

            if (student.CurrentStatusID != (int)StudentStatusEnum.Regular)
            {
                _checkResultService.AddResult(0, "لا يمكنك التسجيل لأن الطالب غير منتظم");
            }

            if ((studentBalance * -1) < (amount - scholarshipAmount - 1) && !installment.Any() && sectionTypeId == 1)
            {

                _checkResultService.AddResult(0, "رصيد الطالب غير كافي , الرجاء تسديد الرسوم لإستكمال التسجيل");
            }

            if (!_CourseService.IsCoursepreRequestStudied(courseId, studentId))
            {

                var PrerequestCourse = _CourseService.GetCoursePreRequestCourses(courseId).FirstOrDefault();
                _checkResultService.AddResult(0, "لا يمكنك التسجيل لوجود متطلب سابق للمساق" + "  " + PrerequestCourse.Course.CourseCode + "  " + PrerequestCourse.Course.ArName);

            }

            if (stdSemesterRegisteredHours + courseNumOfHours > studentAvalibleRegistedHour)

            {
                var msgresult = student.GraduationStatusID == (int)GraduationStatusEnum.NotExpectedGraduationStudent ? "لقد تجاوزت الحد المسموح لتسجيل طالب غير خريج بواقع" : "لقد تجاوزت الحد المسموح لتسجيل طالب خريج او متوقع تخرجه بواقع";
                _checkResultService.AddResult(0, msgresult + " " + studentAvalibleRegistedHour + " ساعة");
            }


            if (IsAcademicallyWarning)
            {
                _checkResultService.AddResult(0, "لا يمكنك التسجيل لانك طالب محذر أكاديميا بالرجاء مراجعة عميد الكلية");

            }


            if (!plancourse.Any(x => x.ID == courseId))
            {
                _checkResultService.AddResult(0, "لا يمكنك تسجيل هذا المساق لعدم وجوده في خطة الطالب");

            }

            var studentCourseStdsections = _CourseService.GetStudentCourseStdsections(courseId, studentId);
            if (studentCourseStdsections.Any(x => x.StdSemesterID != stdSemesterId && (x.CourseStatusID == (int)CourseStatusEnum.Register || x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister)))
            {

                _checkResultService.AddResult(0, "لا يمكنك تسجيل هذا المساق فهو مسجل في فصل سابق");
            }

            if (studentCourseStdsections.Any(x => x.CourseStatusID == (int)CourseStatusEnum.Transformation))
            {

                _checkResultService.AddResult(0, "لا يمكنك تسجيل هذا المساق فقد تمت له معادلة خارجية مسبقاً");
            }

            var successfulCount = studentCourseStdsections.Count(x => x.CourseStatusID == (int)CourseStatusEnum.Successful && x.CourseID == courseId && !x.IsITransCourse);
            var ItransCount = studentCourseStdsections.Count(x => x.CourseStatusID == (int)CourseStatusEnum.Successful && x.ITransWithCourseID == courseId && x.IsITransCourse);
            if (successfulCount + ItransCount > 2)
            {

                _checkResultService.AddResult(0, "لا يمكنك تسجيل هذا المساق فقد تم دراسته  " + successfulCount + "مرة" + " ومعادلته" + ItransCount + " مرة ");
            }

            if (section.StudentCount == section.Capacity)
            {
                _checkResultService.AddResult(0, "لم يتم تسجيل الشعبة لإكتمال عدد الطلاب في الشعبة");

            }

            if (studentCourseStdsections.Any(x => x.StdSemesterID == stdSemesterId && (x.CourseStatusID == (int)CourseStatusEnum.Register || x.CourseStatusID == (int)CourseStatusEnum.OfficeRegister) && x.SectionID == sectionId))
            {
                _checkResultService.AddResult(0, "الشعبة مسجلة بالفعل خلال الفصل الحالي");
            }



            if (!_sectionService.GetSectionSectionDepartments(sectionId, student.DepartmentID).Any())
            {
                _checkResultService.AddResult(0, "الشعبة غير متاحة للقسم الدراسي للطالب");
            }

            if (!_sectionService.GetSectionSectionDepartments(sectionId, null, student.StudyLevel).Any())
            {
                _checkResultService.AddResult(0, "الشعبة غير متاحة للمستوى الدراسي للطالب");
            }

            if (!_sectionService.GetSectionSectionDepartments(sectionId, null, null, student.StudentPersonal.Gender).Any())
            {
                _checkResultService.AddResult(0, "الشعبة غير متاحة لجندر الطالب");
            }

            var ConflictLecture = _lectureService.GetStdSemesterSectionConflictLecture(sectionId, stdSemesterId);


            if (ConflictLecture.Any())
            {

                ConflictLecture.ForEach(x =>
                {

                    var t = new
                    {
                        courseName = x.Section.OfferdCourse.Course.ArName,
                        lectureDay = (Enum.GetName(typeof(DayOfWeek), x.CDayID.ReverseIsraaCDayID())),
                        lectureRoom = x.Room.RoomNum,
                        lectureFromToHour = x.FromHour + " _ " + x.ToHour
                    };

                    _checkResultService.AddResult(0, "تعارض  في مواعيد المحاضرات مع مساق" + " " + t.courseName + " " + " في يوم " + " " + t.lectureDay + " " + " في قاعة " + t.lectureRoom + " " + "بتوقيت" + t.lectureFromToHour);



                });


            }



            var faildCount = _checkResultService.CheckResultList.Where(s => s != null && s.Status == 0).Count();
            #endregion
            if (faildCount == 0)// to do test chech result status

            {
                #region excuteProcess
                //add
                if (studentStdSection == null)

                {
                    var stdSection = new StdSection
                    {
                        StudentID = studentId,
                        SectionID = sectionId,
                        StdSemesterID = stdSemesterId,
                        CourseID = courseId,
                        CourseHours = courseNumOfHours,
                        CourseStatusID = offerdCoursetype == 2 ? (int)CourseStatusEnum.OfficeRegister : (int)CourseStatusEnum.Register,
                        TransWith = courseFID,
                        RegisterEmployeeID = rEmployeeId,
                        RegisterStudentID = rStudentId,
                        RegistrationDate = DateTime.Now

                    };

                    student.StdSection.Add(stdSection);

                    if (sectionTypeId == 1)
                    {

                        stdSection.Mark.Add(new Mark());

                        int? id;
                        _TransactionService.TransactionAdd(out id, studentId, amount, 3, semsterId, insertEmployeeId: rEmployeeId, insertStudentId: rStudentId);
                        stdSection.TransactionID = id;
                        var isWithdrawCourse = _CourseService.GetStudentCourseStdsections(courseId, studentId).Any(x => x.CourseStatusID == (int)CourseStatusEnum.Withdraw);
                        if (activeScholarship != null && course.IsScholarship && !isWithdrawCourse)
                        {
                            _TransactionService.TransactionAdd(out id, studentId, scholarshipAmount, actionId, semsterId, quantity: scholarshipValue, insertEmployeeId: rEmployeeId, insertStudentId: rStudentId);
                            stdSection.ScholarshipID = id;

                        }

                    }


                    _checkResultService.AddResult(1, "تم تسجيل الشعبة بنجاح");

                }



                else
                {
                    currentSectionId = studentStdSection.SectionID.Value;

                    studentStdSection.SectionID = sectionId;
                    studentStdSection.CourseStatusID = offerdCoursetype == 2 ? (int)CourseStatusEnum.OfficeRegister : (int)CourseStatusEnum.Register;
                    studentMark.Clean().FirstOrDefault().SectionID = sectionId;
                    _checkResultService.AddResult(1, "تم تغيير الشعبة بنجاح");
                }

                unitOfWork.Complete();
                if (currentSectionId != 0)
                {
                    BackgroundJob.Enqueue<BackgroundJobService>(f => f.UpdateSectionStudentCount(currentSectionId));
                    BackgroundJob.Enqueue<BackgroundJobService>(f => f.UpdateSectionDepartmentStudentCount(currentSectionId, departmentId, studyLevelId, genderId));
                }

                BackgroundJob.Enqueue<BackgroundJobService>(f => f.UpdateSectionStudentCount(sectionId));
                BackgroundJob.Enqueue<BackgroundJobService>(f => f.UpdateSectionDepartmentStudentCount(sectionId, departmentId, studyLevelId, genderId));
            }

            #endregion

            return result;
        }


        public List<CheckResult> RegisterCourse(int studentId, int sectionId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? rEmployeeId = null, int? rStudentId = null)
        {

            int? id;

            _registerSemesterService.RegisterSemester(out id, studentId, semestersEnum, rEmployeeId);
            _TransactionService.SemesterServiceFeesAdd(studentId, rEmployeeId.Value, semestersEnum);
            var result = RegisterSection(id.Value, sectionId, rEmployeeId, rStudentId);
            _calculationManager.AllCalculatOfStdSemester(id.Value, true, AccreditationStatusEnum.Accredit);
            unitOfWork.Complete();
            BackgroundJob.Enqueue<BackgroundJobService>(f => f.CalculateBalance(studentId));
            DataTable Dt = TransactionDA.CalculateStudentInstallmentPaid(studentId);
            return result;

        }

    }



}





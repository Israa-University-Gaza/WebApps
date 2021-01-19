using System;
using System.Collections.Generic;
using System.Linq;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.Registration
{


    public interface IRegisterSemesterService : IIsraaService
    {
        void RegisterSemester(out int? id, int studentId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? employeeId = null);
    }


    public class RegisterSemesterService : IsraaService, IRegisterSemesterService
    {
        private readonly ISemesterCalendarService _semesterCalendarService;
        private readonly ICheckResultService _checkResultService;

        public RegisterSemesterService(IUnitOfWork unitOfWork, ILog logger, ISemesterCalendarService semesterCalendarService, ICheckResultService checkResultService) : base(unitOfWork, logger)
        {
            _semesterCalendarService = semesterCalendarService;
            _checkResultService = checkResultService;

        }

        public void RegisterSemester(out int? stdSemesterId, int studentId, SemestersEnum semestersEnum = SemestersEnum.RegitrationSemester, int? employeeId = null)
        {

            var registerBeginning = _semesterCalendarService.GetSemesterRegisterBeginning(SemestersEnum.RegitrationSemester).Date;
            var registerEnd = _semesterCalendarService.GetSemesterRegisterEnd(SemestersEnum.RegitrationSemester).Date;
            stdSemesterId = null;
            if (DateTime.Now.Date < registerBeginning || DateTime.Now.Date > registerEnd)
            {
                _checkResultService.AddResult(0, "لقد إنتهي موعد التسجيل الفصلي");
                return;
            }

            var studentAcademic = unitOfWork.Academic.StudentAcademic.Find(studentId);
            var studentStdSemsetr = studentAcademic.StdSemester.Clean().FirstOrDefault(x => x.SemesterID == (int)semestersEnum);

            if (studentStdSemsetr != null)
            {
                _checkResultService.AddResult(0, "تم تسجيل الفصل الدراسي مسبقاً");
                return;
            }

            var stdSemester = new StdSemester
            {
                SemesterID = (int)semestersEnum,
                SemesterStatusID = (int)SemesterStatusEnum.Registration,
                RegistrationDate = DateTime.Now,
                RegisterStudentID = studentId,
                RegisterEmployeeID = employeeId
            };

            studentAcademic.StdSemester.Add(stdSemester);
            _checkResultService.AddResult(1, "تم تسجيل الفصل الدراسي بنجاح", stdSemester.ID);
            stdSemesterId = stdSemester.ID;

        }

    }

}






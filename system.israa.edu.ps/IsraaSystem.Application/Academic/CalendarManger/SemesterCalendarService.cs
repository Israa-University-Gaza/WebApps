using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;

namespace IsraaSystem.Application.Academic.CalendarManger
{
    public interface ISemesterCalendarService : IIsraaService
    {
        DateTime GetSemesterRegisterEnd(SemestersEnum semestersEnum);
        DateTime GetSemesterRegisterBeginning(SemestersEnum semestersEnum);
        bool IsEndRegester(SemestersEnum semestersEnum);
        bool IsRegisterBeginning(SemestersEnum semestersEnum);
    }


    public class SemesterCalendarService : IsraaService, ISemesterCalendarService
    {


        public SemesterCalendarService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public DateTime GetSemesterRegisterEnd(SemestersEnum semestersEnum)
        {
            var id = (int)semestersEnum;
            var RegisterEnd = unitOfWork.Academic.Semester.Clean().First(x => x.ID == id).RegisterEnd;
            return RegisterEnd;
        }


        public DateTime GetSemesterRegisterBeginning(SemestersEnum semestersEnum)
        {
            var id = (int)semestersEnum;
            var RegisterBeginning = unitOfWork.Academic.Semester.Clean().First(x => x.ID == id).RegisterBeginning;
            return RegisterBeginning;
        }


        public bool IsEndRegester(SemestersEnum semestersEnum)
        {
            var getDate = DateTime.Now.Date;
            var registerEnd = GetSemesterRegisterEnd(semestersEnum).Date;
            bool isEnd = getDate > registerEnd ? true : false;

            return isEnd;
        }

        public bool IsRegisterBeginning(SemestersEnum semestersEnum)
        {
            var getDate = DateTime.Now.Date;
            var registerBegin = GetSemesterRegisterBeginning(semestersEnum).Date;
            bool isBegin = getDate < registerBegin ? true : false;
            return isBegin;
        }
    }







}
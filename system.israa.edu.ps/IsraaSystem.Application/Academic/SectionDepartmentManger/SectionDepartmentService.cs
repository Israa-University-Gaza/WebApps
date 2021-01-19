using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using IsraaSystem.Application.Academic.CalendarManger;
using IsraaSystem.Application.Academic.ExamManager.ObserverService;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.DtoBase;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;

namespace IsraaSystem.Application.Academic.SectionDepartmentManger
{


    public interface ISectionDepartmentService : IIsraaService
    {

        void UpdateSectionDepartmentStudentCount(int sectionId, int departmentId, int studyLevelId, int genderId);
    }


    public class SectionDepartmentService : IsraaService, ISectionDepartmentService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly ISectionService _sectionService;

        public SectionDepartmentService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService, ISectionService sectionService) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;
            _sectionService = sectionService;
        }


        public void UpdateSectionDepartmentStudentCount(int sectionId, int departmentId, int studyLevelId, int genderId)

        {
            var sectionDepartment = unitOfWork.Academic.Section.Find(sectionId).SectionDepartment.Clean().FirstOrDefault(x => x.DepartmentID == departmentId && x.StudyLevelID == studyLevelId && x.GenderID == genderId);
            var studentCount = _sectionService.GetSectionRegularStdSection(sectionId,departmentId, studyLevelId, genderId).Count();
            if (sectionDepartment != null)
                sectionDepartment.StudentCount = studentCount;
        }






    }

}






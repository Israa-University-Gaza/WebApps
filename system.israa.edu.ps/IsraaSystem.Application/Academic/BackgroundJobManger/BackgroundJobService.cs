using System.Threading.Tasks;
using Hangfire;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.PlanManger;
using IsraaSystem.Application.Academic.SectionDepartmentManger;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using log4net;

namespace IsraaSystem.Application.Academic.BackgroundJobManger
{


    public interface IBackgroundJobService : IIsraaService
    {

        Task CalculateSemesterCumulativeGpa(int stdSemesterId, bool isForGraduate);



        Task CalculateSemesterCumulativeGpaChick(int studentid, bool isForGraduate);


        Task CalculateSemesterGpaChick(int studentid, bool isForGraduate);

        Task CalculateSemesterGpa(int stdSemesterId, bool isForGraduate);

        Task CalculateSemesterCumulativeRegisteredHours(int stdSemesterId);
        Task CalculatSemesterRegisteredHours(int stdSemesterId);

        Task CalculateSemesterCumulativeRegisteredHoursChick(int stdSemesterId);
        Task CalculateSemesterRegisteredHoursChick(int stdSemesterId);
        Task CalculatStudentRichnessHours(int studentId);
        Task CalculatStudentStudiedHour(int studentId);
        Task UpdateGraduationStatusID(int studentId);
        Task AllCalculatOfStdSemester(int stdSemesterId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum);
        Task AllCalculatOfStdSemesterChick(int studentId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum);

        Task CalculatSemesterRichnessHour(int stdSemesterId);
        Task CalculatSemesterRichnessHourChick(int studentId);
        Task CalculateSemesterFailedHour(int stdSemesterId);

        Task CalculatSemesterFailedHourChick(int studentId);
        void UpdateSectionStudentCount(int sectionId);

        decimal CalculateBalance(int studentid);
        void RefreshPlanSumofHours(int planId);
        //void RefreshStudentAcademicTransformationHour(int studentId);
        //void RefreshStudentAcademicOldUniversityTransformationHours(int studentId);

    }





    public class BackgroundJobService : IsraaService, IBackgroundJobService
    {

        private readonly ICalculationManager _gpaService;

        private readonly IAcademicWarningService _academicWarningService;
        private readonly ISectionService _sectionService;

        private readonly ISectionDepartmentService _sectionDepartmentService;
        private readonly IStudentFinancialService _StudentFinancialService;

        private readonly IPlanService _planService;

        //private readonly ITransformationService _transformationService;

        public BackgroundJobService(IUnitOfWork unitOfWork, ILog logger, IAcademicWarningService academicWarningService, ICalculationManager gpaService, ISectionService sectionService, ISectionDepartmentService sectionDepartmentService, IStudentFinancialService StudentFinancialService, IPlanService planService) : base(unitOfWork, logger)
        {
            _gpaService = gpaService;
            _academicWarningService = academicWarningService;
            _sectionService = sectionService;
            _sectionDepartmentService = sectionDepartmentService;
            _StudentFinancialService = StudentFinancialService;
            _planService = planService;
            //_transformationService = transformationService;
        }


        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterCumulativeGpa(int stdSemesterId, bool isForGraduate)
        {

            _gpaService.CalculateSemesterCumulativeGpa(stdSemesterId, isForGraduate);

            unitOfWork.Complete();

        }


        public async Task CalculateSemesterCumulativeGpaChick(int studentId, bool isForGraduate)
        {
            _gpaService.CalculateSemesterCumulativeGpaChick(studentId, isForGraduate);
            unitOfWork.Complete();
        }




        [AutomaticRetry(Attempts = 0)]
        public async Task CalculateSemesterGpa(int stdSemesterId, bool isForGraduate)
        {
            _gpaService.CalculateSemesterGpa(stdSemesterId, isForGraduate);
            unitOfWork.Complete();
        }


        public async Task CalculateSemesterGpaChick(int studentId, bool isForGraduate)
        {

            _gpaService.CalculateSemesterGpaChick(studentId, isForGraduate);
            unitOfWork.Complete();


        }

        [AutomaticRetry(Attempts = 0)]
        public async Task CalculatSemesterRegisteredHours(int stdSemesterId)
        {
            _gpaService.CalculateSemesterRegisteredHours(stdSemesterId);
            unitOfWork.Complete();

        }

        public async Task CalculateSemesterRegisteredHoursChick(int studentId)
        {

            _gpaService.CalculateSemesterRegisteredHoursChick(studentId);
            unitOfWork.Complete();

        }



        public async Task CalculateSemesterCumulativeRegisteredHours(int stdsemsterId)
        {

            _gpaService.CalculateSemesterCumulativeRegisteredHours(stdsemsterId);
            unitOfWork.Complete();

        }

        public async Task CalculateSemesterCumulativeRegisteredHoursChick(int studentId)
        {

            _gpaService.CalculateSemesterCumulativeRegisteredHoursChick(studentId);
            unitOfWork.Complete();

        }
        [AutomaticRetry(Attempts = 0)]
        public async Task CalculatStudentRichnessHours(int studentId)
        {


            #region RichnessHour
            await _gpaService.CalculatStudentRichnessHours(studentId);
            #endregion
            unitOfWork.Complete();
        }

        public async Task CalculatStudentStudiedHour(int studentId)
        {

            #region StudiedHour
            _gpaService.CalculatStudentStudiedHour(studentId);
            #endregion
            unitOfWork.Complete();
        }

        public async Task UpdateGraduationStatusID(int studentId)

        {
            _gpaService.UpdateGraduationStatusID(studentId);
            unitOfWork.Complete();
        }

        public async Task DeleteAcademicWarning(int studentId)

        {
            _academicWarningService.DeleteAcademicWarning(studentId);
            unitOfWork.Complete();
        }



        public async Task CalculatSemesterRichnessHour(int stdSemesterId)
        {
            _gpaService.CalculatSemesterRichnessHour(stdSemesterId);
            unitOfWork.Complete();
        }

        public async Task CalculatSemesterRichnessHourChick(int studentId)
        {
            _gpaService.CalculatSemesterRichnessHourChick(studentId);
            unitOfWork.Complete();
        }


        public async Task CalculateSemesterFailedHour(int stdSemesterId)
        {
            _gpaService.CalculateSemesterFailedHour(stdSemesterId);
            unitOfWork.Complete();
        }


        public async Task CalculatSemesterFailedHourChick(int studentId)
        {
            _gpaService.CalculatSemesterFailedHourChick(studentId);
            unitOfWork.Complete();
        }



        public async Task AllCalculatOfStdSemester(int stdSemesterId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {
            _gpaService.AllCalculatOfStdSemester(stdSemesterId, IsReg, accreditationStatusEnum);
            unitOfWork.Complete();
        }

        public async Task AllCalculatOfStdSemesterChick(int studentId, bool IsReg, AccreditationStatusEnum accreditationStatusEnum)
        {
            _gpaService.AllCalculatOfStdSemesterChick(studentId, IsReg, accreditationStatusEnum);
            unitOfWork.Complete();
        }


        public void UpdateSectionStudentCount(int sectionId)
        {
            _sectionService.UpdateStudentsCount(sectionId);
            unitOfWork.Complete();
        }


        public void UpdateSectionDepartmentStudentCount(int sectionId, int departmentId, int studyLevelId, int genderId)
        {
            _sectionDepartmentService.UpdateSectionDepartmentStudentCount(sectionId, departmentId, studyLevelId, genderId);
            unitOfWork.Complete();
        }

        public decimal CalculateBalance(int studentid)

        {
            var result = _StudentFinancialService.CalculateBalance(studentid);
            unitOfWork.Complete();
            return result;

        }

        [AutomaticRetry(Attempts = 0)]
        public void RefreshPlanSumofHours(int planId)
        {
            _planService.RefreshPlanSumofHours(planId);
            unitOfWork.Complete();
        }

        //public void RefreshStudentAcademicTransformationHour(int studentId)
        //{
        //    _transformationService.RefreshStudentAcademicTransformationHour(studentId);
        //    unitOfWork.Complete();
        //}

        //public void RefreshStudentAcademicOldUniversityTransformationHours(int studentId)
        //{
        //    _transformationService.RefreshStudentAcademicOldUniversityTransformationHours(studentId);
        //    unitOfWork.Complete();
        //}


    }
}








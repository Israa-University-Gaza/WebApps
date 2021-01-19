using System.Collections.Generic;
using System.Linq;
using Hangfire;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;

namespace IsraaSystem.Application.Academic.PlanManger
{


    public interface IPlanService : IIsraaService
    {
        IQueryable<Course> GetPlanPlaneCourses(int planId);
        void RefreshPlanSumofHours(int planId);

    }


    public class PlanService : IsraaService, IPlanService
    {

        private readonly ICheckResultService _checkResultService;
        private readonly ICalculationManager _calculationManager;
        public PlanService(IUnitOfWork unitOfWork, ILog logger, ICheckResultService checkResultService, ICalculationManager calculationManager) : base(unitOfWork, logger)
        {

            _checkResultService = checkResultService;
            _calculationManager = calculationManager;
        }


        public IQueryable<Course> GetPlanPlaneCourses(int planId)
        {
            var planCourses = unitOfWork.Academic.PlanCourse.Clean()
            .Where(x => x.PlanID == planId)
            .Select(x => x.Course)
            .Clean();
            return planCourses;
        }


        public int CalculatePlanNumofHours(int planId)
        {
            var sumHours = GetPlanPlaneCourses(planId).Sum(x => x.NumOfHours);
            return sumHours;
        }


        [AutomaticRetry(Attempts = 0)]
        public void RefreshPlanSumofHours(int planId)
        {
            var plan = unitOfWork.Academic.Plan.Find(planId);
            plan.NumOfHours = CalculatePlanNumofHours(planId);
        }

    }

}






using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.HumanResource.employee;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Application.HumanResource.JobManger;

namespace IsraaSystem.Application.HumanResource.EmpPlacement
{
    public interface IEmployeePlacementManager:IIsraaService
    {


        /// <summary>
        /// ترجع اخر اسم مركز وظيفي للموظف
        /// </summary>
        /// <param name="empId"></param>
        /// <returns></returns>
        string GetLastPlacementJobName(int empId);
    }

    public class EmployeePlacemetManager : IsraaService, IEmployeePlacementManager
    {
        private readonly JobService _IJobSrevice;
        public EmployeePlacemetManager(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
            _IJobSrevice = new JobService(unitOfWork,logger);
        }

        public string GetLastPlacementJobName(int empId)
        {
            int jobId= unitOfWork.HumanResource.EmployeePlacement.Where(x => x.EmployeeID == empId && x.IsDelete == false
            && (DateTime.Now>x.DateFrom && x.DateTo == null || x.DateTo > DateTime.Now) && x.PlacementTypeID == 1).FirstOrDefault().JobID;
                return _IJobSrevice.Get(jobId).JobTitle;
        }

    }
}

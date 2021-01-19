using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Application.HumanResource.employee;
using IsraaSystem.Application.HumanResource.EmpPlacement;
using IsraaSystem.Core.Classic.HumanResource.Employee;
//using IsraaSystem.Core.Classic.HumanResource.Vacation;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using log4net;

namespace IsraaSystem.Application.HumanResource.Vacation
{

    public interface IVacationManager : IIsraaService
    {
        EmpVacationDto EmployeeVacationGet(int id);
    }
    public class VacationManager : IsraaService, IVacationManager
    {
        private readonly IEmployeeManager _empManager;
        private readonly IEmployeePlacementManager _empPlacement;
        public VacationManager(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
            _empManager = new EmployeeManager(unitOfWork, logger);
            _empPlacement = new EmployeePlacemetManager(unitOfWork, logger);
        }

        public EmpVacationDto EmployeeVacationGet(int id)
        {
            
            var item = unitOfWork.HumanResource.EmployeeVacation.Find(id);
            var empItem = new EmpVacationDto
            {
                DManagerName = _empManager.GetEmpName(item.DirectMangerEmployeeID),
                EmployeeName = _empManager.GetEmpName(item.EmployeeID),
                EmployeeNo = _empManager.Get(item.EmployeeID).EmployeeNo,
                //DManagerName="",
                //EmployeeName="",
                //EmployeeNo="",
                VacationTypeID = item.VacationTypeID,
                VacationDays = item.VacationDays,
                EmpJob = _empPlacement.GetLastPlacementJobName(item.EmployeeID),
                //EmpJob="",
                VacationStartDate =item.VacationStartDate.ToString("dd/MM/yyyy"),
                VacationEndDate = item.VacationEndDate,
                VacationPlaceID = item.VacationPlaceID,
                VacationReason = item.VacationReason,
            };
            return empItem;
        }

      
    }

    public class EmpVacationDto
    {
        public string EmployeeName { get; set; }
        public string EmployeeNo { get; set; }
        public int VacationTypeID { get; set; }
        public string EmpJob { get; set; }
        public string DManagerName { get; set; }
        public int? VacationDays { get; set; }
        public string VacationReason { get; set; }
        public int VacationPlaceID { get; set; }
        public string VacationStartDate { get; set; }
        public DateTime VacationEndDate { get; set; }
    }
}

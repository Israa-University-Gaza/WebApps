using IsraaSystem.Application.Common.ServiceBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using log4net;

namespace IsraaSystem.Application.HumanResource.employee
{
    
    public interface IEmployeeManager: IIsraaService
    {
        EmployeePersonal Get(int? id);
        string GetEmpName(int? id);
    }

    public class EmployeeManager : IsraaService, IEmployeeManager
    {
        public EmployeeManager(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }
        public EmployeePersonal Get(int? id)
        {
            return unitOfWork.HumanResource.EmployeePersonal.Find(id);
        }

        public string GetEmpName(int? id)
        {
            var item = unitOfWork.HumanResource.EmployeePersonal.Find(id);
                if(item!=null)
            return item.ArFirstName + " " + item.ArSecoundName + " " + item.ArThirdName + " " + item.ArFamilyName;
            return "";

        }
    }
    

}

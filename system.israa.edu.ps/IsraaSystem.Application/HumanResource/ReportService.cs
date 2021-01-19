using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Data.Common.ServiceBase;
using IsraaSystem.Data.Common.test;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using log4net;

namespace IsraaSystem.Application.HumanResource
{


    public interface IReportService : IIsraaService
    {


    }




    public class ReportService : IsraaService, IReportService
    {
        public ReportService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }



        public void EmployeeVacationStatistics(int employeeId)

        {





        }




    }



}

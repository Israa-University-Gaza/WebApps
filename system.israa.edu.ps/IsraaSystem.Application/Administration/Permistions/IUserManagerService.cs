using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;

namespace IsraaSystem.Application.Administration.Permistions
{
    interface IUserManagerService : IIsraaService
    {
    }


    public class UserManagerService : IsraaService, IUserManagerService
    {


        public UserManagerService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


    }
}

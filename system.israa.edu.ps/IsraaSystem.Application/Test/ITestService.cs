using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;

namespace IsraaSystem.Application.Test
{
    public interface ITestService : IIsraaService
    {

    }

    public class TestService : IsraaService, ITestService
    {
        public TestService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }
    }
}
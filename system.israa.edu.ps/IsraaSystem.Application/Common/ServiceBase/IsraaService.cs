using IsraaSystem.Application.Common.UnitOfWork;
using log4net;

namespace IsraaSystem.Application.Common.ServiceBase
{
    public abstract class IsraaService : IIsraaService
    {


        protected IUnitOfWork unitOfWork;
        protected ILog Logger;


        protected IsraaService(IUnitOfWork unitOfWork, ILog logger)
        {
            this.unitOfWork = unitOfWork;
            this.Logger = logger;
        }

        //[Dependency]
        //public INotificationService Notificatione { get; set; }


        public void Dispose()
        {
            this.unitOfWork.Dispose();
        }
    }
}
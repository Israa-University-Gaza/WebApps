using System.Linq;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAdministration;
using log4net;

namespace IsraaSystem.Application.Administration.Settings
{
    public interface ISettingService : IIsraaService
    {
        AcedmicWarningSetting GetWarningSettings(int programId, int semsterId);

    }

    public class SettingService : IsraaService, ISettingService
    {
        public SettingService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public AcedmicWarningSetting GetWarningSettings(int programId, int semsterId)
        {
            var SettingService = unitOfWork.Administration.AcedmicWarningSetting.Where(x => x.ProgramID == programId && x.SemesterID <= semsterId).ToList();
            return SettingService.LastOrDefault();
        }


    }

}
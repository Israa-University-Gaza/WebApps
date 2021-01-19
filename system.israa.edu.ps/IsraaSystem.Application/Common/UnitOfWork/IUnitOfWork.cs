using System;
using System.Collections.Generic;
using IsraaSystem.Application.Common.Alert;
using IsraaSystem.Application.Common.RepositoryPattern;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAdministration;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaLog;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermissions;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;

namespace IsraaSystem.Application.Common.UnitOfWork
{
    public interface IUnitOfWork : IHasAlert, IDisposable
    {


        int Save();


        IsraaAcademicEntities Academic { get; }

        IsraPermissionEntities Permission { get; }

        IsraaHumanResourceEntities HumanResource { get; }

        IsraaRepositoryEntities Repository { get; }

        IsraaAdministrationEntities Administration { get; }

        IsraDataEntities IsraaData { get; }

        IsraPermissionsEntities IsraaPermissions { get; }
        IsraaLogEntities IsraaLog { get; }


        void Complete();
    }
}
using System;
using System.Collections.Generic;
using IsraaSystem.Application.Common.Alert;
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
    public class UnitOfWork : HasAlert, IUnitOfWork
    {
        #region DbContexts



        public IsraaAcademicEntities Academic { get; }
        public IsraPermissionEntities Permission { get; }
        public IsraaHumanResourceEntities HumanResource { get; }
        public IsraaRepositoryEntities Repository { get; }
        public IsraaAdministrationEntities Administration { get; }
        public IsraDataEntities IsraaData { get; }

        public IsraPermissionsEntities IsraaPermissions { get; }

        public IsraaLogEntities IsraaLog { get; }

        #endregion




        #region Constructor

        public UnitOfWork(IsraaAcademicEntities acadmicDbContext, IsraPermissionEntities israPermissionContext, IsraaHumanResourceEntities israaHumanResourceEntities, IsraaRepositoryEntities repository, IsraaAdministrationEntities administration, IsraDataEntities israData, IsraPermissionsEntities israaPermissions, IsraaLogEntities israaLog)
        {

            Academic = acadmicDbContext;
            Permission = israPermissionContext;
            HumanResource = israaHumanResourceEntities;
            Repository = repository;
            Administration = administration;
            IsraaData = israData;
            IsraaPermissions = israaPermissions;
            IsraaLog = israaLog;
        }


        #endregion


        #region Methods

        public void Complete()
        {

            Academic.SaveChanges();
            Permission.SaveChanges();
            HumanResource.SaveChanges();
            Repository.SaveChanges();
            Administration.SaveChanges();
            IsraaData.SaveChanges();
            IsraaPermissions.SaveChanges();
            IsraaLog.SaveChanges();
        }

        #endregion

        public int Save()
        {
            return Academic.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Academic.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            System.GC.SuppressFinalize(this);
        }
    }





}
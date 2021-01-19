using Hangfire;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAdministration;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using System;
using System.Linq;
using IsraaSystem.Application.Common.RepositoryPattern;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaLog;
using Unity;
using Unity.AspNet.Mvc;
using Unity.Lifetime;
using Unity.log4net;
using Unity.RegistrationByConvention;

namespace IsraaSystem.Web
{
    public class UnityHangfireActivator : JobActivator
    {
        private readonly IUnityContainer _hangFireContainer;

        public UnityHangfireActivator(IUnityContainer hangFireContainer)
        {
            this._hangFireContainer = hangFireContainer;
            //don't forget to register child dependencies as well

            this._hangFireContainer
                .AddNewExtension<Log4NetExtension>()
                .RegisterType<IUnitOfWork, UnitOfWork>(new PerResolveLifetimeManager())
                .RegisterType<IsraaAcademicEntities, IsraaAcademicEntities>(new PerResolveLifetimeManager())
                .RegisterType<IsraPermissionEntities, IsraPermissionEntities>(new PerResolveLifetimeManager())
                .RegisterType<IsraaRepositoryEntities, IsraaRepositoryEntities>(new PerResolveLifetimeManager())
                .RegisterType<IsraaAdministrationEntities, IsraaAdministrationEntities>(new PerResolveLifetimeManager())
                .RegisterType<IsraaLogEntities, IsraaLogEntities>(new PerResolveLifetimeManager())

                .RegisterType<IAcademicRepository<Section>, AcademicRepository<Section>>(new PerResolveLifetimeManager())
                .RegisterType<IAcademicRepository<StudentAcademic>, AcademicRepository<StudentAcademic>>(new PerResolveLifetimeManager())


                .RegisterTypes(
                    AllClasses.FromLoadedAssemblies().Where(t => t.GetInterfaces().Any(i => typeof(IIsraaService) == i)),
                    WithMappings.FromMatchingInterface,
                    WithName.Default,
                    WithLifetime.Transient);

        }

        public override object ActivateJob(Type type)
        {
            return _hangFireContainer.Resolve(type);
        }
    }
}
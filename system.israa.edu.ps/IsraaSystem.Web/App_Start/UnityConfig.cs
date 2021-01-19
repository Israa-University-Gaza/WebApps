using CommonServiceLocator;
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
//using Unity.AspNet.Mvc;
using Unity.log4net;
using Unity.RegistrationByConvention;
using Unity.Lifetime;
using IsraaSystem.Application.HumanResource.Vacation;

namespace IsraaSystem.Web
{
    /// <summary>
    /// Specifies the Unity configuration for the main container.
    /// </summary>
    public class UnityConfig
    {
        #region Unity Container
        private static Lazy<IUnityContainer> Container = new Lazy<IUnityContainer>(() =>
        {
            var container = new UnityContainer();
            container.AddNewExtension<Log4NetExtension>();

            RegisterTypes(container);

            return container;
        });

        /// <summary>
        /// Gets the configured Unity container.
        /// </summary>
        public static IUnityContainer GetConfiguredContainer()
        {
            return Container.Value;
        }
        #endregion



        /// <summary>Registers the type mappings with the Unity container.</summary>
        /// <summary>Registers the type mappings with the Unity container.</summary>
        /// <param name="container">The unity container to configure.</param>
        /// <remarks>There is no need to register concrete types such as controllers or API controllers (unless you want to
        /// change the defaults), as Unity allows resolving a concrete type even if it was not previously registered.</remarks>
        public static void RegisterTypes(IUnityContainer container)
        {
            // NOTE: To load from web.config uncomment the line below. Make sure to add a Microsoft.Practices.Unity.Configuration to the using statements.
            // container.LoadConfiguration();


            container
                .AddNewExtension<Log4NetExtension>()
                .RegisterType<IUnitOfWork, UnitOfWork>(new PerRequestLifetimeManager())
                .RegisterType<IsraaAcademicEntities, IsraaAcademicEntities>(new PerRequestLifetimeManager())
                .RegisterType<IsraPermissionEntities, IsraPermissionEntities>(new PerRequestLifetimeManager())
                .RegisterType<IsraaRepositoryEntities, IsraaRepositoryEntities>(new PerRequestLifetimeManager())
                .RegisterType<IsraaAdministrationEntities, IsraaAdministrationEntities>(new PerRequestLifetimeManager())
                .RegisterType<IsraaLogEntities, IsraaLogEntities>(new PerRequestLifetimeManager())
                .RegisterType<IVacationManager, VacationManager>(new PerRequestLifetimeManager())

                .RegisterType<IAcademicRepository<Section>, AcademicRepository<Section>>(new PerRequestLifetimeManager())
                .RegisterType<IAcademicRepository<StudentAcademic>, AcademicRepository<StudentAcademic>>(new PerRequestLifetimeManager())



                .RegisterTypes(
                    AllClasses.FromLoadedAssemblies().Where(t => t.GetInterfaces().Any(i => typeof(IIsraaService) == i)),
                    WithMappings.FromMatchingInterface,
                    WithName.Default,
                    WithLifetime.Transient);


            ServiceLocator.SetLocatorProvider(() => new UnityServiceLocatorAdapter(container));
        }








    }


}


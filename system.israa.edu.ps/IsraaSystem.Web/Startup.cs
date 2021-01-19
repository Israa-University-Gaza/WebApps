using System;
using System.Threading.Tasks;
using Hangfire;
using Hangfire.Dashboard;
using IsraaSystem.Web.Models.Hubs;
using IsraaSystem.Web.Security;
using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Newtonsoft.Json;
using Owin;
using Unity;





//  ██╗███████╗██████╗  █████╗  █████╗     ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
//  ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
//  ██║███████╗██████╔╝███████║███████║    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
//  ██║╚════██║██╔══██╗██╔══██║██╔══██║    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
//  ██║███████║██║  ██║██║  ██║██║  ██║    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
//  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝





[assembly: OwinStartup(typeof(IsraaSystem.Web.Startup))]
namespace IsraaSystem.Web
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {

            GlobalConfiguration.Configuration.UseSqlServerStorage("Hangfire");

            var hangfireContainer = new UnityContainer();
            GlobalConfiguration.Configuration.UseActivator(new UnityHangfireActivator(hangfireContainer));

            app.UseHangfireDashboard("/HangfireDashboard", new DashboardOptions
            {
                Authorization = new[] { new MyAuthorizationFilter() }
            });
            app.UseHangfireServer();




            var idProvider = new CustomUserIdProvider();
            GlobalHost.DependencyResolver.Register(typeof(IUserIdProvider), () => idProvider);
            // Any connection or hub wire up and configuration should go here
            app.MapSignalR(
                new HubConfiguration
                {
                    EnableJSONP = true,
                    EnableDetailedErrors = true,
                    EnableJavaScriptProxies = true
                });


        }



    }


    public class MyAuthorizationFilter : IDashboardAuthorizationFilter
    {
        public bool Authorize(DashboardContext context)
        {
            //// In case you need an OWIN context, use the next line, `OwinContext` class
            //// is the part of the `Microsoft.Owin` package.
            //var owinContext = new OwinContext(context.GetOwinEnvironment());
            //// Allow all authenticated users to see the Dashboard (potentially dangerous).
            //var userId = owinContext.Authentication.User.Identity.Name;
            //IsraaUser user = new IsraaUser(Convert.ToInt32(userId));
            return true; //user.IsSuperAdmin;
        }
    }


    public class CustomUserIdProvider : IUserIdProvider
    {
        public string GetUserId(IRequest request)
        {
            // your logic to fetch a user identifier goes here.

            // for example:

            var userId = request.User.Identity.Name;
            return userId;
        }
    }

}

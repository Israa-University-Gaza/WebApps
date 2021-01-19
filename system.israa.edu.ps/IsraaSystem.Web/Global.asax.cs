using Audit.Core;
using Audit.log4net;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using IsraaSystem.Application;
using IsraaSystem.DataAccess;
using IsraaSystem.Web.Models.Hubs;
using Microsoft.AspNet.Identity;

namespace IsraaSystem.Web
{
    public class Global : HttpApplication
    {
        string con = DBConnection.GetIsraaHumanResourceConnection().ConnectionString;

        void Application_Start(object sender, EventArgs e)
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            AutoMapperConfig.RegisterMappings();
            SqlDependency.Start(con);

            #region Logging Configurations

            log4net.Config.XmlConfigurator.Configure(new FileInfo(Server.MapPath("~/log4net.config")));



            //! https://github.com/thepirat000/Audit.NET/blob/master/src/Audit.NET.log4net/README.md

            Audit.Core.Configuration.Setup()
                .UseLog4net(config => config
                    .LogLevel(LogLevel.Debug)
                    .Message(auditEvent => auditEvent.ToJson()));


            #endregion


        }

        protected void Session_Start(object sender, EventArgs e)
        {
            NotificationComponent NC = new NotificationComponent();
            var currentTime = DateTime.Now;
            HttpContext.Current.Session["LastUpdated"] = currentTime;
            NC.RegisterNotification(currentTime, HttpContext.Current.User.Identity.GetUserName());
        }



        protected void Application_End()
        {
            //here we will stop Sql Dependency
            SqlDependency.Stop(con);
        }
    }
}
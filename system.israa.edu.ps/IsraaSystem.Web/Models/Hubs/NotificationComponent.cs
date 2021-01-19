using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using IsraaSystem.Application;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using Microsoft.AspNet.SignalR;

namespace IsraaSystem.Web.Models.Hubs
{
    public class NotificationComponent : DBConnection
    {


        //Here we will add a function for register notification (will add sql dependency)
        public void RegisterNotification(DateTime currentTime, string Recipient_username)
        {
            string conStr = GetIsraaHumanResourceConnection().ConnectionString;
            string sqlCommand = @"select [Title],[ID] from [dbo].[Notifications] where [InsertDate] > @AddedOn ";

            //you can notice here I have added table name like this [dbo].[Contacts] with [dbo], its mendatory when you use Sql Dependency
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(sqlCommand, con);
                cmd.Parameters.AddWithValue("@AddedOn", currentTime);
                //cmd.Parameters.AddWithValue("@Recipient_username", Recipient_username);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                cmd.Notification = null;
                SqlDependency sqlDep = new SqlDependency(cmd);
                sqlDep.OnChange += sqlDep_OnChange;
                //we must have to execute the command here
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    // nothing need to add here now
                }
            }
        }

        void sqlDep_OnChange(object sender, SqlNotificationEventArgs e)
        {
            //or you can also check => if (e.Info == SqlNotificationInfo.Insert) , if you want notification only for inserted record
            //if (e.Type == SqlNotificationType.Change)
            if (e.Info == SqlNotificationInfo.Insert)
            {
                SqlDependency sqlDep = sender as SqlDependency;
                sqlDep.OnChange -= sqlDep_OnChange;
                IsraaHumanResourceEntities entities = new IsraaHumanResourceEntities();

                var allDbNotifications = entities.Notifications.OrderByDescending(x => x.ID).ToList();

                //from here we will send notification message to client
                var notificationHub = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                //notificationHub.Clients.All.notify("added");

                notificationHub.Clients.User("5101").notify("5101 UserUserUserUserUserUser ");




                //re-register notification
                RegisterNotification(DateTime.Now, allDbNotifications.First().Recipient_username);
            }
            else
            {
                var notificationHub = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();

                notificationHub.Clients.All.notify("notadded");
            }
        }





    }





}
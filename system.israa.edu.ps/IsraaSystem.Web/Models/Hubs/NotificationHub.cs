using System.Collections.Concurrent;
using System.Runtime.Remoting.Contexts;
using System.Threading.Tasks;
using Microsoft.AspNet.SignalR;

namespace IsraaSystem.Web.Models.Hubs
{
    public class NotificationHub : Hub
    {


        //public void SendChatMessage(string who, string message)
        //{
        //    string name = Context.User.Identity.Name;

        //    //Clients.Group(who).addChatMessage(name + ": " + message);
        //    Clients.Group(who).notify(message);
        //}

        public override Task OnConnected()
        {
            string name = Context.User.Identity.Name;

            Groups.Add(Context.ConnectionId, name);

            return base.OnConnected();
        }



    }

}
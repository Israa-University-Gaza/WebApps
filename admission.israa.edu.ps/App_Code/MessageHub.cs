using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Threading.Tasks;
using System.Collections;

public class MessageHub : Hub
{
    private readonly static ConnectionMapping connections = new ConnectionMapping();
    public void Hello()
    {
        Clients.All.hello();
    }

    public static void SendMessage(string who, string title, string msg, string type)
    {
        IHubContext context = GlobalHost.ConnectionManager.GetHubContext<MessageHub>();
        if (who == "0")
        {
            context.Clients.All.sendMessage(title, msg, type);
        }
        else
        {
            foreach (var connectionId in connections.GetConnections(who))
            {
                context.Clients.Client(connectionId).sendMessage(title, msg, type);
            }
        }
    }

    public override Task OnConnected()
    {
        string name = Context.User.Identity.Name;
        if (!connections.IsKeyExist(name))
        {
            connections.Add(name, Context.ConnectionId);
            //SendMessage(name, "مرحبا", "مرحبا بك من جديد في برنامج القبول والتسجيل", "success");
        }
        else {
            connections.Add(name, Context.ConnectionId);
        }
        return base.OnConnected();
    }

    public override Task OnDisconnected(bool stopCalled)
    {
        string name = Context.User.Identity.Name;
        connections.Remove(name, Context.ConnectionId);
        return base.OnDisconnected(stopCalled);
    }

    public override Task OnReconnected()
    {
        string name = Context.User.Identity.Name;
        if (!connections.GetConnections(name).Contains(Context.ConnectionId))
        {
            connections.Add(name, Context.ConnectionId);
        }
        return base.OnReconnected();
    }
}
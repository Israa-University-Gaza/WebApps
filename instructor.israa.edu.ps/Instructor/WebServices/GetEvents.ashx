<%@ WebHandler Language="C#" Class="GetEvents" %>

using System;
using System.Web;
using System.Collections.Generic;

public class GetEvents : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //string json = "[{\"title\":\"Wajed2\",\"start\": \"" + String.Format("{0:s}", DateTime.Now) + "\"}]";
        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(GetMyEvents());

        context.Response.Clear();
        context.Response.ContentType = "application/json; charset=utf-8";
        context.Response.Write(sJSON);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public List<Event> GetMyEvents()
    {

        List<Event> events = new List<Event>();
        events.Add(new Event()
        {
            title = "EventName 1",
            start = String.Format("{0:s}", DateTime.Now),
            end = String.Format("{0:s}", DateTime.Now.AddDays(0))
        });
        events.Add(new Event()
        {
            title = "EventName 2",
            start = String.Format("{0:s}", DateTime.Now.AddDays(4)),
            end = String.Format("{0:s}", DateTime.Now.AddDays(5))
        });
        events.Add(new Event()
        {
            title = "EventName 3",
            start = String.Format("{0:s}", DateTime.Now.AddDays(10)),
            end = String.Format("{0:s}", DateTime.Now.AddDays(11))
        });
        events.Add(new Event()
        {
            title = "EventName 4",
            start = String.Format("{0:s}", DateTime.Now.AddDays(22)),
            end = String.Format("{0:s}", DateTime.Now.AddDays(25))
        });
        return events;
    }
}
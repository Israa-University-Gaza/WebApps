<%@ WebHandler Language="C#" Class="GetRoomLectures" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class GetRoomLectures : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedDay = context.Request.QueryString["selectedDay"];
        string selectedFromHour = context.Request.QueryString["selectedFromHour"];
        string selectedToHour = context.Request.QueryString["selectedToHour"];

        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(GetAvailableRooms(selectedDay, selectedFromHour, selectedToHour));

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

    public List<Room> GetAvailableRooms(string CDayID, string FromHour, string ToHour)
    {
        List<Room> rooms = new List<Room>();
        DataTable DT = DataAccess.GetAvailableRooms(CDayID, FromHour, ToHour);
        foreach (DataRow row in DT.Rows)
        {
            rooms.Add(new Room()
            {
                ID = row["ID"].ToString(),
                Name = row["Name"].ToString(),

            });
        }

        return rooms;
    }
}
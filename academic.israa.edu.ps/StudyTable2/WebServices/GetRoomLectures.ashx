<%@ WebHandler Language="C#" Class="GetRoomLectures" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class GetRoomLectures : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(GetMyEvents(context.Request.QueryString["roomid"]));

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

    public List<Event> GetMyEvents(string roomid)
    {
        List<Event> events = new List<Event>();
        DataTable DT = DataAccess.GetRoomLectures(roomid, "21"); /* by RSR */
        foreach (DataRow row in DT.Rows)
        {
            events.Add(new Event()
            {
                id = row["ID"].ToString(),
                title = row["ArNameCourse"].ToString() + " (" + row["SectionNum"].ToString() + ") " + "(" + row["Room"].ToString() + ")",
                start = String.Format("{0:s}", DateTime.Parse("2016/10/0" + row["DayNum"].ToString() + " " + row["FromHour"].ToString())),
                end = String.Format("{0:s}", DateTime.Parse("2016/10/0" + row["DayNum"].ToString() + " " + row["ToHour"].ToString())),
                Course = row["ArNameCourse"].ToString(),
                OfferdCourseID = row["OfferdCourseID"].ToString(),
                SectionID = row["SectionID"].ToString(),
                SectionNum = row["SectionNum"].ToString(),
                InstructorID = row["InstructorID"].ToString(),
                Instructor = row["Instructor"].ToString(),
                DayID = row["CDayID"].ToString(),
                RoomID = row["RoomID"].ToString(),
                Room = row["Room"].ToString(),
                FromHour = row["FromHour"].ToString(),
                ToHour = row["ToHour"].ToString()
            });
        }

        return events;
    }
}
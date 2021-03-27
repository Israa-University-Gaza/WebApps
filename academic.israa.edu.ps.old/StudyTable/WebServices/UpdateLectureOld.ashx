<%@ WebHandler Language="C#" Class="UpdateLectureOld" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class UpdateLectureOld : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedID = context.Request.QueryString["selectedID"];
        string selectedInstructor = context.Request.QueryString["selectedInstructor"];
        string selectedRoom = context.Request.QueryString["selectedRoom"];
        string selectedDay = context.Request.QueryString["selectedDay"];
        string selectedFromHour = context.Request.QueryString["selectedFromHour"];
        string selectedToHour = context.Request.QueryString["selectedToHour"];

        DataTable DT = DataAccess.LectureUpdate(selectedID, selectedInstructor, selectedRoom, selectedDay, selectedFromHour, selectedToHour, context.User.Identity.Name);

        string sJSON = "{ \"status\" : \"" + DT.Rows[0]["status"].ToString() + "\", \"title\" : \"" + DT.Rows[0]["title"].ToString() + "\", \"msg\" : \"" + DT.Rows[0]["msg"].ToString() + "\" }";
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
}
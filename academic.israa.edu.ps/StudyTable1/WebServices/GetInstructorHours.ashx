<%@ WebHandler Language="C#" Class="GetInstructorHours" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class GetInstructorHours : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedInstructor = context.Request.QueryString["selectedInstructor"];

        DataTable DT = DataAccess.GetTeacherStudyTableInfo(selectedInstructor, "", "5");

        string sJSON = "{ \"hours\" : \"" + DT.Rows[0]["SumOfHours"].ToString() + "\"}";
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
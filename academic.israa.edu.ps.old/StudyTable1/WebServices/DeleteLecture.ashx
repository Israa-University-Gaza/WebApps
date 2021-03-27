<%@ WebHandler Language="C#" Class="DeleteLecture" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class DeleteLecture : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedID = context.Request.QueryString["selectedID"];

        DataTable DT = DataAccess.LectureDelete(selectedID,context.User.Identity.Name);

        string sJSON = "{ \"status\" : \"" + DT.Rows[0]["status"].ToString() + "\", \"msg\" : \"" + DT.Rows[0]["msg"].ToString() + "\" }";
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
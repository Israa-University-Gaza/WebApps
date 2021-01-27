<%@ WebHandler Language="C#" Class="DeleteSectionFromBlock" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class DeleteSectionFromBlock : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedBlockID = context.Request.QueryString["selectedBlockID"];
        string selectedSectionID = context.Request.QueryString["selectedSectionID"];

        DataTable DT = DataAccess.DeleteSectionFromBlock(selectedBlockID, selectedSectionID, context.User.Identity.Name);

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
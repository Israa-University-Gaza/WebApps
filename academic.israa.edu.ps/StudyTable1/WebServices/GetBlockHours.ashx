<%@ WebHandler Language="C#" Class="GetBlockHours" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class GetBlockHours : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string selectedBlock = context.Request.QueryString["selectedBlock"];

        DataTable DT = DataAccess.GetBlockStudyTableInfoReport(selectedBlock);

        string sJSON = "{ \"hours\" : \"" + DT.Rows[0]["CountOfRegisterHours"].ToString() + "\"}";
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
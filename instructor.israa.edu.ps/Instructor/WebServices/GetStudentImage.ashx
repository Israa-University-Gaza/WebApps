<%@ WebHandler Language="C#" Class="GetEmployeeImage" %>

using System;
using System.Web;
using System.Data;

public class GetEmployeeImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string imgString = "";
        byte[] imgBytes = null;
        DataTable DT = DataAccess.StudentImageGet(context.Request.QueryString["StudentID"].ToString());
        if (DT.Rows.Count > 0)
        {
            if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
            {
                imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                imgString = Convert.ToBase64String(imgBytes);
            }
        }
        context.Response.ContentType = "application/octet-stream";
        context.Response.BinaryWrite(imgBytes);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
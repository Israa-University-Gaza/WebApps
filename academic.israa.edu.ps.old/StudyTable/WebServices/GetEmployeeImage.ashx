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
        string EmployeeID = (context.Request.QueryString["EmployeeID"] != null) ? context.Request.QueryString["EmployeeID"].ToString() : context.User.Identity.Name;
        DataTable DT = DataAccess.EmployeeImageGet(EmployeeID);
        if (DT.Rows.Count > 0)
        {
            if (!Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
            {
                imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
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
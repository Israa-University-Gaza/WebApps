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
            }

            else {
                imgBytes = imageToByteArray("/images/User-icon.png");
            }
        }
        imgString = Convert.ToBase64String(imgBytes);
        context.Response.ContentType = "application/octet-stream";
        context.Response.BinaryWrite(imgBytes);
    }

    public static byte[] imageToByteArray(string path)
    {
        System.Drawing.Image imageIn = System.Drawing.Image.FromFile(System.Web.HttpContext.Current.Server.MapPath("~").ToString() + path);
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        return ms.ToArray();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
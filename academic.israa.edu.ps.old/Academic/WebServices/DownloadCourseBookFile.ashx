<%@ WebHandler Language="C#" Class="DownloadCourseBookFile" %>

using System;
using System.Web;
using System.IO;

public class DownloadCourseBookFile : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string fileName = context.Request.QueryString["fileName"].ToString();
        if (File.Exists("C:\\Inetpub\\vhosts\\israa.edu.ps\\instructor.israa.edu.ps\\Uploads\\CourseBook\\" + fileName))
        {
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
            response.AddHeader("Content-Disposition",
                               "attachment; filename=" + fileName + ";");
            response.TransmitFile("C:\\Inetpub\\vhosts\\israa.edu.ps\\instructor.israa.edu.ps\\Uploads\\CourseBook\\" + fileName);
            response.Flush();
            response.End();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
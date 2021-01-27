<%@ WebHandler Language="C#" Class="DownloadFile" %>

using System;
using System.Web;
using System.IO;

public class DownloadFile : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string fileName = context.Request.QueryString["fileName"].ToString();
        if (File.Exists("C:\\Inetpub\\vhosts\\israa.edu.ps\\eexam.israa.edu.ps\\Uploads\\" + fileName))
        {
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
            response.AddHeader("Content-Disposition",
                               "attachment; filename=" + fileName + ";");
            response.TransmitFile("C:\\Inetpub\\vhosts\\israa.edu.ps\\eexam.israa.edu.ps\\Uploads\\" + fileName);
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
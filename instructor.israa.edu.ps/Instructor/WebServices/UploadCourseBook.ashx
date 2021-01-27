<%@ WebHandler Language="C#" Class="UploadCourseBook" %>

using System;
using System.Web;
using System.IO;

public class UploadCourseBook : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string status = "0"; string msg = "";
        string employeeId = context.User.Identity.Name;
        string filename = "";
        string courseId = context.Request.Form["courseId"].ToString();
        string bookName = context.Request.Form["bookName"].ToString();
        if (courseId != "-1" && bookName != "")
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                var fileContent = HttpContext.Current.Request.Files[0];
                if (fileContent != null && fileContent.ContentLength > 0)
                {
                    string fileExtension = Path.GetExtension(fileContent.FileName).ToLower();
                    filename = courseId + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + fileExtension;
                    fileContent.SaveAs(HttpContext.Current.Server.MapPath("~/Uploads/CourseBook/" + filename));
                    DataAccess.CourseBookAdd(employeeId, "9", courseId, bookName, filename);
                    status = "1";
                    msg = "تم حفظ الكتاب بنجاح";
                }
            }
        }
        else {
            status = "0";
            msg = "الرجاء إدخال البيانات المطلوبة بنجاح";
        }

        string sJSON = "{ \"status\" : \"" + status + "\", \"msg\" : \"" + msg + "\" }";
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
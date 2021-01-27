<%@ WebHandler Language="C#" Class="ShowCV" %>

using System;
using System.Configuration;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public class ShowCV : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
       context.Response.Write("1");
           


        Int32 empno;
        if (context.Request.Cookies["emp_id"] != null)
            empno = Convert.ToInt32(context.Request.Cookies["emp_id"].Value);
        else
        {
            //throw new ArgumentException("No parameter specified");
            context.Response.Redirect("Login.aspx");

        }
        empno =Convert.ToInt32(context.Request.Cookies["emp_id"].Value);
        context.Response.ContentType = "application/pdf";
        Stream strm = ShowEmpImage(empno);
        byte[] buffer = new byte[4096];
        int byteSeq = strm.Read(buffer, 0, 4096);

        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }
        //context.Response.BinaryWrite(buffer);
    }
    public Stream ShowEmpImage(int empno)
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(conn);
        string sql = "SELECT cv FROM hr_emp_cv WHERE emp_id = @ID";
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", empno);
        connection.Open();
        object img = cmd.ExecuteScalar();
        try
        {
            return new MemoryStream((byte[])img);
        }
        catch
        {
            return null;
        }
        finally
        {
            connection.Close();
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
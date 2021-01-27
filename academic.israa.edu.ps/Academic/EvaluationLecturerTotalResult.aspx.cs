using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Academic_EvaluationLecturerTotalResult : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = EmployeeID;
    }


    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Evaluation.xls");
        Response.BufferOutput = true;
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.Charset = "UTF-8";
        EnableViewState = false;
        Response.ContentType = "application/vnd.ms-excel";
        HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
        HttpContext.Current.Response.Write("<BR><BR><BR>");
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        Repeater2.RenderControl(htmlWrite);
        Response.Write("<table>");
        Response.Write(stringWrite.ToString());
        Response.Write("</table>");
        Response.End();
    }
}
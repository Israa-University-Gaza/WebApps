using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_StudentBankInstallment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (DataTable)DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }
        viwer.LocalReport.Refresh();

        byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }
    protected void lbStudentBankInstallmentPDF_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentBankInstallment");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentBankInstallment(id));
        CreatePDF("InstallmentBank_", @"Affairs\Reports\StudentBankInstallmentReport.rdlc", a1, a2);
    }



    protected void lbStudentBankInstallmentPDF1_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentBankInstallment");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentBankInstallment(id));
        CreatePDF("InstallmentBank_", @"Affairs\Reports\StudentBankInstallmentReport1.rdlc", a1, a2);
    }
    protected void lbGoStudent_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("lblStudentID")).Text;
        Session["StudentID"] = id;
        Response.Redirect("~/Affairs/Student.aspx");
    }

    protected void txtStudentName_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
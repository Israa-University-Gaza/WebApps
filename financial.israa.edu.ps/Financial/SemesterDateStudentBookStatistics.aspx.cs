using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_SemesterDateStudentBookStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            ddlBranches.DataBind();
            ddlBranches.Items.Insert(0, new ListItem("الكل", "-1"));

        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {

        bool Validate = ValidateControls(new WebControl[] { ddlSemester });
        if (Validate)
        {
            DataTable DT = DataAccess.GetSemesterDateStudentBookStatistics(ddlSemester.SelectedValue, txtDate.Text, ddlBranches.SelectedValue);
            DataTable DT2 = DataAccess.GetSemesterDateStudentBookTotalStatistics(ddlSemester.SelectedValue, txtDate.Text, ddlBranches.SelectedValue);
            DataTable DT3 = DataAccess.GetSemesterDateStudentBookDeleteStatistics(ddlSemester.SelectedValue, txtDate.Text, ddlBranches.SelectedValue);
            DataTable DT4 = DataAccess.GetSemesterDateStudentBookDeleteTotalStatistics(ddlSemester.SelectedValue, txtDate.Text, ddlBranches.SelectedValue);
            ListView1.DataSource = DT;
            ListView1.DataBind();
            ListView2.DataSource = DT2;
            ListView2.DataBind();
            ListView3.DataSource = DT3;
            ListView3.DataBind();
            ListView4.DataSource = DT4;
            ListView4.DataBind();
        }
    }

    protected void btnPdf_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSemesterDateStudentBookStatistics1");
        a1.Add("dsSemesterDateStudentBookStatistics2");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSemesterDateStudentBookStatistics(ddlSemester.SelectedValue, txtDate.Text,ddlBranches.SelectedValue));
        a2.Add(DataAccess.GetSemesterDateStudentBookDeleteStatistics(ddlSemester.SelectedValue, txtDate.Text, ddlBranches.SelectedValue));

        CreatePDF("BooksStatistics", @"Financial\Reports\BooksStatistics.rdlc", a1, a2);
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
}
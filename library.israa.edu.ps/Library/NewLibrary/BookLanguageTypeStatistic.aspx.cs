using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_NewLibrary_BookLanguageTypeStatistic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            txtLanguageDateFrom.Text = txtTypeDateFrom.Text = "2015/06/01";
            txtLanguageDateTo.Text = txtTypeDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetBookLanguageStatistics");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetBookLanguageStatistics(txtLanguageDateFrom.Text, txtLanguageDateTo.Text));
        CreatePDF("BookLanguageReport", @"Library/NewLibrary/Reports/BookLanguageReport.rdlc", a1, a2);
    }

    protected void btnSearch1_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnPDF1_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetBookContainerTypeStatistics");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetBookContainerTypeStatistics(txtTypeDateFrom.Text, txtTypeDateTo.Text));
        CreatePDF("BookContainerTypeReport", @"Library/NewLibrary/Reports/BookContainerTypeReport.rdlc", a1, a2);
    }
}
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_NewLibrary_BooksBorrowDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtBorrowDateFrom.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            txtBorrowDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
            txtReturnDateFrom.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            txtReturnDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
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
    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetBookBorrow");
        a1.Add("dsGetBookReportInfo");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetBookBorrow(lblBookID.Text, txtBorrowDateFrom.Text, txtBorrowDateTo.Text, txtReturnDateFrom.Text, txtReturnDateFrom.Text, ddlBorrowStatus.SelectedValue));
        a2.Add(NewDataAccess.GetBookReportInfo(lblBookID.Text, txtBorrowDateFrom.Text, txtBorrowDateTo.Text));
        CreatePDF("BookBorrowReport", @"Library/NewLibrary/Reports/BookBorrowReport.rdlc", a1, a2);
    }
}
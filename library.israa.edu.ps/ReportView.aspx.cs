using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] == "1")
        {
            ArrayList a1 = new ArrayList();
            a1.Add("DelayBorrow");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.DelayBorrow());
            CreatePDF("المستعيرين المتاخرين", @"Reports\DelayBorrow.rdlc", a1, a2);
        }

        if (Request.QueryString["from"] !=  null && Request.QueryString["to"] !=  null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("BorrowDataView");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.borrowDataView(Request.QueryString["from"].ToString(),Request.QueryString["to"].ToString()));
            CreatePDF("كشف متابعة الاعارة ", @"Reports\BorrowDataView.rdlc", a1, a2);
        }

        if (Request.QueryString["bookstatus"] != null )
        {
            ArrayList a1 = new ArrayList();
            a1.Add("BookStatusView");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.BookStatusView(Request.QueryString["bookstatus"].ToString()));
            CreatePDF("كشف بحالة الكتب ", @"Reports\BookStatus.rdlc", a1, a2);
        }

        if (Request.QueryString["year"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("MostFrequentBooksYearly");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.MostFrequentBooksYearly(Request.QueryString["year"].ToString()));
            CreatePDF("الكتب الاكثر طلبا ", @"Reports\MostFrequentBooksYearly.rdlc", a1, a2);
        }

        if (Request.QueryString["lost"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("LostBooks");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.LostBooks());
            CreatePDF("الكتب المفقودة ", @"Reports\LostBooks.rdlc", a1, a2);
        }

        if (Request.QueryString["Notify"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("DelayNotification");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.DelayNotificationReport(Request.QueryString["Notify"].ToString()));
            CreatePDF("كشف تنبيهات المستعيرين المتاخرين ", @"Reports\DelayNotification.rdlc", a1, a2);
        }

        if (Request.QueryString["Registerfrom"] != null && Request.QueryString["Registerto"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("LibraryRegisterReport");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.LibraryRegisterReport(Request.QueryString["Registerfrom"].ToString(), Request.QueryString["Registerto"].ToString()));
            CreatePDF("كشف دخول المكتبة ", @"Reports\LibraryRegisterReport.rdlc", a1, a2);
        }

        //تسجيل المستفيدين(الاعارة)
        if (Request.QueryString["benficiaryID"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("BorrowerDataGet");
            a1.Add("ClientBorrowBookGet");
          
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.BorrowerDataGet(Request.QueryString["benficiaryID"].ToString()));
            a2.Add(DataAccess.ClientBorrowBookGet(Request.QueryString["benficiaryID"].ToString()));
          
            CreatePDF(" تسجيل المستفيدين", @"Reports\BorrowerRegistration.rdlc", a1, a2);
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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
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
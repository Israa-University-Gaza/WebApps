using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentBook : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lblStudentID.Text = Request.QueryString["id"];
        }
    }

    protected void btnBuyBook_Click(object sender, EventArgs e)
    {
        int x = 0;
        DataTable StudentBooks = new DataTable();
        StudentBooks.Columns.Add("BookName", typeof(string));
        StudentBooks.Columns.Add("BookPrice", typeof(int));

        foreach (ListViewItem item in ListView1.Items)
        {
            if (((CheckBox)item.FindControl("cbBuyBook")).Checked)
            {
                DataTable DT = DataAccess.BuyBook(lblStudentID.Text, ((Label)item.FindControl("BookID")).Text, EmployeeID);

                string bookname = ((Label)item.FindControl("lblBookName")).Text;
                string bookprice = ((Label)item.FindControl("lblBookPrice")).Text;

                DataRow r = StudentBooks.NewRow();
                r["BookName"] = bookname;
                r["BookPrice"] = int.Parse(bookprice);
                StudentBooks.Rows.Add(r);

                x++;
            }
        }
        ListView2.DataBind();
        ShowMsg1((x > 0) ? "تم قيد " + x + " كتب بنجاح" : "الرجاء إختيار الكتاب للحجز", (x > 0) ? "success" : "danger");

        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentBooks");
        a1.Add("dsStdStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(StudentBooks);
        a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

        CreatePDF("StudentBook_" + lblStudentID.Text, @"Financial\Reports\StudentBooksReport.rdlc", a1, a2);
    }


    protected void btnBookReport_Click(object sender, EventArgs e)
    {
        int x = 0;
        DataTable StudentBooks = new DataTable();
        StudentBooks.Columns.Add("BookName", typeof(string));
        StudentBooks.Columns.Add("BookPrice", typeof(int));

        foreach (ListViewItem item in ListView1.Items)
        {
            if (((CheckBox)item.FindControl("cbBuyBook")).Checked)
            {
                string bookname = ((Label)item.FindControl("lblBookName")).Text;
                string bookprice = ((Label)item.FindControl("lblBookPrice")).Text;

                DataRow r = StudentBooks.NewRow();
                r["BookName"] = bookname;
                r["BookPrice"] = int.Parse(bookprice);
                StudentBooks.Rows.Add(r);

                x++;
            }
        }
        ListView2.DataBind();
        ShowMsg1((x > 0) ? "تم قيد " + x + " كتب بنجاح" : "الرجاء إختيار الكتاب للحجز", (x > 0) ? "success" : "danger");

        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentBooks");
        a1.Add("dsStdStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(StudentBooks);
        a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

        CreatePDF("StudentBook_" + lblStudentID.Text, @"Financial\Reports\StudentBooksReport1.rdlc", a1, a2);
    }

    protected void btnDeleteStudentBook_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("StudentBookID")).Text;
        DataTable DT = DataAccess.DeleteStudentBook(id, EmployeeID);
        ListView2.DataBind();
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg2.Visible = (msg != "");
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
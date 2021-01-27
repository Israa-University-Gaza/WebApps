using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Books : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                DivFilter.Visible = false;
                lblContainerID.Text = Request.QueryString["ID"].ToString();
            }

            else
            {
                lblContainerID.Text = "";
                DivFilter.Visible = true;
            }
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        string ContainerID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ContainerID;
        Session["BookID"] = BookID;
        Response.Redirect("BookAddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("BookID")).Text;
        DataTable DT = NewDataAccess.BookDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbBorrowBook_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        string ContainerID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ContainerID;
        Session["BookID"] = BookID;
        Response.Redirect("BookBorrow.aspx");
    }

    protected void txtContainerNo1_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void txtContainerTitle_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbBookCopyAdd_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        string ContainerID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ContainerID;
        Session["BookCopyID"] = BookID;
        Response.Redirect("BookAddEdit.aspx");
    }

    protected void lbBookReport_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        string ContainerID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ContainerID;
        Session["BookID"] = BookID;
        Response.Redirect("BookBorrowDetails.aspx");
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

    protected void btnPrintQR_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetFilterdBooksQR");
        a1.Add("dsGetFilterdBooksQR1");
        a1.Add("dsGetFilterdBooksQR2");
        a1.Add("dsGetFilterdBooksQR3");
        a1.Add("dsGetFilterdBooksQR4");
        a1.Add("dsGetFilterdBooksQR5");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetFilterdBooksQR("",txtContainerNo.Text,txtBookNo.Text,txtISBN.Text,txtContainerTitle.Text,txtBookTitle.Text,"",txtPersonName.Text,txtPublisherYear.Text,"0"));
        a2.Add(NewDataAccess.GetFilterdBooksQR("", txtContainerNo.Text, txtBookNo.Text, txtISBN.Text, txtContainerTitle.Text, txtBookTitle.Text, "", txtPersonName.Text, txtPublisherYear.Text, "1"));
        a2.Add(NewDataAccess.GetFilterdBooksQR("", txtContainerNo.Text, txtBookNo.Text, txtISBN.Text, txtContainerTitle.Text, txtBookTitle.Text, "", txtPersonName.Text, txtPublisherYear.Text, "2"));
        a2.Add(NewDataAccess.GetFilterdBooksQR("", txtContainerNo.Text, txtBookNo.Text, txtISBN.Text, txtContainerTitle.Text, txtBookTitle.Text, "", txtPersonName.Text, txtPublisherYear.Text, "3"));
        a2.Add(NewDataAccess.GetFilterdBooksQR("", txtContainerNo.Text, txtBookNo.Text, txtISBN.Text, txtContainerTitle.Text, txtBookTitle.Text, "", txtPersonName.Text, txtPublisherYear.Text, "4"));
        a2.Add(NewDataAccess.GetFilterdBooksQR("", txtContainerNo.Text, txtBookNo.Text, txtISBN.Text, txtContainerTitle.Text, txtBookTitle.Text, "", txtPersonName.Text, txtPublisherYear.Text, "5"));
        CreatePDF("BookQRReport", @"Library/NewLibrary/Reports/BookQRReport.rdlc", a1, a2);
    }
}
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentVoucher : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    lblStudentID.Text = Request.QueryString["id"];
                    try
                    {
                        DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                        if (DT.Rows.Count > 0)
                        {
                            if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                            {
                                byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                                string imgString = Convert.ToBase64String(imgBytes);
                                image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                            }
                            else
                            {
                                image.Src = "../images/std.jpg";
                            }
                        }
                        else
                            Response.Redirect("~/Financial/Students.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("~/Financial/Students.aspx");
                    }
                }
                else
                    Response.Redirect("~/Financial/Students.aspx");
            }
            else if (lblStudentID.Text == "")
            {
                Response.Redirect("~/Financial/Students.aspx");
            }
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Response.Redirect("~/Financial/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
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

    protected void btnDeleteVoucherType1_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("VoucherID")).Text;
        DataTable DT = DataAccess.DeleteVoucher(id, EmployeeID);
        ListView1.DataBind();
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    protected void btnDeleteVoucherDetailsType1_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("VoucherDetailsID")).Text;
        DataTable DT = DataAccess.DeleteVoucherDetails(id, EmployeeID);
        ListView1.DataBind();
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    protected void btnDeleteVoucherType2_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("VoucherID")).Text;
        DataTable DT = DataAccess.DeleteVoucher(id, EmployeeID);
        ListView2.DataBind();
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    protected void btnDeleteVoucherDetailsType2_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("VoucherDetailsID")).Text;
        DataTable DT = DataAccess.DeleteVoucherDetails(id, EmployeeID);
        ListView2.DataBind();
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
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


    protected void btnPdf_Click(object sender, EventArgs e)
    {

        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("VoucherID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsVoucher");
        a1.Add("dsVoucherDetails");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetReceiptVoucher(Convert.ToInt32(id)));
        a2.Add(DataAccess.GetReceiptVoucherDetails(Convert.ToInt32(id)));

        CreatePDF("VoucherReport_" + lblStudentID.Text, @"Financial\Reports\ReceiptVoucherReport.rdlc", a1, a2);
    }

    protected void btnNote_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("VoucherID")).Text;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        Session["ID"] = ID;
        Session["StudentID"] = StudentID;
        Response.Redirect("StudentVoucherNote.aspx");
    }

}
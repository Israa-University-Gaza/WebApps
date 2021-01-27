using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentInstallmentOrder : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                lblStudentID.Text = Session["StudentID"].ToString();

                DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("~/Affairs/Students.aspx");
            }
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


    protected void lbInstallmentOrderEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("InstallmentOrderID")).Text;
        Session["OrderID"] = id;
        Response.Redirect("StudentInstallment.aspx");
    }

    protected void lbInstallmentOrderDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("InstallmentOrderID")).Text;
        DataTable DT = DataAccess.InstallmentOrderDelete(id, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView1.DataBind();
    }

    protected void lbInstallmentOrderPDF_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("InstallmentOrderID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStudentInstallmentOrder");
        a1.Add("dsGetStudentInstallmentBySemesterID");
        a1.Add("dsReportInstallmentInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentInstallmentOrder(lblStudentID.Text, ddlSemesterID.SelectedValue));
        a2.Add(DataAccess.GetStudentInstallmentBySemesterID(lblStudentID.Text, ddlSemesterID.SelectedValue));
        a2.Add(DataAccess.ReportInstallmentInfo(lblStudentID.Text));
        CreatePDF("InstallmentOrder_" + lblStudentID.Text, @"Affairs\Reports\InstallmentOrderReport.rdlc", a1, a2);
    }

    protected void lbStudentInstallmentEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("StudentInstallmentID")).Text;
        Session["StudentInstallmentID"] = id;

        string OrderID = ((Label)ListView1.Items[0].FindControl("InstallmentOrderID")).Text;
        Session["OrderID"] = OrderID;

        Response.Redirect("StudentInstallment.aspx");
    }

    protected void lbStudentInstallmentDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("StudentInstallmentID")).Text;
        DataTable DT = DataAccess.StudentInstallmentDelete(id, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView3.DataBind();
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg.Visible = (msg != "");
    }
    protected void lbStudentInstallmentAdd_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("InstallmentOrderID")).Text;
        Session["OrderID"] = id;
        Response.Redirect("StudentInstallment.aspx");
    }

    protected void lbInstallmentOrderPDF2_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStudentInstallmentOrder");

        a1.Add("dsReportInstallmentInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentInstallmentOrder(lblStudentID.Text, ddlSemesterID.SelectedValue));
        a2.Add(DataAccess.ReportInstallmentInfo(lblStudentID.Text));
        CreatePDF("PledgeCommitmentReport" + lblStudentID.Text, @"Affairs\Reports\PledgeCommitmentReport.rdlc", a1, a2);
    }

    protected void lbInstallmentOrderClosed_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("InstallmentOrderID")).Text;
        DataTable DT = DataAccess.SetInstallmentOrderClosed(id, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView3.DataBind();
    }
}
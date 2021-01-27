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

                if (Session["OrderID"] != null)
                {
                    lblOrderID.Text = Session["OrderID"].ToString();
                    Session["OrderID"] = null;
                    DataTable dt = DataAccess.InstallmentOrderGet(lblOrderID.Text);
                    if (dt.Rows.Count > 0)
                    {
                        lblStudentID.Text = dt.Rows[0]["StudentID"].ToString();
                        txtNumOfHours.Text = dt.Rows[0]["NumOfHours"].ToString();
                        txtPaidAmount.Text = dt.Rows[0]["PaidAmount"].ToString();
                        txtRemainingAmount.Text = dt.Rows[0]["RemainingAmount"].ToString();
                        txtLastFinancialPayment.Text= dt.Rows[0]["LastFinancialPayment"].ToString();
                    }
                }

                if (Session["StudentInstallmentID"] != null)
                {
                    lblInstallmentID.Text = Session["StudentInstallmentID"].ToString();
                    Session["StudentInstallmentID"] = null;
                    DataTable dt = DataAccess.StudentInstallmentGet(lblInstallmentID.Text);
                    if (dt.Rows.Count > 0)
                    {
                        txtInstallmentName.Text = dt.Rows[0]["InstallmentName"].ToString();
                        txtInstallmentValue.Text = dt.Rows[0]["InstallmentValue"].ToString();
                        txtInstallmentRepayDate.Text = dt.Rows[0]["RepayDate"].ToString();
                        txtInstallmentNotes.Text = dt.Rows[0]["Note"].ToString();
                        btnStudentInstallmentAddEdit.Text = "تعديل القسط المالي";
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


    protected void btnInstallmentOrderAddEdit_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { txtNumOfHours, txtPaidAmount, txtRemainingAmount });

        if (valid)
        {
            DataTable DT = DataAccess.InstallmentOrderAddEdit(lblOrderID.Text, lblStudentID.Text, txtNumOfHours.Text, txtPaidAmount.Text, txtRemainingAmount.Text, EmployeeID, txtGrantPercentage.Text, txtLastFinancialPayment.Text);
            lblOrderID.Text = DT.Rows[0]["OrderID"].ToString();
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء ادخال البيانات المطلوبة", "danger");
        }
    }

    protected void btnStudentInstallmentAddEdit_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { lblStudentID, txtInstallmentName, txtInstallmentValue, txtInstallmentRepayDate });
        if (Validate)
        {
            DataTable DT = DataAccess.StudentInstallmentAddEdit(lblInstallmentID.Text, lblStudentID.Text, txtInstallmentName.Text, txtInstallmentValue.Text, Convert.ToDateTime(txtInstallmentRepayDate.Text), "1", txtInstallmentNotes.Text, EmployeeID);
            ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            if (DT.Rows.Count > 0)
            {
                EmptyControls(new WebControl[] { txtInstallmentName, txtInstallmentValue, txtInstallmentNotes, txtInstallmentRepayDate });
                btnStudentInstallmentAddEdit.Text = "إضافة قسط مالي";
            }
        }
        else
        {
            ShowMsg2("الرجاء تعبئة الحقول المطلوبة بشكل صحيح", "danger");
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

    protected void btnInstallmentOrderPDF_Click(object sender, EventArgs e)
    {

        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStudentInstallmentOrder");
        a1.Add("dsGetStudentInstallmentBySemesterID");
        a1.Add("dsReportInstallmentInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentInstallmentOrder(lblStudentID.Text, "8"));
        a2.Add(DataAccess.GetStudentInstallmentBySemesterID(lblStudentID.Text, "8"));
        a2.Add(DataAccess.ReportInstallmentInfo(lblStudentID.Text));
        CreatePDF("InstallmentOrder_" + lblStudentID.Text, @"Affairs\Reports\InstallmentOrderReport.rdlc", a1, a2);
    }

    protected void btnInstallmentOrderPDF2_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStudentInstallmentOrder");

        a1.Add("dsReportInstallmentInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentInstallmentOrder(lblStudentID.Text, "8"));
        a2.Add(DataAccess.ReportInstallmentInfo(lblStudentID.Text));
        CreatePDF("PledgeCommitmentReport" + lblStudentID.Text, @"Affairs\Reports\PledgeCommitmentReport.rdlc", a1, a2);
    }
}
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Affairs_Student : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                lblEmployeeID.Text = EmployeeID;
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

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("~/Affairs/Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    protected void btnAddScholarship_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { lblStudentID, ddlAction, ddlSemester2 });
        if (Validate)
        {
            DataTable DT = DataAccess.AddAffairsScholarship(lblStudentID.Text, ddlAction.SelectedValue, ddlSemester2.SelectedValue, "", EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            }
        }
        else
        {
            ShowMsg2("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
        OpenTab(2);
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentScholarshipID")).Text;

        if (DataAccess.DeleteScholarship(id, EmployeeID) > 0)
        {
            ListView1.DataBind();
            ShowMsg3("تم الحذف بنجاح.", "success");
        }
        else
        {
            ShowMsg3("عذرًا , لم يتم الحذف.", "danger");
        }
        OpenTab(3);
    }

    protected void btnAddLoan_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlSemesterLoan, lblStudentID, ddlActionLoan, txtLoanValue, txtRequestDate, txtRepayDate, txtNoteLoan });
        if (Validate)
        {
            DataTable DT = DataAccess.AddLoan(ddlSemesterLoan.SelectedValue, lblStudentID.Text, ddlActionLoan.SelectedValue, txtLoanValue.Text, txtNoteLoan.Text, txtRequestDate.Text, txtRepayDate.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowMsg4(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            }
        }
        else
        {
            ShowMsg4("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
        OpenTab(4);
    }

    protected void lbDeleteLoan_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentLoanID")).Text;

        if (DataAccess.DeleteLoan(id, EmployeeID) > 0)
        {
            ListView2.DataBind();
            ShowMsg5("تم الحذف بنجاح.", "success");
        }
        else
        {
            ShowMsg5("عذرًا , لم يتم الحذف.", "danger");
        }
        OpenTab(5);
    }


    protected void btnAddInstallment_Click(object sender, EventArgs e)
    {
        //bool Validate = ValidateControls(new WebControl[] { ddlSemesterInstallment, lblStudentID, txtInstallmentName, txtInstallmentValue, txtInstallmentRequestDate, txtInstallmentRepayDate, txtInstallmentNotes });
        //if (Validate)
        //{
        //    DataTable DT = DataAccess.AddInstallment(ddlSemesterInstallment.SelectedValue, lblStudentID.Text, txtInstallmentName.Text, txtInstallmentValue.Text, txtInstallmentRequestDate.Text, txtInstallmentRepayDate.Text, "1", txtInstallmentNotes.Text, EmployeeID);
        //    if (DT.Rows.Count > 0)
        //    {
        //        ShowMsg6(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        //    }
        //}
        //else
        //{
        //    ShowMsg6("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        //}
        //OpenTab(6);
    }

    protected void lbDeleteInstallment_Click(object sender, EventArgs e)
    {
        //ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        //string id = ((Label)item.FindControl("StudentInstallmentID")).Text;

        //DataTable DT = DataAccess.DeleteInstallment(id,EmployeeID);
        //if (DT.Rows.Count > 0)
        //{
        //    ListView3.DataBind();
        //    ShowMsg7(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        //}
        //OpenTab(7);
    }

    protected void lbShowIssueReportPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStudentShowIssueReportInfo");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentShowIssueReportInfo(lblStudentID.Text));
        CreatePDF("ShowIssueReport" + lblStudentID.Text, @"Affairs\Reports\ShowIssue.rdlc", a1, a2);
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

 public void CreatePdfFromList(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (IEnumerable)DTArray[i]);
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


    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetStudentMobile(lblStudentID.Text);
        bool sendStatus = SendSMS(DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text);
        DataAccess.StdMessageAdd(EmployeeID, lblStudentID.Text, DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text, sendStatus);
        ShowMsg10((sendStatus) ? "تم إرسال الرسالة بنجاح" : "لم يتم إرسال الرسالة", (sendStatus) ? "success" : "danger");
        OpenTab(10);
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg2.Visible = (msg != "");
    }
    public void ShowMsg3(string msg = "", string status = "warning")
    {
        lblMsg3.Text = msg;
        divMsg3.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg3.Visible = (msg != "");
    }
    public void ShowMsg4(string msg = "", string status = "warning")
    {
        lblMsg4.Text = msg;
        divMsg4.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg4.Visible = (msg != "");
    }
    public void ShowMsg5(string msg = "", string status = "warning")
    {
        lblMsg5.Text = msg;
        divMsg5.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg5.Visible = (msg != "");
    }
    public void ShowMsg6(string msg = "", string status = "warning")
    {
        lblMsg6.Text = msg;
        divMsg6.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg6.Visible = (msg != "");
    }
    public void ShowMsg7(string msg = "", string status = "warning")
    {
        lblMsg7.Text = msg;
        divMsg7.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg7.Visible = (msg != "");
    }
    public void ShowMsg10(string msg = "", string status = "warning")
    {
        lblMsg10.Text = msg;
        divMsg10.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg10.Visible = (msg != "");
    }

    public void ShowMsg11(string msg = "", string status = "warning")
    {
        lblMsg11.Text = msg;
        divMsg11.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg11.Visible = (msg != "");
    }

    void OpenTab(int i)
    {
        litab1.Attributes.Add("class", (i == 1) ? "active" : "");
        litab2.Attributes.Add("class", (i == 2) ? "active" : "");
        litab3.Attributes.Add("class", (i == 3) ? "active" : "");
        litab4.Attributes.Add("class", (i == 4) ? "active" : "");
        litab5.Attributes.Add("class", (i == 5) ? "active" : "");
        //litab6.Attributes.Add("class", (i == 6) ? "active" : "");
        //litab7.Attributes.Add("class", (i == 7) ? "active" : "");
        //litab8.Attributes.Add("class", (i == 8) ? "active" : "");
        //litab9.Attributes.Add("class", (i == 9) ? "active" : "");
        litab10.Attributes.Add("class", (i == 10) ? "active" : "");

        tab1.Attributes.Add("class", (i == 1) ? "tab-pane active" : "tab-pane");
        tab2.Attributes.Add("class", (i == 2) ? "tab-pane active" : "tab-pane");
        tab3.Attributes.Add("class", (i == 3) ? "tab-pane active" : "tab-pane");
        tab4.Attributes.Add("class", (i == 4) ? "tab-pane active" : "tab-pane");
        tab5.Attributes.Add("class", (i == 5) ? "tab-pane active" : "tab-pane");
        //tab6.Attributes.Add("class", (i == 6) ? "tab-pane active" : "tab-pane");
        //tab7.Attributes.Add("class", (i == 7) ? "tab-pane active" : "tab-pane");
        //tab8.Attributes.Add("class", (i == 8) ? "tab-pane active" : "tab-pane");
        //tab9.Attributes.Add("class", (i == 9) ? "tab-pane active" : "tab-pane");
        tab10.Attributes.Add("class", (i == 10) ? "tab-pane active" : "tab-pane");
        tab11.Attributes.Add("class", (i == 11) ? "tab-pane active" : "tab-pane");
    }

    protected void btnFreeFrom_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { lblStudentID, txtNot, ddlSemester3 });
        if (Validate)
        {
            DataTable DT = DataAccess.StudentsFreeFromTwentyPercCondAPIAdd(lblStudentID.Text, ddlSemester3.SelectedValue, txtNot.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowMsg11(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            }
        }
        else
        {
            ShowMsg11("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
        OpenTab(11);
    }

    protected void ddlSemesterID1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSemesterID1.SelectedValue != null)
        {
            DataTable dt = DataAccess.GetStdCoursesHourNum(lblStudentID.Text, ddlSemesterID1.SelectedValue);
            txtTheoreCourseHours.Text = dt.Rows[0]["TheoreticalSemesterRegistCourseHours"].ToString();
            txtPracticCourseHours.Text = dt.Rows[0]["PracticalSemesterRegistCourseHours"].ToString();
        }
    }

protected void lbStdValnteerHourReportPDF_OnClick(object Sender, EventArgs E)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsModelReport");
        var data = DataAccess.GetStudentInfo(lblStudentID.Text);
        List<StudentDto> result = new List<StudentDto>();
        result.Add(data);
        ArrayList a2 = new ArrayList();
        a2.Add(result);
        CreatePdfFromList("StudentVolunteer", @"Affairs\Reports\StudentVolunteer.rdlc", a1, a2);
    }
}
using System;
using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Data;
using System.IO;
using System.Reflection;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admission_Student : UserPage
{


    protected void Page_Load(object sender, EventArgs e)
    {

       // ((LinkButton)StudentSideBar.FindControl("LinkButton10")).Click += new EventHandler(LinkButton10_OnClick);

        if (!IsPostBack)
        {
            try
            {


                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {


                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    DataTable DT1 = DataAccess.GetEmployeeData(EmployeeID);
                    lblEmployeeName.Text = DT1.Rows[0]["DisplayName"].ToString();

                    lblStudentID.Text = Request.QueryString["id"].ToString();



                    //! ddls

                    DataTable dt = DataAccess.GetStdSemesterWithoutTrans(Convert.ToInt32(lblStudentID.Text));

                    ddlSemester_3.DataSource = dt;
                    ddlSemester_3.DataBind();


                    ddlStdSemester21.DataSource = dt;
                    ddlStdSemester21.DataBind();

                    ddlStdSemester1.DataSource = dt;
                    ddlStdSemester1.DataBind();

                    //! ddls


                }
                else
                    Response.Redirect("~/Admission/Students.aspx");

                if (Request.QueryString["tab"] == null) return;
                int tab = Convert.ToInt32(Request.QueryString["tab"]);
                OpenTabOut(tab);


            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }

        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }
    protected void lbStudyTablePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdStudyTable");
        a1.Add("dsStdStudyTableInfo");
        a1.Add("dsStdStudyTableExamTable");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdStudyTableReport(lblStudentID.Text, cbCopyNo.Checked));
        DataTable dt = DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text);
        a2.Add(dt);

        a2.Add(DataAccess.GetStdStudyTableExamTableReport(lblStudentID.Text));

        CreatePDF("StudyTable_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\StdStudyTableReport.rdlc", a1, a2);
    }

    protected void lbStudentMark_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMGetStdSemesterMarksReport");
        a1.Add("dsGetStdSemesterMarksInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MGetStdSemesterMarksReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdSemesterMarksInfo(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("CStudentMark_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\StudentCMarksTable.rdlc", a1, a2);
    }

    protected void lbRevision_Click(object sender, EventArgs e)
    {
        //RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        //string id = ((Label)ri.FindControl("StdSectionID")).Text;
        //DataTable DT = DataAccess.Mid(id);
        //ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        //{
        //    Repeater1.DataBind();
        //}
    }

    //protected void btnChechStudent_Click(object sender, EventArgs e)
    //{
    //    DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
    //    if (DT.Rows.Count > 0)
    //    {
    //        Response.Redirect("~/Admission/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
    //    }
    //    else
    //    {
    //        ShowToast(this, "رقم الطالب غير صحيح", "", "error");
    //    }
    //}
    protected void lbPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdPlanReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdPlanReport(lblStudentID.Text));

        CreatePDF("StdPlan", @"Admission\Reports\StdPlanReport.rdlc", a1, a2);
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

    private void CreatePDF1(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray, string EmployeeName)
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


        ReportParameter p1 = new ReportParameter("EmployeeName", EmployeeName);

        viwer.LocalReport.SetParameters(new ReportParameter[] { p1 });

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

    protected void btnRegisterBlock_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.RegisterBlockCourses(lblStudentID.Text, EmployeeID,"1");
        ShowMsg8(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        OpenTab(8);
        Repeater1.DataBind();
        Repeater2.DataBind();
        Repeater3.DataBind();
        Repeater4.DataBind();
        Repeater5.DataBind();
        // Repeater6.DataBind();
        Repeater7.DataBind();
        Repeater8.DataBind();
        Repeater10.DataBind();
    }

    protected void btnDocumentUpload_Click(object sender, EventArgs e)
    {
        //try
        //{
        string filename = txtDocumentLink.Text;
        if (fuDocument.HasFile)
        {
            filename = Guid.NewGuid() + "_" + Path.GetFileName(fuDocument.FileName);
            fuDocument.SaveAs(Server.MapPath("~/Document/Student/") + filename);
        }

        if (File.Exists(Server.MapPath("~/Document/Student/") + filename))
        {
            DataTable DT = DataAccess.StdDocumentAddEdit(lblStdDocumentID.Text, ddlStdDocumentType.SelectedValue, filename, lblStudentID.Text, EmployeeID);
            EmptyControls(new WebControl[] { lblStdDocumentID, txtDocumentLink });

            DataTable dt = DataAccess.GetStdDocument(Convert.ToInt32(lblStudentID.Text));

            ListView1.DataSource = dt;
            ListView1.DataBind();
            ShowMsg8(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        }
        else
        {
            ShowMsg7("لم يتم رفع المستند ,,, الرجاء إعادة المحاولة", "danger");
        }
        // }
        //catch (Exception ex)
        //{
        //    ShowMsg7("لم يتم رفع المستند ,,, الرجاء إعادة المحاولة", "danger");
        //}
        OpenTab(7);
    }

    void OpenTab(int i)
    {
        //litab1.Attributes.Add("class", (i == 1) ? "active" : "");


        //litab2.Attributes.Add("class", (i == 2) ? "active" : "");

        //litab3.Attributes.Add("class", (i == 3) ? "active" : "");
        //litab4.Attributes.Add("class", (i == 4) ? "active" : "");
        //litab5.Attributes.Add("class", (i == 5) ? "active" : "");
        //litab6.Attributes.Add("class", (i == 6) ? "active" : "");
        //litab7.Attributes.Add("class", (i == 7) ? "active" : "");

        //litab8.Attributes.Add("class", (i == 8) ? "active" : "");

        //litab9.Attributes.Add("class", (i == 9) ? "active" : "");
        //litab10.Attributes.Add("class", (i == 10) ? "active" : "");
        //((HtmlControl)StudentSideBar.FindControl("litab10")).Attributes.Add("class", (i == 10) ? "active" : "");
        //litab11.Attributes.Add("class", (i == 11) ? "active" : "");
        //litab12.Attributes.Add("class", (i == 12) ? "active" : "");
        //litab13.Attributes.Add("class", (i == 13) ? "active" : "");
        //litab14.Attributes.Add("class", (i == 14) ? "active" : "");
        //litab16.Attributes.Add("class", (i == 16) ? "active" : "");
        //litab20.Attributes.Add("class", (i == 20) ? "active" : "");
        //litab21.Attributes.Add("class", (i == 21) ? "active" : "");
        //litab22.Attributes.Add("class", (i == 22) ? "active" : "");
        //litab23.Attributes.Add("class", (i == 23) ? "active" : "");

        tab1.Attributes.Add("class", (i == 1) ? "tab-pane active" : "tab-pane");
        tab2.Attributes.Add("class", (i == 2) ? "tab-pane active" : "tab-pane");
        tab3.Attributes.Add("class", (i == 3) ? "tab-pane active" : "tab-pane");
        tab4.Attributes.Add("class", (i == 4) ? "tab-pane active" : "tab-pane");
        tab5.Attributes.Add("class", (i == 5) ? "tab-pane active" : "tab-pane");
        tab6.Attributes.Add("class", (i == 6) ? "tab-pane active" : "tab-pane");
        tab7.Attributes.Add("class", (i == 7) ? "tab-pane active" : "tab-pane");
        tab8.Attributes.Add("class", (i == 8) ? "tab-pane active" : "tab-pane");
        tab9.Attributes.Add("class", (i == 9) ? "tab-pane active" : "tab-pane");
        tab10.Attributes.Add("class", (i == 10) ? "tab-pane active" : "tab-pane");
        tab11.Attributes.Add("class", (i == 11) ? "tab-pane active" : "tab-pane");
        tab12.Attributes.Add("class", (i == 12) ? "tab-pane active" : "tab-pane");
        tab13.Attributes.Add("class", (i == 13) ? "tab-pane active" : "tab-pane");
        tab14.Attributes.Add("class", (i == 14) ? "tab-pane active" : "tab-pane");
        tab15.Attributes.Add("class", (i == 15) ? "tab-pane active" : "tab-pane");
        tab16.Attributes.Add("class", (i == 16) ? "tab-pane active" : "tab-pane");
        tab20.Attributes.Add("class", (i == 20) ? "tab-pane active" : "tab-pane");
        tab21.Attributes.Add("class", (i == 21) ? "tab-pane active" : "tab-pane");
        tab22.Attributes.Add("class", (i == 22) ? "tab-pane active" : "tab-pane");
        tab23.Attributes.Add("class", (i == 23) ? "tab-pane active" : "tab-pane");
    }

    void OpenTabOut(int i)
    {
        Type thisType = this.GetType();
        MethodInfo theMethod = thisType.GetMethod("LinkButton"+i+"_OnClick",BindingFlags.Instance | BindingFlags.NonPublic, null, new Type[] { typeof(LinkButton) , typeof(EventArgs) }, null);
        theMethod.Invoke(this, new object[] { ((LinkButton)StudentSideBar.FindControl("LinkButton" + i.ToString())), EventArgs.Empty });
    }

    public void ShowMsg5(string msg = "", string status = "warning")
    {
        lblMsg5.Text = msg;
        divMsg5.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg5.Visible = (msg != "");
    }

    public void ShowMsg7(string msg = "", string status = "warning")
    {
        lblMsg7.Text = msg;
        divMsg7.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg7.Visible = (msg != "");
    }

    public void ShowMsg8(string msg = "", string status = "warning")
    {
        lblMsg8.Text = msg;
        divMsg8.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg8.Visible = (msg != "");
    }

    public void ShowMsg9(string msg = "", string status = "warning")
    {
        lblMsg9.Text = msg;
        divMsg9.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg9.Visible = (msg != "");
    }

    public void ShowMsg10(string msg = "", string status = "warning")
    {
        lblMsg10.Text = msg;
        divMsg10.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg10.Visible = (msg != "");
    }

    public void ShowMsg12(string msg = "", string status = "warning")
    {
        lblMsg12.Text = msg;
        divMsg12.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg12.Visible = (msg != "");
    }

    public void ShowMsg13(string msg = "", string status = "warning")
    {
        lblMsg13.Text = msg;
        divMsg13.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg13.Visible = (msg != "");
    }
    public void ShowMsg14(string msg = "", string status = "warning")
    {
        lblMsg14.Text = msg;
        divMsg14.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg14.Visible = (msg != "");
    }

    public void ShowMsg20(string msg = "", string status = "warning")
    {
        lblMsg20.Text = msg;
        divMsg20.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg20.Visible = (msg != "");
    }

    public void ShowMsg21(string msg = "", string status = "warning")
    {
        lblMsg21.Text = msg;
        divMsg21.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg21.Visible = (msg != "");
    }

    protected void lbStdDocumentEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StdDocumentID")).Text;
        DataTable DT = DataAccess.StdDocumentGet(id);
        if (DT.Rows.Count > 0)
        {
            lblStdDocumentID.Text = id;
            ddlStdDocumentType.DataBind();
            ddlStdDocumentType.SelectedValue = DT.Rows[0]["StdDocumentTypeID"].ToString();
            txtDocumentLink.Text = DT.Rows[0]["DocumentLink"].ToString();

            DataTable dt = DataAccess.GetStdDocument(Convert.ToInt32(lblStudentID.Text));
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        OpenTab(7);
    }

    protected void lbStdDocumentDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StdDocumentID")).Text;

        if (DataAccess.StdDocumentDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");

            DataTable dt = DataAccess.GetStdDocument(Convert.ToInt32(lblStudentID.Text));
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }

        OpenTab(7);

    }
    protected void lbStdResetPassword_Click(object sender, EventArgs e)
    {
        DataAccess.StdResetPassword(lblStudentID.Text);
        //DataTable DT = DataAccess.GetEmailStudent(lblStudentID.Text);
        //SendEmail(DT.Rows[0]["Email"].ToString(), "info@israa.edu.ps", "جامعة الإسراء - تغيير كلمة المرور ", "كلمة المرور : " + lblStudentID.Text);
        ShowToast(this, "تم تغير كلمة المرور بنفس رقم الطالب", "success");
    }

    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetStudentMobile(lblStudentID.Text);
        bool sendStatus = SendSMS(DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text);
        DataAccess.StdMessageAdd(EmployeeID, lblStudentID.Text, DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text, sendStatus);
        ShowMsg9((sendStatus) ? "تم إرسال الرسالة بنجاح" : "لم يتم إرسال الرسالة", (sendStatus) ? "success" : "danger");
        OpenTab(9);
    }
    protected void lbCertificateRegistrationReportPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsCertificateRegistration");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetCertificateRegistrationReport(lblStudentID.Text, EmployeeID));


        CreatePDF("CertificateRegistration_" + lblStudentID.Text, @"Admission\Reports\CertificateRegistrationReport.rdlc", a1, a2);
    }
    protected void lbCardOneDayPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

        CreatePDF1("CardOneDay", @"Admission\Reports\CardOneDay.rdlc", a1, a2, lblEmployeeName.Text);
    }
    protected void lbUNRWAModelPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsUNRWAModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUNRWAModelReport(lblStudentID.Text));

        CreatePDF("UNRWAModel", @"Admission\Reports\UNRWAModel.rdlc", a1, a2);
    }

    protected void btnAcridiateStudent_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlDepartment }))
        {
            DataTable DT = DataAccess.AccreditTransferStudent(lblStudentID.Text, ddlDepartment.SelectedValue, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                bool sendStatus = SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
                DataAccess.StdMessageAdd(EmployeeID, lblStudentID.Text, DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString(), sendStatus);

                ShowMsg10(DT.Rows[0]["msg"].ToString(), "success");
            }
            else
            {
                ShowMsg10(DT.Rows[0]["msg"].ToString(), "danger");
            }
        }
        else
        {
            ShowMsg10("يجب اختيار القسم", "danger");
        }
    }
    protected void btnDelaySemester_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlStdSemester3 }))
        {
            DataTable DT = DataAccess.DelaySemester(ddlStdSemester3.SelectedValue, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ShowMsg10(DT.Rows[0]["msg"].ToString(), "success");
            }
            else
            {
                ShowMsg10(DT.Rows[0]["msg"].ToString(), "danger");
            }
        }
        else
        {
            ShowMsg10("يجب اختيار الفصل الدراسي", "danger");
        }
    }
    protected void lbTransferModelPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF1("TransferModel", @"Admission\Reports\TransferModel.rdlc", a1, a2, lblEmployeeName.Text);
    }
    protected void lbAdmissionAppPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdAdmissionAppDataReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdAdmissionAppDataReport(lblStudentID.Text, EmployeeID));

        CreatePDF("AdmissionApp", @"Admission\Reports\AdmissionApp.rdlc", a1, a2);
    }
    protected void lbFinancialBenefitPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdFinancialReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdFinancialReport(lblStudentID.Text, lblEmployeeID.Text));
        CreatePDF("FinancialBenefit", @"Admission\Reports\FinancialBenefit.rdlc", a1, a2);
    }

    protected void lbStdTransformationCourses_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUnaccrediteETransformation(lblStudentID.Text));

        CreatePDF("StdTransformationCourses", @"Admission\Reports\UnAccrediteETransformation.rdlc", a1, a2);
    }

    protected void lbTestimony_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("GetTestimonyReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetTestimonyReport(lblStudentID.Text));

        CreatePDF("TestimonyReport", @"Admission\Reports\TestimonyReport.rdlc", a1, a2);
    }
    protected void lbCertificate_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdAdmissionAppReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdAdmissionAppDataReport(lblStudentID.Text, EmployeeID));

        CreatePDF("Certificate", @"Admission\Reports\Certificate.rdlc", a1, a2);
    }
    protected void lbRegistrationHoursHigherAllowableLimit_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF("RegistrationHoursHigherAllowableLimit", @"Admission\Reports\RegistrationHoursHigherAllowableLimit.rdlc", a1, a2);
    }
    protected void lbCourseRegistrationDesk_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF("CourseRegistrationDesk", @"Admission\Reports\CourseRegistrationDesk.rdlc", a1, a2);
    }
    protected void lbRegistrationWithdrawalExceptionalCourses_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF("RegistrationWithdrawalExceptionalCourses", @"Admission\Reports\RegistrationWithdrawalExceptionalCourses.rdlc", a1, a2);
    }
    protected void lbShowingStudentIssue_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF("ShowingStudentIssue", @"Admission\Reports\ShowingStudentIssue.rdlc", a1, a2);
    }
    protected void lbTestimonyGraduate_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdAdmissionAppDataReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdAdmissionAppDataReport(lblStudentID.Text, EmployeeID));

        CreatePDF("TestimonyGraduate", @"Admission\Reports\TestimonyGraduate.rdlc", a1, a2);
    }
    protected void lbComprehensiveCertificate_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("ComprehensiveCertificateReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetComprehensiveCertificate(lblStudentID.Text, EmployeeID));
        CreatePDF("ComprehensiveCertificate", @"Admission\Reports\ComprehensiveCertificateReport.rdlc", a1, a2);
    }
    protected void lbAccrediteETransformation_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAccrediteETransformation(lblStudentID.Text));

        CreatePDF("AccrediteETransformation", @"Admission\Reports\AccrediteETransformation.rdlc", a1, a2);
    }

    protected void btnSaveStudentCondition_Click(object sender, EventArgs e)
    {
        if (Repeater12.Items.Count > 0)
        {
            foreach (RepeaterItem item in Repeater12.Items)
            {
                Label AdmissionConditionID = (Label)item.FindControl("lblAdmissionConditionID");
                CheckBox cbIsValidate = (CheckBox)item.FindControl("cbIsValidate");
                TextBox txtNotes = (TextBox)item.FindControl("txtNotes");
                DataAccess.SetStudentCondition(lblStudentID.Text, AdmissionConditionID.Text, cbIsValidate.Checked, txtNotes.Text, EmployeeID);
            }
            //todo islam: why rebind repeater2 !
            Repeater2.DataBind();
            ShowMsg12("تم اعتماد الشروط بنجاح", "success");
        }
        else
        {
            ShowMsg12("الرجاء اختيار الشروط المتحققة لدي الطالب", "danger");
        }
        OpenTab(12);
    }

    //protected void btnReturnAdmissionStudent_Click(object sender, EventArgs e)
    //{
    //    DataTable DT = DataAccess.ReturnAdmissionStudent(lblStudentID.Text, txtReturnAdmissionNotes.Text, EmployeeID);
    //    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
    //}
    protected void btnChangeStudentType_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlStudentType, txtchangeTypeNote }))
        {
            DataTable DT = DataAccess.ChangeStudentType(lblStudentID.Text, ddlStudentType.SelectedValue, txtchangeTypeNote.Text, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ShowMsg13(DT.Rows[0]["msg"].ToString(), "success");
            }
            else
            {
                ShowMsg13(DT.Rows[0]["msg"].ToString(), "danger");
            }
        }
        else
        {
            ShowMsg13("يجب اختيار نوع الطالب", "danger");
        }
        OpenTab(13);
    }

    protected void lbAddCertificateRegistrationCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddCertificateRegistrationCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }
    protected void lblAttendanceWarning_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("AttendanceWarningID")).Text;
        string type = ((Label)item.FindControl("WarningTypeID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsAttendanceWarning");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAttendanceWarning(id));

        CreatePDF("AttendanceWarning", (type == "1") ? @"Admission\Reports\AttendanceWarning.rdlc" : @"Admission\Reports\AttendanceFinalWarning.rdlc", a1, a2);
    }

    protected void lbAddCardOneDayCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddCardOneDayCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }
    protected void btnChangeStudentStatus_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlStudentStatus, txtChangeStatusNote }))
        {
            // by RSR DataTable DT = DataAccess.ChangeStudentStatus(lblStudentID.Text, ddlStudentStatus.SelectedValue, txtChangeStatusNote.Text, EmployeeID);
           // by RSR ShowMsg14(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            // by RSR Repeater10.DataBind();
        }
        else
        {
            ShowMsg14("يجب اختيار نوع الطالب", "danger");
        }
        OpenTab(13);
    }

    protected void lbAddReplacementStudentCardCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddReplacementStudentCardCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbMidtermRevision_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        Label StdSectionID = (Label)item.FindControl("StdSectionID");

        DataTable DT = DataAccess.SetStdSectionMidtermMarkRevision(StdSectionID.Text, EmployeeID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        Repeater4.DataBind();
        OpenTab(5);
    }

    protected void lbFinalRevision_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        Label StdSectionID = (Label)item.FindControl("StdSectionID");

        DataTable DT = DataAccess.SetStdSectionMarkRevision(StdSectionID.Text, EmployeeID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        Repeater4.DataBind();
        OpenTab(5);
    }

    //protected void lbRevision_Click2(object sender, EventArgs e)
    //{
    //    RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
    //    Label StdSectionID = (Label)item.FindControl("StdSectionID");

    //    DataTable DT = DataAccess.SetStdSectionMidtermMarkRevision(StdSectionID.Text, EmployeeID);
    //    ShowMsg5(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    //    Repeater4.DataBind();
    //    OpenTab(5);
    //}

    protected void lbStudentMarkTableCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentMarkTableCostCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbUNRWAModeCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddUNRWAModeCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbAddExamTableCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddExamTableCost(lblStudentID.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbCaseStudyPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("CaseStudyReportPersonalInformation");
        a1.Add("CaseStudyReportAcademicInformation");
        a1.Add("CaseStudyReportFinancialInformation");
        a1.Add("CaseStudy_StudentAttendanceWarningReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.CaseStudy_PersonalInformationReport(lblStudentID.Text));
        a2.Add(DataAccess.CaseStudy_AcademicInformationReport(lblStudentID.Text));
        a2.Add(DataAccess.CaseStudy_FinancialInformationReport(lblStudentID.Text));
        a2.Add(DataAccess.CaseStudy_StudentAttendanceWarningReport(lblStudentID.Text));

        CreatePDF("CaseStudyReport", @"Admission\Reports\CaseStudyReport.rdlc", a1, a2);
    }

    protected void lbClearancePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("ClearanceReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.ClearanceReport(lblStudentID.Text));
        CreatePDF("ClearanceReport", @"Admission\Reports\Clearance.rdlc", a1, a2);
    }

    protected void lbEnCertificateRegistrationReportPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("CertificateRegistration");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.ECertificateRegistrationReport(lblStudentID.Text, EmployeeID));
        CreatePDF("ECertificateRegistration", @"Admission\Reports\ECertificateRegistration.rdlc", a1, a2);
    }

    protected void lbMidtermExamsSchedulePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("MidtermExamsSchedule");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MidtermExamsScheduleReport(lblStudentID.Text, EmployeeID));
        CreatePDF("MidtermExamsSchedule", @"Admission\Reports\MidtermExamsSchedule.rdlc", a1, a2);
    }

    protected void lbAcademicAdvisingPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetAcademicAdvisingReport1");
        a1.Add("dsGetAcademicAdvisingReport2");
        a1.Add("dsGetAcademicAdvisingReport3");
        a1.Add("dsGetAcademicAdvisingReport4");
        a1.Add("dsGetAcademicAdvisingReport5");
        a1.Add("dsGetAcademicAdvisingReport6");
        a1.Add("dsGetAcademicAdvisingReport7");
        a1.Add("dsGetAcademicAdvisingReport8");
        a1.Add("dsGetAcademicAdvisingReport9");
        a1.Add("dsGetAcademicAdvisingReport10");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "1"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "2"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "3"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "4"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "5"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "6"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "7"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "8"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "9"));
        a2.Add(DataAccess.GetAcademicAdvisingReport(lblStudentID.Text, "10"));
        CreatePDF("AcademicAdvising", @"Admission\Reports\AcademicAdvising.rdlc", a1, a2);
    }

    protected void lbFinalExamsSchedulePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetFinalExamsSchedule");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.FinalExamsScheduleReport(lblStudentID.Text, EmployeeID));
        CreatePDF("FinalExamsSchedule", @"Admission\Reports\FinalExamsSchedule.rdlc", a1, a2);
    }

    protected void lbAddFinancialBenefitCost_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentReportCost(lblStudentID.Text, "67", EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void btnSaveFileNumber_Click(object sender, EventArgs e)
    {
        //if (IntValidateControls(new WebControl[] { txtFileNumber }))
        //{
        DataTable DT = DataAccess.UpdateStudentFileNumber(lblStudentID.Text, txtFileNumber.Text);
        ShowMsg7(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        //}
        //else
        //{
        //    ShowMsg7("الرجاء تعبئة الحقول المطلوبة بشكل صحيح .", "danger");
        //}

        OpenTab(7);
    }

    protected void lbObservationMarkPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsObservationMark");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.ObservationMark(lblStudentID.Text));
        CreatePDF("ObservationMarkPDF", @"Admission\Reports\ObservationMark.rdlc", a1, a2);
    }

    protected void lbAccreditationStudentMark_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMGetStdSemesterMarksReport");
        a1.Add("dsStdSemesterMarksInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MGetStdSemesterMarksReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdSemesterMarksInfo(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("StudentMark_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\StudentCMarksTable.rdlc", a1, a2);
    }



    protected void lbUnaccreditationStudentMark_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMGetStdSemesterMarksReport");
        a1.Add("dsStdSemesterMarksInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MGetStdSemesterMarksReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdSemesterMarksInfo(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("StudentMark_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\StudentMarksTable.rdlc", a1, a2);
    }

    protected void lbAccreditationStudentMarkEn_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMGetStdSemesterMarksEReport");
        a1.Add("dsGetStdSemesterMarksEInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MGetStdSemesterMarksEReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdSemesterMarksEInfo(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("CStudentMark_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\ECStudentMarksTable.rdlc", a1, a2);
    }
    protected void lbUnaccreditationStudentMarkEn_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMGetStdSemesterMarksEReport");
        a1.Add("dsGetStdSemesterMarksEInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.MGetStdSemesterMarksEReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdSemesterMarksEInfo(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("StudentMark_" + dt.Rows[0]["StudentNo"].ToString(), @"Admission\Reports\EStudentMarksTable.rdlc", a1, a2);
    }

    protected void SampleAuditInformationPDF_Click(object sender, EventArgs e)
    {

        ArrayList a1 = new ArrayList();
        a1.Add("dsGetSampleAuditInformation");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSampleAuditInformation(lblStudentID.Text));
        CreatePDF("SampleAuditInformation", @"Admission\Reports\SampleAuditInformation.rdlc", a1, a2);
    }

    protected void lbAccreditationStudentTranscript_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetAccreditStdTranscriptReport");
        a1.Add("dsGetAccreditStdTranscriptReport1");
        a1.Add("dsGetAccreditStdTranscriptReport2");
        a1.Add("dsGetAccreditStdTranscriptReport3");
        a1.Add("dsGetAccreditStdTranscriptReport4");
        a1.Add("dsGetAccreditStdTranscriptReport5");
        a1.Add("dsGetAccreditStdTranscriptReport6");
        a1.Add("dsGetAccreditStdTranscriptReport7");
        a1.Add("dsGetAccreditStdTranscriptReport8");
        a1.Add("dsGetAccreditStdTranscriptReport9");
        a1.Add("dsGetAccreditStdTranscriptReport10");
        a1.Add("dsGetAccreditStdTranscriptReport11");
        a1.Add("dsGetAccreditStdTranscriptReport12");
        a1.Add("dsGetAccreditStdTranscriptReport13");
        a1.Add("dsGetAccreditStdTranscriptReport14");

        ArrayList a2 = new ArrayList();
        DataTable dt = DataAccess.GetModelReport(lblStudentID.Text);
        DataTable dt1 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "0", EmployeeID);
        DataTable dt2 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "1");
        DataTable dt3 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "2");
        DataTable dt4 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "3");
        DataTable dt5 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "4");
        DataTable dt6 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "5");
        DataTable dt7 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "6");
        DataTable dt8 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "7");
        DataTable dt9 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "8");
        DataTable dt10 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "9");
        DataTable dt11 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "10");
        DataTable dt12 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "11");
        DataTable dt13 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "12");
        DataTable dt14 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "13");
        DataTable dt15 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "14");
        a2.Add(dt);
        a2.Add(dt1);
        a2.Add(dt2);
        a2.Add(dt3);
        a2.Add(dt4);
        a2.Add(dt5);
        a2.Add(dt6);
        a2.Add(dt7);
        a2.Add(dt8);
        a2.Add(dt9);
        a2.Add(dt10);
        a2.Add(dt11);
        a2.Add(dt12);
        a2.Add(dt13);
        a2.Add(dt14);
        a2.Add(dt15);
        CreatePDF("StdATranscript_" + lblStudentID.Text, @"Admission\Reports\StudentAccreditationTranscript.rdlc", a1, a2);
    }

    protected void lbAccreditationStudentETranscript_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetAccreditStdTranscriptReport");
        a1.Add("dsGetAccreditStdTranscriptReport1");
        a1.Add("dsGetAccreditStdTranscriptReport2");
        a1.Add("dsGetAccreditStdTranscriptReport3");
        a1.Add("dsGetAccreditStdTranscriptReport4");
        a1.Add("dsGetAccreditStdTranscriptReport5");
        a1.Add("dsGetAccreditStdTranscriptReport6");
        a1.Add("dsGetAccreditStdTranscriptReport7");
        a1.Add("dsGetAccreditStdTranscriptReport8");
        a1.Add("dsGetAccreditStdTranscriptReport9");
        a1.Add("dsGetAccreditStdTranscriptReport10");
        a1.Add("dsGetAccreditStdTranscriptReport11");
        a1.Add("dsGetAccreditStdTranscriptReport12");
        a1.Add("dsGetAccreditStdTranscriptReport13");
        a1.Add("dsGetAccreditStdTranscriptReport14");

        ArrayList a2 = new ArrayList();
        DataTable dt = DataAccess.GetModelReport(lblStudentID.Text);
        DataTable dt1 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "0", EmployeeID);
        DataTable dt2 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "1");
        DataTable dt3 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "2");
        DataTable dt4 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "3");
        DataTable dt5 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "4");
        DataTable dt6 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "5");
        DataTable dt7 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "6");
        DataTable dt8 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "7");
        DataTable dt9 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "8");
        DataTable dt10 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "9");
        DataTable dt11 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "10");
        DataTable dt12 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "11");
        DataTable dt13 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "12");
        DataTable dt14 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "13");
        DataTable dt15 = DataAccess.GetAccreditStdTranscriptReport(lblStudentID.Text, "14");
        a2.Add(dt);
        a2.Add(dt1);
        a2.Add(dt2);
        a2.Add(dt3);
        a2.Add(dt4);
        a2.Add(dt5);
        a2.Add(dt6);
        a2.Add(dt7);
        a2.Add(dt8);
        a2.Add(dt9);
        a2.Add(dt10);
        a2.Add(dt11);
        a2.Add(dt12);
        a2.Add(dt13);
        a2.Add(dt14);
        a2.Add(dt15);
        CreatePDF("StdEATranscript_" + lblStudentID.Text, @"Admission\Reports\StudentEAccreditationTranscript.rdlc", a1, a2);
    }


    protected void lbIsMidtermIncomplete_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkMidtermIncomplete(StdSectionID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbFinalMarkIncompleteAdd_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.FinalMarkIncompleteAdd(StdSectionID, EmployeeID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbIsFinalZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkFinalZero(StdSectionID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbIsNoFinalZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkNoFinalZero(StdSectionID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbGenerateFileNumber_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GenerateStudentFileNumber(lblStudentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString() + ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? " : " + DT.Rows[0]["FileNumber"].ToString() : ""), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void btnAcridiateProgram_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlProgram }))
        {
            DataTable DT = DataAccess.AccreditProgramStudent(lblStudentID.Text, ddlProgram.SelectedValue, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ShowMsg20(DT.Rows[0]["msg"].ToString(), "success");
            }
            else
            {
                ShowMsg20(DT.Rows[0]["msg"].ToString(), "danger");
            }
        }
        else
        {
            ShowMsg20("يجب اختيار البرنامج", "danger");
        }
    }
    protected void lbGiveUp_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF1("StudentGiveUp", @"Admission\Reports\StudentGiveUp.rdlc", a1, a2, lblEmployeeName.Text);
    }
    protected void lbTransferPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF1("DepartmentTransferReport", @"Admission\Reports\DepartmentTransferReport.rdlc", a1, a2, lblEmployeeName.Text);
    }

    protected void lbDelayPD_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));

        CreatePDF1("DelayRequestReport", @"Admission\Reports\DelayRequestReport.rdlc", a1, a2, lblEmployeeName.Text);
    }

    protected void btnWithdrawCourse_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.WithdrawCourse(StdSectionID, EmployeeID);
        Repeater15.DataBind();
        ShowMsg21(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        OpenTab(21);
    }

    protected void ddlStdSemester2_SelectedIndexChanged(object sender, EventArgs e)
    {

        Repeater4.DataSource = DataAccess.GetStdSemesterMarks(Convert.ToInt32(ddlStdSemester2.SelectedValue));
        Repeater4.DataBind();
        OpenTab(5);
    }

    protected void ddlStdSemester21_SelectedIndexChanged(object sender, EventArgs e)
    {
        OpenTab(21);

        DataTable dt = DataAccess.GetStdSemesterMarks(Convert.ToInt32(ddlStdSemester21.SelectedValue));
        Repeater15.DataSource = dt;
        Repeater15.DataBind();
    }

    protected void ddlStdSemester_3_SelectedIndexChanged(object sender, EventArgs e)
    {

        //todo islam: why just 18 !
        DataTable dt = DataAccess.GetStdSemesterMarksBItrans(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater18.DataSource = dt;
        Repeater18.DataBind();


        DataTable dt2 = DataAccess.GetStdSemesterStatistic_New(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater19.DataSource = dt2;
        Repeater19.DataBind();



        DataTable dt3 = DataAccess.CalculateSemesterGPABITrans(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater20.DataSource = dt3;
        Repeater20.DataBind();
        OpenTab(22);
    }
    protected void lbProofOFStudentAttendanceReportPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsProofOFStudentAttendanceReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));
        a2.Add(DataAccess.ProofOFStudentAttendanceReport(lblStudentID.Text));

        CreatePDF1("ProofOFStudentAttendanceReport", @"Admission\Reports\ProofOFStudentAttendanceReport.rdlc", a1, a2, lblEmployeeName.Text);
    }

    protected void lbUnAccreditationStudentTranscript_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetUnAccreditStdTranscriptReport");
        a1.Add("dsGetUnAccreditStdTranscriptReport1");
        a1.Add("dsGetUnAccreditStdTranscriptReport2");
        a1.Add("dsGetUnAccreditStdTranscriptReport3");
        a1.Add("dsGetUnAccreditStdTranscriptReport4");
        a1.Add("dsGetUnAccreditStdTranscriptReport5");
        a1.Add("dsGetUnAccreditStdTranscriptReport6");
        a1.Add("dsGetUnAccreditStdTranscriptReport7");
        a1.Add("dsGetUnAccreditStdTranscriptReport8");
        a1.Add("dsGetUnAccreditStdTranscriptReport9");
        a1.Add("dsGetUnAccreditStdTranscriptReport10");
        a1.Add("dsGetUnAccreditStdTranscriptReport11");
        a1.Add("dsGetUnAccreditStdTranscriptReport12");
        a1.Add("dsGetUnAccreditStdTranscriptReport13");
        a1.Add("dsGetUnAccreditStdTranscriptReport14");

        ArrayList a2 = new ArrayList();
        DataTable dt = DataAccess.GetModelReport(lblStudentID.Text);
        DataTable dt1 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "0", EmployeeID);
        DataTable dt2 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "1");
        DataTable dt3 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "2");
        DataTable dt4 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "3");
        DataTable dt5 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "4");
        DataTable dt6 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "5");
        DataTable dt7 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "6");
        DataTable dt8 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "7");
        DataTable dt9 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "8");
        DataTable dt10 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "9");
        DataTable dt11 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "10");
        DataTable dt12 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "11");
        DataTable dt13 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "12");
        DataTable dt14 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "13");
        DataTable dt15 = DataAccess.GetUnAccreditStdTranscriptReport(lblStudentID.Text, "14");
        a2.Add(dt);
        a2.Add(dt1);
        a2.Add(dt2);
        a2.Add(dt3);
        a2.Add(dt4);
        a2.Add(dt5);
        a2.Add(dt6);
        a2.Add(dt7);
        a2.Add(dt8);
        a2.Add(dt9);
        a2.Add(dt10);
        a2.Add(dt11);
        a2.Add(dt12);
        a2.Add(dt13);
        a2.Add(dt14);
        a2.Add(dt15);
        CreatePDF("StdUnATranscript_" + lblStudentID.Text, @"Admission\Reports\StudentUnAccreditationTranscript.rdlc", a1, a2);
    }

    protected void lbAddReoprtCost1_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentReportCost(lblStudentID.Text, "90", EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbAddReoprtCost2_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentReportCost(lblStudentID.Text, "91", EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbAddReoprtCost3_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentReportCost(lblStudentID.Text, "92", EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void lbAddReoprtCost4_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddStudentReportCost(lblStudentID.Text, "60", EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater10.DataBind();
    }

    protected void btnDelayCourse_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.DelayCourse(StdSectionID, EmployeeID);
        Repeater15.DataBind();
        ShowMsg21(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        OpenTab(21);
    }

    protected void btnCancelCourse_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.CancelCourse(StdSectionID, EmployeeID);
        Repeater15.DataBind();
        ShowMsg21(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        OpenTab(21);
    }

    protected void btnUnCalculatedCourse_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.UnCalculatedCourse(StdSectionID, EmployeeID);
        Repeater15.DataBind();
        ShowMsg21(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        OpenTab(21);
    }


    protected void lbGraduateAvowalPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdGraduateAvowalReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdGraduateAvowalReport(lblStudentID.Text));
        CreatePDF("GraduateAvowal", @"Admission\Reports\GraduateAvowal.rdlc", a1, a2);
    }

    protected void lbstdTranscriptPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetStdTranscriptReport1");
        a1.Add("dsGetStdTranscriptReport2");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(lblStudentID.Text));
        a2.Add(DataAccess.GetStdTranscriptReport(lblStudentID.Text, "0"));
        a2.Add(DataAccess.GetStdTranscriptReport(lblStudentID.Text, "1"));
        CreatePDF("StdTranscriptReport", @"Admission\Reports\StdTranscriptReport.rdlc", a1, a2);
    }

    protected void lbIsMidtermZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkMidtermZero(StdSectionID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbIsNoMidtermZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkNoMidtermZero(StdSectionID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbIsTotalZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkTotalMarkZero(StdSectionID, EmployeeID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbIsTotalNoZero_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkTotalMarkNoZero(StdSectionID, EmployeeID);
        ShowMsg5(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(5);
    }

    protected void lbStudyPlanPrint_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdPlanReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdPlanReport(lblStudentID.Text));
        CreatePDF("StdPlan", @"Admission\Reports\EStdPlanReport.rdlc", a1, a2);
    }


    protected void LinkButton1_OnClick(object sender, EventArgs e)
    {
        OpenTab(1);
        Repeater10.DataSource = DataAccess.GetStudentInfo(Convert.ToInt32(lblStudentID.Text));
        Repeater10.DataBind();
    }

    protected void LinkButton2_OnClick(object sender, EventArgs e)
    {

        OpenTab(2);
        Repeater8.DataSource = DataAccess.GetStdSemesterName(Convert.ToInt32(lblStudentID.Text));
        Repeater8.DataBind();


        Repeater7.DataSource = DataAccess.GetStdStudyTable(lblStudentID.Text);
        Repeater7.DataBind();

        Repeater13.DataSource = DataAccess.GetStdSemesterRemedialCourse(Convert.ToInt32(lblStudentID.Text));
        Repeater13.DataBind();






    }

    protected void LinkButton8_OnClick(object sender, EventArgs e)
    {
        OpenTab(8);




    }

    protected void LinkButton3_OnClick(object sender, EventArgs e)
    {
        OpenTab(3);
        Repeater3.DataSource = DataAccess.GetStdExamsTable(Convert.ToInt32(ddlStdSemester1.SelectedValue));
        Repeater3.DataBind();
    }

    protected void LinkButton4_OnClick(object sender, EventArgs e)
    {
        OpenTab(4);

        DataTable dt = new DataTable();
        dt = DataAccess.GetStdSemesterPlan(lblStudentID.Text);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();


    }
    protected void LinkButton23_OnClick(object sender, EventArgs e)
    {

        OpenTab(23);

        DataTable dt = new DataTable();
        dt = DataAccess.GetStdSemesterPlan(lblStudentID.Text);
        Repeater17.DataSource = dt;
        Repeater17.DataBind();
    }

    protected void LinkButton15_OnClick(object sender, EventArgs e)
    {
        OpenTab(15);
        DataTable dt = DataAccess.GetStdSemesterPlan(lblStudentID.Text);
        Repeater14.DataSource = dt;
        Repeater14.DataBind();

    }

    protected void LinkButton5_OnClick(object sender, EventArgs e)
    {
        OpenTab(5);

        ddlStdSemester2.DataSource = DataAccess.GetStdSemesterWithoutTrans(Convert.ToInt32(lblStudentID.Text));
        ddlStdSemester2.DataBind();



        Repeater4.DataSource = DataAccess.GetStdSemesterMarks(Convert.ToInt32(ddlStdSemester2.SelectedValue));
        Repeater4.DataBind();
    }

    protected void LinkButton22_OnClick(object sender, EventArgs e)
    {
        OpenTab(22);

        DataTable dt = DataAccess.GetStdSemesterMarksBItrans(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater18.DataSource = dt;
        Repeater18.DataBind();


        DataTable dt2 = DataAccess.GetStdSemesterStatistic_New(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater19.DataSource = dt2;
        Repeater19.DataBind();



        DataTable dt3 = DataAccess.CalculateSemesterGPABITrans(Convert.ToInt32(ddlSemester_3.SelectedValue));
        Repeater20.DataSource = dt3;
        Repeater20.DataBind();

    }

    protected void LinkButton21_OnClick(object sender, EventArgs e)
    {
        OpenTab(21);

        DataTable dt = DataAccess.GetStdSemesterMarks(Convert.ToInt32(ddlStdSemester21.SelectedValue));
        Repeater15.DataSource = dt;
        Repeater15.DataBind();


    }

    protected void LinkButton6_OnClick(object sender, EventArgs e)
    {
        OpenTab(6);
        DataTable dt = DataAccess.GetStdSemesters(Convert.ToInt32(lblStudentID.Text));
        Repeater9.DataSource = dt;
        Repeater9.DataBind();


    }

    protected void LinkButton20_OnClick(object sender, EventArgs e)
    {
        OpenTab(20);


        var data = DataAccess.GetStdSemesters(Convert.ToInt32(lblStudentID.Text));
        Repeater16.DataSource = data;
        Repeater16.DataBind();

    }

    protected void LinkButton10_OnClick(object sender, EventArgs e)
    {
        OpenTab(10);
        DataTable dt = DataAccess.StudentWishesGet(lblStudentID.Text);
        Repeater11.DataSource = dt;
        Repeater11.DataBind();


    }

    protected void LinkButton7_OnClick(object sender, EventArgs e)
    {
        OpenTab(7);
        DataTable dt = DataAccess.GetStdDocument(Convert.ToInt32(lblStudentID.Text));

        ListView1.DataSource = dt;
        ListView1.DataBind();
    }

    protected void LinkButton9_OnClick(object sender, EventArgs e)
    {
        OpenTab(9);
        DataTable dt = DataAccess.GetStudentStdMessage(Convert.ToInt32(lblStudentID.Text));
        ListView4.DataSource = dt;
        ListView4.DataBind();
    }

    protected void LinkButton12_OnClick(object sender, EventArgs e)
    {
        OpenTab(12);
        DataTable dt = DataAccess.GetStudentCondition(Convert.ToInt32(lblStudentID.Text));
        Repeater12.DataSource = dt;
        Repeater12.DataBind();


    }

    protected void LinkButton13_OnClick(object sender, EventArgs e)
    {
        OpenTab(13);
    }

    protected void LinkButton14_OnClick(object sender, EventArgs e)
    {
        OpenTab(14);
        DataTable dt = DataAccess.GetStudentAttendanceWarning(Convert.ToInt32(lblStudentID.Text));
        ListView2.DataSource = dt;
        ListView2.DataBind();
    }

    protected void LinkButton16_OnClick(object sender, EventArgs e)
    {
        OpenTab(16);
        DataTable dt = DataAccess.GetStudentSectionsAttendanceStatistics(Convert.ToInt32(lblStudentID.Text));
        ListView3.DataSource = dt;
        ListView3.DataBind();
    }



    protected void ddlStdSemester1_OnSelectedIndexChanged(object sender, EventArgs e)
    {

        Repeater3.DataSource = DataAccess.GetStdExamsTable(Convert.ToInt32(ddlStdSemester1.SelectedValue));
        Repeater3.DataBind();
    }

    protected void Repeater1_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        var repeater2 = (Repeater)e.Item.FindControl("Repeater2");
        var labelPlanID = (Label)e.Item.FindControl("PlanID");
        var labelCSemesterID = (Label)e.Item.FindControl("CSemesterID");

        var data = DataAccess.GetCSemesterPlanCourses(Convert.ToInt32(labelPlanID.Text), Convert.ToInt32(labelCSemesterID.Text));

        repeater2.DataSource = data;
        repeater2.DataBind();
    }

    protected void Repeater9_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        var Repeater92 = (Repeater)e.Item.FindControl("Repeater92");
        var Repeater4 = (Repeater)e.Item.FindControl("Repeater4");
        var Repeater3 = (Repeater)e.Item.FindControl("Repeater3");

        var StdSemesterID = (Label)e.Item.FindControl("StdSemesterID");

        var data = DataAccess.GetStdSemesterMarks(Convert.ToInt32(StdSemesterID.Text));
        Repeater92.DataSource = data;
        Repeater92.DataBind();


        var data2 = DataAccess.GetStdGPAs(Convert.ToInt32(StdSemesterID.Text));
        Repeater4.DataSource = data2;
        Repeater4.DataBind();

        var data3 = DataAccess.CalculateSemesterGPA(Convert.ToInt32(StdSemesterID.Text));
        Repeater3.DataSource = data3;
        Repeater3.DataBind();


    }

    protected void Repeater16_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {


        var Repeater92 = (Repeater)e.Item.FindControl("Repeater92");
        var Repeater41 = (Repeater)e.Item.FindControl("Repeater41");
        var Repeater31 = (Repeater)e.Item.FindControl("Repeater31");

        var StdSemesterID = (Label)e.Item.FindControl("StdSemesterID");

        var data = DataAccess.GetStdSemesterMarksBITrans(Convert.ToInt32(StdSemesterID.Text));
        Repeater92.DataSource = data;
        Repeater92.DataBind();


        var data2 = DataAccess.GetStdGPAs(Convert.ToInt32(StdSemesterID.Text));
        Repeater41.DataSource = data2;
        Repeater41.DataBind();

        var data3 = DataAccess.CalculateSemesterGPABITrans(Convert.ToInt32(StdSemesterID.Text));
        Repeater31.DataSource = data3;
        Repeater31.DataBind();


    }

    protected void Repeater17_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        var repeater2 = (Repeater)e.Item.FindControl("Repeater2");
        var labelPlanID = (Label)e.Item.FindControl("PlanID");
        var labelCSemesterID = (Label)e.Item.FindControl("CSemesterID");

        var data = DataAccess.GetCSemesterPlanCourses(Convert.ToInt32(labelPlanID.Text), Convert.ToInt32(labelCSemesterID.Text));

        repeater2.DataSource = data;
        repeater2.DataBind();
    }

    protected void Repeater14_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var Repeater141 = (Repeater)e.Item.FindControl("Repeater141");
        var CSemesterID = (Label)e.Item.FindControl("CSemesterID");

        var data = DataAccess.GetStudentCSemesterAcademicGuidence(Convert.ToInt32(lblStudentID.Text),
            Convert.ToInt32(CSemesterID.Text));
        Repeater141.DataSource = data;
        Repeater141.DataBind();


    }
}
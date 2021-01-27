using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Student : UserPage
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
                    else
                    {
                        image.Src = "../images/std.jpg";
                    }
                }
            }
            else
                Response.Redirect("~/Academic/Students.aspx");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Academic/Students.aspx");
        }
    }
    protected void lbStudyTablePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdStudyTable");
        a1.Add("dsStdStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdStudyTableReport(lblStudentID.Text));
        DataTable dt = DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text);
        a2.Add(dt);

        CreatePDF("StudyTable_" + dt.Rows[0]["StudentNo"].ToString(), @"Academic\Reports\StdStudyTableReport.rdlc", a1, a2);
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("~/Academic/Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }
    protected void lbPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdPlanReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdPlanReport(lblStudentID.Text));

        CreatePDF("StdPlan", @"Admission\Reports\GetStdPlanReport.rdlc", a1, a2);
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

    protected void btnExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent.Parent;
        TextBox txtCourseName = (TextBox)ri.FindControl("txtCourseName");
        TextBox txtCourseHours = (TextBox)ri.FindControl("txtCourseHours");
        TextBox txtMark = (TextBox)ri.FindControl("txtMark");
        Label CourseID = (Label)ri.FindControl("lblCourseID");
        Label TransformationID = (Label)ri.FindControl("TransformationID");
        Repeater repeater52 = (Repeater)ri.Parent;

        bool Validate = ValidateControls(new WebControl[] { txtMark });

        if (Validate)
        {
            DataTable DT = DataAccess.ExternalTransformation(TransformationID.Text, lblStudentID.Text, CourseID.Text, txtCourseName.Text, txtCourseHours.Text, txtMark.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                repeater52.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        OpenTab(3);
    }

    protected void lbDeleteExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater52 = (Repeater)ri.Parent;
        string id = ((Label)ri.FindControl("TransformationID")).Text;

        if (DataAccess.DeleteExternalTransformation(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            repeater52.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }

        OpenTab(3);
    }

    protected void lbEditExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater52 = (Repeater)ri.Parent;
        ((TextBox)ri.FindControl("txtCourseName")).Enabled = true;
        ((TextBox)ri.FindControl("txtCourseHours")).Enabled = true;
        ((Panel)ri.FindControl("Panel1")).Visible = true;
        ((Panel)ri.FindControl("Panel2")).Visible = false;

        OpenTab(3);
    }

    protected void lbAccrediteETransformation_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAccrediteETransformation(lblStudentID.Text));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
    }

    protected void lbUnAccrediteETransformation_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUnaccrediteETransformation(lblStudentID.Text));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
    }


    protected void lbTransformationAccreditation_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.TransformationAccreditation(lblStudentID.Text, EmployeeID, (Permissions.Contains("AcademicStudentExternalTransforamtion")) ? "4" : ((Permissions.Contains("DeanStudentExternalTransforamtion")) ? "3" : ((Permissions.Contains("HeadStudentExternalTransforamtion")) ? "2" : "1")));
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if ((Permissions.Contains("AcademicStudentExternalTransforamtion")) && (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
        //{
        //    SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
        //}
        OpenTab(3);
    }

    public void ddlCourseName_SelectedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((DropDownList)sender).Parent;
        DropDownList TransformedCourse = (DropDownList)ri.FindControl("ddlCourseName");
        string TransID = TransformedCourse.SelectedValue;
        Label TransformedCourseHours = (Label)ri.FindControl("lblCourseHours");
        DataTable DT = DataAccess.GetCourseHour(TransID);
        TransformedCourseHours.Text = DT.Rows[0]["NumOfHours"].ToString();
        OpenTab(4);
    }

    
    
    void OpenTab(int i)
    {
        litab1.Attributes.Add("class", (i == 1) ? "active" : "");
        //litab2.Attributes.Add("class", (i == 2) ? "active" : "");
        litab3.Attributes.Add("class", (i == 3) ? "active" : "");
        //litab4.Attributes.Add("class", (i == 4) ? "active" : "");
        //litab5.Attributes.Add("class", (i == 5) ? "active" : "");
        //litab6.Attributes.Add("class", (i == 6) ? "active" : "");
        litab7.Attributes.Add("class", (i == 7) ? "active" : "");
        //litab8.Attributes.Add("class", (i == 8) ? "active" : "");
        //litab9.Attributes.Add("class", (i == 9) ? "active" : "");
        litab10.Attributes.Add("class", (i == 10) ? "active" : "");
        litab12.Attributes.Add("class", (i == 12) ? "active" : "");
        //litab16.Attributes.Add("class", (i == 16) ? "active" : "");
        litab15.Attributes.Add("class", (i == 15) ? "active" : "");

        tab1.Attributes.Add("class", (i == 1) ? "tab-pane active" : "tab-pane");
        //tab2.Attributes.Add("class", (i == 2) ? "tab-pane active" : "tab-pane");
        tab3.Attributes.Add("class", (i == 3) ? "tab-pane active" : "tab-pane");
        //tab4.Attributes.Add("class", (i == 4) ? "tab-pane active" : "tab-pane");
        //tab5.Attributes.Add("class", (i == 5) ? "tab-pane active" : "tab-pane");
        //tab6.Attributes.Add("class", (i == 6) ? "tab-pane active" : "tab-pane");
        tab7.Attributes.Add("class", (i == 7) ? "tab-pane active" : "tab-pane");
        ////tab8.Attributes.Add("class", (i == 8) ? "tab-pane active" : "tab-pane");
        //tab9.Attributes.Add("class", (i == 9) ? "tab-pane active" : "tab-pane");
        tab10.Attributes.Add("class", (i == 10) ? "tab-pane active" : "tab-pane");
        tab12.Attributes.Add("class", (i == 12) ? "tab-pane active" : "tab-pane");
        tab16.Attributes.Add("class", (i == 16) ? "tab-pane active" : "tab-pane");
        tab15.Attributes.Add("class", (i == 15) ? "tab-pane active" : "tab-pane");
    }
    protected void btnRefusalStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.RefusalStudent(lblStudentID.Text, txtRefusalNotes.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        OpenTab(10);
    }
    protected void cbIsRemedialCourse_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string lblSectionID = ((Label)ri.FindControl("SectionID")).Text;

        DataTable DT = DataAccess.SetIsRemedialCourse(lblSectionID, ((CheckBox)sender).Checked, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        OpenTab(7);
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

        CreatePDF("AttendanceWarning", (type == "1") ? @"Academic\Reports\AttendanceWarning.rdlc" : @"Academic\Reports\AttendanceFinalWarning.rdlc", a1, a2);
    }
    protected void btnIsMidtermIncomplete2_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkMidtermIncomplete(StdSectionID);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(12);

    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

    protected void btnEditMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;

        Label lblWorkMark = (Label)item.FindControl("lblWorkMark");
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
        Button btnSaveWorkMark = (Button)item.FindControl("btnSaveWorkMark");
        Button btnCancelWorkMark = (Button)item.FindControl("btnCancelWorkMark");
        lblWorkMark.Visible = false;
        txtWorkMark.Visible = btnSaveWorkMark.Visible = btnCancelWorkMark.Visible = true;

        Label lblMidtermMark = (Label)item.FindControl("lblMidtermMark");
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        Button btnSaveMidtermMark = (Button)item.FindControl("btnSaveMidtermMark");
        Button btnCancelMidtermMark = (Button)item.FindControl("btnCancelMidtermMark");
        lblMidtermMark.Visible = false;
        txtMidtermMark.Visible = btnSaveMidtermMark.Visible = btnCancelMidtermMark.Visible = true;

        Label lblFinalMark = (Label)item.FindControl("lblFinalMark");
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        Button btnSaveFinalMark = (Button)item.FindControl("btnSaveFinalMark");
        Button btnCancelFinalMark = (Button)item.FindControl("btnCancelFinalMark");
        lblFinalMark.Visible = false;
        txtFinalMark.Visible = btnSaveFinalMark.Visible = btnCancelFinalMark.Visible = true;

        OpenTab(12);
    }

    protected void btnSaveMidtermMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        bool IsMidtermNoMark = (txtMidtermMark.Text == "N" || txtMidtermMark.Text == "غياب" || txtMidtermMark.Text == "غ . م");
        txtMidtermMark.Text = IsMidtermNoMark ? "0" : txtMidtermMark.Text;

        if (IntValidateControls(new WebControl[] { txtMidtermMark }))
        {
            DataTable DT = DataAccess.SetMarkMidtermMark(ID, txtMidtermMark.Text, IsMidtermNoMark, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater4.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
        OpenTab(12);
    }

    protected void btnCancelMidtermMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblMidtermMark = (Label)item.FindControl("lblMidtermMark");
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        Button btnSaveMidtermMark = (Button)item.FindControl("btnSaveMidtermMark");
        Button btnCancelMidtermMark = (Button)item.FindControl("btnCancelMidtermMark");
        lblMidtermMark.Visible = true;
        txtMidtermMark.Visible = btnSaveMidtermMark.Visible = btnCancelMidtermMark.Visible = false;
        OpenTab(12);
    }

    protected void btnSaveFinalMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        bool IsFinalNoMark = (txtFinalMark.Text == "N" || txtFinalMark.Text == "غياب" || txtFinalMark.Text == "غ . م");
        txtFinalMark.Text = IsFinalNoMark ? "0" : txtFinalMark.Text;

        if (IntValidateControls(new WebControl[] { txtFinalMark }))
        {
            DataTable DT = DataAccess.SetMarkFinalMark(ID, txtFinalMark.Text, IsFinalNoMark, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater4.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
        OpenTab(12);
    }

    protected void btnCancelFinalMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblFinalMark = (Label)item.FindControl("lblFinalMark");
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        Button btnSaveFinalMark = (Button)item.FindControl("btnSaveFinalMark");
        Button btnCancelFinalMark = (Button)item.FindControl("btnCancelFinalMark");
        lblFinalMark.Visible = true;
        txtFinalMark.Visible = btnSaveFinalMark.Visible = btnCancelFinalMark.Visible = false;
        OpenTab(12);
    }

    protected void btnSaveWorkMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");

        if (IntValidateControls(new WebControl[] { txtWorkMark }))
        {
            DataTable DT = DataAccess.SetMarkWorkMark(ID, txtWorkMark.Text, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater4.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
        OpenTab(12);
    }

    protected void btnCancelWorkMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblWorkMark = (Label)item.FindControl("lblWorkMark");
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
        Button btnSaveWorkMark = (Button)item.FindControl("btnSaveWorkMark");
        Button btnCancelWorkMark = (Button)item.FindControl("btnCancelWorkMark");
        lblWorkMark.Visible = true;
        txtWorkMark.Visible = btnSaveWorkMark.Visible = btnCancelWorkMark.Visible = false;
        OpenTab(12);
    }

    protected void lbFinalMarkIncompleteAdd_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.FinalMarkIncompleteAdd(StdSectionID, EmployeeID);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater4.DataBind();
        }
        OpenTab(12);
    }



    protected void lbEditExternalTransformation_Click1(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater11 = (Repeater)ri.Parent;
        ((TextBox)ri.FindControl("txtCourseName")).Enabled = true;
        ((TextBox)ri.FindControl("txtCourseHours")).Enabled = true;
        ((Panel)ri.FindControl("Panel1")).Visible = true;
        ((Panel)ri.FindControl("Panel2")).Visible = false;

        OpenTab(3);
    }

    protected void lbDeleteExternalTransformation_Click1(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater11 = (Repeater)ri.Parent;
        string id = ((Label)ri.FindControl("TransformationID")).Text;

        if (DataAccess.DeleteExternalTransformation(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            repeater11.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }

        OpenTab(3);
    }

    protected void lbStudyPlanPrint_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdPlanReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdPlanReport(lblStudentID.Text));
        CreatePDF("StdPlan", @"Academic\Reports\EStdPlanReport.rdlc", a1, a2);
    }
}

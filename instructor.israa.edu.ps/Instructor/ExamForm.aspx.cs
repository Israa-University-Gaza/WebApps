using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Instructor_ExamForm : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtExamDateBeginning.Text = txtExamDateEnd.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool x2 = IntValidateControls(new WebControl[] { ddlCourse2, ddlExamCategory, ddlExamFormType, txtTotalMark, txtCountOfQuestions });
        bool x3 = DateValidateControls(new WebControl[] { txtExamDateBeginning, txtExamDateEnd, txtExamTimeBeginning, txtExamTimeEnd });
        bool x1 = ValidateControls(new WebControl[] { ddlCourse2, ddlExamCategory, ddlExamFormType, txtTotalMark, txtTimePeriod, txtAllowFinish, txtCountOfQuestions, txtExamDateBeginning, txtExamDateEnd, txtExamTimeBeginning, txtExamTimeEnd });
        if (x1 && x2 && x3)
        {
            DataTable DT = DataAccess.ExamFormAddEdit(lblExamFormID.Text, ddlCourse2.SelectedValue, ddlExamCategory.SelectedValue, txtName.Text, ddlExamFormType.SelectedValue, ddlExamLanguage.SelectedValue, txtTotalMark.Text, txtTimePeriod.Text, txtAllowFinish.Text, txtCountOfQuestions.Text, txtExamDateBeginning.Text + " " + txtExamTimeBeginning.Text, txtExamDateEnd.Text + " " + txtExamTimeEnd.Text, cbActive.Checked, EmployeeID);
            ShowMsg2(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() == "1")
            {
                txtTimePeriod.Text = txtAllowFinish.Text = txtExamTimeBeginning.Text = txtExamTimeEnd.Text = "00:00:00";
                txtExamDateBeginning.Text = txtExamDateEnd.Text = DateTime.Now.ToString("yyyy/MM/dd");
                EmptyControls(new WebControl[] { lblExamFormID, ddlCourse2, ddlExamCategory, ddlExamFormType, txtTotalMark, txtCountOfQuestions });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg2("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtTimePeriod.Text = txtAllowFinish.Text = txtExamTimeBeginning.Text = txtExamTimeEnd.Text = "00:00:00";
        txtExamDateBeginning.Text = txtExamDateEnd.Text = DateTime.Now.ToString("yyyy/MM/dd");
        EmptyControls(new WebControl[] { lblExamFormID, ddlCourse2, ddlExamCategory, ddlExamFormType, txtTotalMark, txtCountOfQuestions });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormID")).Text;

        if (DataAccess.ExamFormActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowMsg1("تمت العملية بنجاح.", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم العملية.", "error");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormID")).Text;
        DataTable DT = DataAccess.ExamFormGet(id);
        if (DT.Rows.Count > 0)
        {
            lblExamFormID.Text = id;
            ddlCourse2.DataBind();
            ddlCourse2.SelectedValue = DT.Rows[0]["CourseID"].ToString();
            ddlExamCategory.DataBind();
            ddlExamCategory.SelectedValue = DT.Rows[0]["ExamCategoryID"].ToString();
            ddlExamFormType.DataBind();
            ddlExamFormType.SelectedValue = DT.Rows[0]["ExamFormType"].ToString();
            ddlExamLanguage.DataBind();
            ddlExamLanguage.SelectedValue = DT.Rows[0]["ExamLanguage"].ToString();
            txtName.Text = DT.Rows[0]["Name"].ToString();
            txtTotalMark.Text = DT.Rows[0]["TotalMark"].ToString();
            txtCountOfQuestions.Text = DT.Rows[0]["CountOfQuestions"].ToString();
            txtTimePeriod.Text = Convert.ToDateTime(DT.Rows[0]["TimePeriod"].ToString()).ToString("HH:mm:ss");
            txtAllowFinish.Text = Convert.ToDateTime(DT.Rows[0]["AllowFinish"].ToString()).ToString("HH:mm:ss");
            txtExamDateBeginning.Text = Convert.ToDateTime(DT.Rows[0]["ExamBeginning"].ToString()).ToString("yyyy/MM/dd");
            txtExamTimeBeginning.Text = Convert.ToDateTime(DT.Rows[0]["ExamBeginning"].ToString()).ToString("HH:mm:ss");
            txtExamDateEnd.Text = Convert.ToDateTime(DT.Rows[0]["ExamEnd"].ToString()).ToString("yyyy/MM/dd");
            txtExamTimeEnd.Text = Convert.ToDateTime(DT.Rows[0]["ExamEnd"].ToString()).ToString("HH:mm:ss");
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormID")).Text;

        if (DataAccess.ExamFormDelete(id, EmployeeID) > 0)
        {
            ShowMsg1("تم الحذف بنجاح.", "success");
            EmptyControls(new WebControl[] { lblExamFormID, ddlCourse2, ddlExamCategory, ddlExamFormType, txtTotalMark, txtTimePeriod, txtAllowFinish, txtCountOfQuestions, txtExamDateBeginning, txtExamDateEnd });
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم الحذف.", "error");
        }
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg1.Visible = (msg != "");
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status);
        divMsg2.Visible = (msg != "");
    }

    protected void lbOpenExamForm_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        string ExamFormType = ((Label)item.FindControl("ExamFormType")).Text;
        Response.Redirect((ExamFormType == "1") ? "ExamFormQuestions" : "ExamFormDetails");
    }

    protected void lbExamFormView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        Response.Redirect("ExamFormView");
    }

    protected void lbGenerateStudentExam_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        Response.Redirect("GenerateStudentExam");
    }

    protected void lbStudentsExams_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        Response.Redirect("StudentsExams");
    }
}
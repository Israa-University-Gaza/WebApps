using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Instructor_ExamFormDetails : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lblExamFormID.Text == "")
        {
            if (Session["ExamFormID"] != null)
                lblExamFormID.Text = Session["ExamFormID"].ToString();
            else
                Response.Redirect("ExamForm");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool x1 = IntValidateControls(new WebControl[] { ddlCoursePart, ddlQuestionType, ddlQuestionHardness, txtCountOfQuestions, txtTimePeriod });
        bool x2 = DoubleValidateControls(new WebControl[] { txtWeight });
        bool x3 = ValidateControls(new WebControl[] { ddlCoursePart, ddlQuestionType, ddlQuestionHardness, txtCountOfQuestions, txtTimePeriod, txtWeight });
        if (x1 && x2 && x3)
        {
            DataTable DT = DataAccess.ExamFormDetailsAddEdit(lblExamFormDetailsID.Text, lblExamFormID.Text, ddlCoursePart.SelectedValue, ddlQuestionType.SelectedValue, ddlQuestionHardness.SelectedValue, txtCountOfQuestions.Text, txtWeight.Text, txtTimePeriod.Text, true, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() == "1")
            {
                EmptyControls(new WebControl[] { lblExamFormDetailsID, ddlCoursePart, ddlQuestionType, ddlQuestionHardness, txtWeight, txtTimePeriod, txtCountOfQuestions });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblExamFormDetailsID, ddlCoursePart, ddlQuestionType, ddlQuestionHardness, txtWeight, txtTimePeriod, txtCountOfQuestions });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormDetailsID")).Text;

        if (DataAccess.ExamFormDetailsActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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
        string id = ((Label)item.FindControl("ExamFormDetailsID")).Text;
        DataTable DT = DataAccess.ExamFormDetailsGet(id);
        if (DT.Rows.Count > 0)
        {
            lblExamFormDetailsID.Text = id;
            ddlCoursePart.DataBind();
            ddlCoursePart.SelectedValue = DT.Rows[0]["CoursePartID"].ToString();
            ddlQuestionType.DataBind();
            ddlQuestionType.SelectedValue = DT.Rows[0]["QuestionTypeID"].ToString();
            ddlQuestionHardness.DataBind();
            ddlQuestionHardness.SelectedValue = DT.Rows[0]["QuestionHardnessID"].ToString();
            txtCountOfQuestions.Text = DT.Rows[0]["CountOfQuestions"].ToString();
            txtWeight.Text = DT.Rows[0]["Weight"].ToString();
            txtTimePeriod.Text = DT.Rows[0]["TimePeriod"].ToString();
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormDetailsID")).Text;

        if (DataAccess.ExamFormDetailsDelete(id, EmployeeID) > 0)
        {
            ShowMsg1("تم الحذف بنجاح.", "success");
            EmptyControls(new WebControl[] { lblExamFormDetailsID, ddlCoursePart, ddlQuestionType, ddlQuestionHardness, txtWeight, txtTimePeriod, txtCountOfQuestions });
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
}
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Instructor_ExamFormQuestions : UserPage
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

    protected void lbExamFormQuestionsDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ExamFormQuestionsID")).Text;

        if (DataAccess.ExamFormQuestionsDelete(id, EmployeeID) > 0)
        {
            ShowMsg("تم الحذف بنجاح.", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowMsg("عذرًا , لم تتم الحذف.", "danger");
        }
    }

    protected void lbAddQuestion_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("QuestionID")).Text;
        TextBox txtMark = ((TextBox)item.FindControl("txtMark"));
        bool x = DoubleValidateControls(new WebControl[] { txtMark});
        if (x)
        {
            DataTable DT = DataAccess.ExamFormQuestionsAddEdit("", lblExamFormID.Text, id, txtMark.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() == "1")
            {
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }
}
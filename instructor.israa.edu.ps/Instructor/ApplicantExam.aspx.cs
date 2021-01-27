using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_StudentExam : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblStudentExamID.Text == "")
            {
                if (Session["StudentExamID"] != null)
                {
                    lblExamFormID.Text = Session["ExamFormID"].ToString();
                    lblStudentExamID.Text = Session["StudentExamID"].ToString();
                }
                else
                    Response.Redirect("StudentsExams");
            }
        }
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterItem item = e.Item;
        string QuestionTypeID = ((Label)item.FindControl("lblQuestionTypeID")).Text;
        string StudentAnswer = ((Label)item.FindControl("lblStudentAnswer")).Text;
        string CorrectAnswer = ((Label)item.FindControl("lblCorrectAnswer")).Text;

        if (QuestionTypeID == "1" || QuestionTypeID == "2")
        {
            //Label x = (Label)item.FindControl("Label1");
            RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");
            rblAnswers.SelectedValue = StudentAnswer;
            if (rblAnswers.SelectedItem != null)
                rblAnswers.SelectedItem.Attributes["style"] = "color:red;";
            if (CorrectAnswer != "")
                rblAnswers.Items.FindByValue(CorrectAnswer).Attributes["style"] = "color:green;";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool valid = true;
        foreach (RepeaterItem item in Repeater2.Items)
        {
            string QuestionTypeID = ((Label)item.FindControl("lblQuestionTypeID")).Text;

            Label lblStudentExamQuestionID = (Label)item.FindControl("lblStudentExamQuestionID");
            Label lblQuestionTypeID = (Label)item.FindControl("lblQuestionTypeID");

            if (QuestionTypeID != "1" && QuestionTypeID != "2")
            {
                Label lblQuestionMark = (Label)item.FindControl("lblQuestionMark");
                TextBox txtStudentMark = (TextBox)item.FindControl("txtStudentMark");

                if (DoubleValidateControls(new WebControl[] { txtStudentMark }))
                {
                    double QuestionMark = Convert.ToDouble(lblQuestionMark.Text);
                    double StudentMark = Convert.ToDouble(txtStudentMark.Text);
                    if (StudentMark <= QuestionMark)
                        DataAccess.CorrectApplicantExamQuestion(lblStudentExamQuestionID.Text, txtStudentMark.Text);
                    else {
                        valid = false;
                        txtStudentMark.CssClass += " isra-error";
                    }
                }
                else
                    valid = false;
            }
        }
        if (valid)
        {
            DataTable DT = DataAccess.CalculateApplicantExamMarks(lblStudentExamID.Text);
            Repeater1.DataBind();
            Repeater2.DataBind();
            ShowMsg("تم التصليح وجمع العلامات بنجاح", "success");
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


    protected void lbStudentsExams_Click(object sender, EventArgs e)
    {
        Session["ExamFormID"] = lblExamFormID.Text;
        Response.Redirect("ApplicantsExams");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ExamFormView : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblExamFormID.Text == "")
            {
                if (Session["ExamFormID"] != null)
                {
                    lblExamFormID.Text = Session["ExamFormID"].ToString();
                    Session["ExamFormID"] = null;
                    DataTable DT = DataAccess.ExamFormGet(lblExamFormID.Text);
                    lblCourseID.Text = DT.Rows[0]["CourseID"].ToString();
                    //Repeater1.DataSource = DT;
                    //Repeater1.DataBind();
                }
                else
                    Response.Redirect("ExamForm");
            }
        }
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterItem item = e.Item;
        string QuestionTypeID = ((Label)item.FindControl("lblQuestionTypeID")).Text;
        string CorrectAnswer = ((Label)item.FindControl("lblCorrectAnswer")).Text;

        if (QuestionTypeID == "1" || QuestionTypeID == "2")
        {
            RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");
            if (CorrectAnswer != "")
                rblAnswers.Items.FindByValue(CorrectAnswer).Attributes["style"] = "color:green;";
        }
    }
}
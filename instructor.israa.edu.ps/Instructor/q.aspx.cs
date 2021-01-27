using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_q : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            {
                rblAnswers.SelectedValue = CorrectAnswer;
                rblAnswers.Items.FindByValue(CorrectAnswer).Attributes["style"] = "color:green;";
            }
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Student_StudentPoll : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
            //if (da.status == 1)
            //{
            //    Response.Redirect("StudentAcademicWarning.aspx");
            //}

            if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
            {
                Response.Redirect("ReadRool.aspx");
            }

            if (!DataAccess.IsStudentHavePoll(StudentID))
            {
                Response.Redirect("Default.aspx");
            }

          
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label OfferdPollID = (Label)item.FindControl("OfferdPollID");
            Label PollID = (Label)item.FindControl("PollID");
            RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");

            if (rblAnswers.SelectedItem != null)
            {
                DataTable DT = DataAccess.AddStdPollAnswer(StudentID, OfferdPollID.Text, rblAnswers.SelectedValue);
                ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            }
        }
        if (!DataAccess.IsStudentHavePoll(StudentID))
        {
            Response.Redirect("Default.aspx");
        }
        Repeater1.DataBind();
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }
}
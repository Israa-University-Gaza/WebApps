using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_StudentIssuesAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
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
                if (DataAccess.IsStudentHavePoll(StudentID))
                {
                    Response.Redirect("StudentPoll.aspx");
                }
                //if (!DataAccess.IsStudentFinishEvaluation(StudentID))
                //{
                //    Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
                //}

             
                if (Session["IssueID"] != null)
                {
                    lblIssueID.Text = Session["IssueID"].ToString();
                    Session["IssueID"] = null;
                    DataTable dt = DataAccess.GetIssue(lblIssueID.Text);
                    if (dt.Rows.Count > 0)
                    {
                        Issues.SelectedValue = dt.Rows[0]["IssueID"].ToString();
                        Issues.Enabled = false;
                        Description.Text = dt.Rows[0]["Describtion"].ToString();

                    }
                    else
                    {
                        ShowToast(this, "بالرجاء ادخال بيانات سليمة ", "", "error");
                    }
                }
            }
        }
        catch
        {
            ShowToast(this, "بالرجاء ادخال بيانات سليمة", "", "error");

        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        bool valid1 = ValidateControls(new WebControl[] { Issues, Description });
        bool valid2 = RadioValidateControls(new WebControl[] { Issues });

        if (valid1 && valid2)
        {
            DataTable DT = DataAccess.StudentIssueAddEdit(lblIssueID.Text, Issues.SelectedValue, StudentID, Description.Text, StudentID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (DT.Rows.Count > 0)
            {
                Issues.Enabled = true;
                EmptyControls(new WebControl[] { lblIssueID, Description });
                Issues.SelectedValue = null;
            }
            else
            {
                ShowToast(this, "لايوجد بيانات صحيحة", "", "error");
            }
        }
        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        Issues.Enabled = true;
        Issues.SelectedValue = null;
        EmptyControls(new WebControl[] { lblIssueID, Description });
    }

}
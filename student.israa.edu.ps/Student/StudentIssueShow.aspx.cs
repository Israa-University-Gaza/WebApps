using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Student_StudentIssueShow : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
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
        if (!DataAccess.IsStudentFinishEvaluation(StudentID))
        {
            Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }
       /* if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("BlockStudent.aspx");
        }*/
      


    }

    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        Session["IssueID"] = id;
        Response.Redirect("StudentIssuesAddEdit.aspx");
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.DeleteIssue(id, StudentID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}
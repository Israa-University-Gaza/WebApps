using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentCourse : UserPage
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


    }

    protected void lbStudentCourseAdd_Click(object sender, EventArgs e)
    {


        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string OfferdCourseID = ((Label)ri.FindControl("OfferdCourseID")).Text;
        string CourseID = ((Label)ri.FindControl("CourseID")).Text;
        DataTable DT = DataAccess.StudentCourseAdd(ddlSemester.SelectedValue, StudentID, OfferdCourseID, CourseID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            Repeater1.DataBind();
        }


    }
    protected void lbStudentCourseDelete_Click(object sender, EventArgs e)
    {


        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string ID = ((Label)ri.FindControl("ID")).Text;
        DataTable DT = DataAccess.StudentCourseDelete(ID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            Repeater1.DataBind();
        }


    }
}
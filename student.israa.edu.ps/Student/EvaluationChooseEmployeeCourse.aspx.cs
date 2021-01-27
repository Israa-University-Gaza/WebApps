using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Student_EvaluationChooseEmployeeCourse : UserPage
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



        //Response.Redirect("Default.aspx");
    }

    protected void btnStartEvaluation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("StdSectionID")).Text;
        string CourseCode = ((Label)ri.FindControl("CourseCode")).Text;
        string CourseArName = ((Label)ri.FindControl("CourseArName")).Text;
        string SectionNum = ((Label)ri.FindControl("SectionNum")).Text;
        string Employee = ((Label)ri.FindControl("Employee")).Text;
        Session["EvalutionStdSection"] = ID + "," + CourseCode + "," + CourseArName + "," + SectionNum + "," + Employee;
        Response.Redirect("EvaluationEmployeeCourse.aspx");
    }
}
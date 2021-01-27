using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StdSemesterMark : UserPage
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
	
        if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("BlockStudent.aspx");
        }


    }
    protected void lbRevision_Click(object sender, EventArgs e)
    {
        //RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        //string id = ((Label)ri.FindControl("StdSectionID")).Text;
        //DataTable DT = DataAccess.MarkRevision(id);
        //ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) {
        //    Repeater1.DataBind();
        //}
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicStudentsSemesterRemedialCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPermissionsContains("AcademicStudentStatistics"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }

    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/Student.aspx");
    }
}
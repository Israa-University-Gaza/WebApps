using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentCourseDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["CourseID"] != null && Request.QueryString["SemesterID"] != null)
            {
                string CourseID = Request.QueryString["CourseID"].ToString();
                string SemesterID = Request.QueryString["SemesterID"].ToString();
                DataTable DT = DataAccess.GetCourseStudentCourse(CourseID, SemesterID);
                if (DT.Rows.Count > 0)
                {
                    title.Text = DT.Rows[0]["CourseName"].ToString();
                    ListView1.DataSource = DT;
                    ListView1.DataBind();
                    msg.Visible = false;
                    tableshow.Visible = true;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                }
                else
                {
                    msg.Visible = true;
                    tableshow.Visible = false;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                }
            }
        }
    }
}
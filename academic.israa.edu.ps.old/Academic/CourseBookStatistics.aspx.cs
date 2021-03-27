using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseBookStatistics:UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Permissions.Contains("AcademicSyllabus"))
        {

            Response.Redirect("Default.aspx");
        }
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.DataBind();
        FormView2.DataBind();
        FormView3.DataBind();
    }

    protected void lbGoPage_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)li.FindControl("CollegeID")).Text;
        string SemesterID = ((Label)li.FindControl("SemesterID")).Text;
        string CollegeName = ((Label)li.FindControl("CollegeName")).Text;
        Session["CollegeID"] = CollegeID;
        Session["SemesterID"] = SemesterID;
        Session["CollegeName"] = CollegeName;
        Response.Redirect("CourseBookUnAccreditStatistics1.aspx");
    }

    protected void lbGoPage1_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)li.FindControl("CollegeID")).Text;
        string SemesterID = ((Label)li.FindControl("SemesterID")).Text;
        string CollegeName = ((Label)li.FindControl("CollegeName")).Text;
        Session["CollegeID"] = CollegeID;
        Session["SemesterID"] = SemesterID;
        Session["CollegeName"] = CollegeName;
        Response.Redirect("CourseBookRequestUnAccreditStatistics1.aspx");
    }

    protected void lbGoPage2_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)li.FindControl("CollegeID")).Text;
        string SemesterID = ((Label)li.FindControl("SemesterID")).Text;
        string CollegeName = ((Label)li.FindControl("CollegeName")).Text;
        Session["CollegeID"] = CollegeID;
        Session["SemesterID"] = SemesterID;
        Session["CollegeName"] = CollegeName;
        Response.Redirect("CourseBookRequestUnAccreditStatistics3.aspx");
    }
}
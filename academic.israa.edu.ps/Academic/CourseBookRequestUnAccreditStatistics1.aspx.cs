using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseBookRequestUnAccreditStatistics1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SemesterID"] != null && Session["CollegeID"] != null)
            {
                lblCollegeID.Text = Session["CollegeID"].ToString();
                Session["CollegeID"] = null;
                lblSemesterID.Text = Session["SemesterID"].ToString();
                Session["SemesterID"] = null;
                CollegeName.Text = Session["CollegeName"].ToString();
                Session["CollegeName"] = null;
            }
            else
            {
                Response.Redirect("CourseBookStatistics.aspx");
            }

        }
    }
}
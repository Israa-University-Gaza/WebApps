using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Syllabus_UserControl_SyllabusMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
            {
                lblSyllabusID.Text = Session["SyllabusID"].ToString();
                Session["SyllabusID"] = null;
            }
            else
                Response.Redirect("/Instructor/Default");

            if (Session["CourseName"] != null)
            {
                lblCourseName.Text = Session["CourseName"].ToString();
                Session["CourseName"] = null;
            }
            else
                Response.Redirect("/Instructor/Default");
        }
    }

    protected void lbMenu1_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusGeneralDescription");
    }

    protected void lbMenu2_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusGoals");
    }

    protected void lbMenu3_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusBookReference");
    }

    protected void lbMenu4_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusDetailedDescriptions");
    }

    protected void lbMenu5_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusActivities");
    }

    protected void lbMenu6_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusOutcomes");
    }

    protected void lbMenu7_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusEvaluation");
    }

    protected void lbMenu8_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusAccreditation");
    }
}
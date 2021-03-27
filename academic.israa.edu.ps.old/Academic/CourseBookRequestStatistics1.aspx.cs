using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseBookRequestStatistics1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.QueryString["SemesterID"] != null)
            {
                lblSemesterID.Text = Request.QueryString["SemesterID"].ToString();
            }
            else
            {
                Response.Redirect("CourseBookStatistics.aspx");
            }

        }
    }
}
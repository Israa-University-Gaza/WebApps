using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_OfferdCourseStudentCounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            ddlCourseStatus.DataBind();
            ddlCourseStatus.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }

    protected void dataBind_Click(object sender, EventArgs e)
    {
        ddlOfferdCourse.DataBind();
        ListView1.DataBind();
    }

    protected void dataBind1_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
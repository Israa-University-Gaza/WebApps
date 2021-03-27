using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SemesterSectionStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
       // ddlSection.Items.Add(new ListItem { Value = "-1", Text = "الكل" });
        ddlSection.DataBind();
        
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
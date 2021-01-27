using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_OfferdCourseManage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        divSections.Visible = true;
        DataTable DT = DataAccess.GetOfferdCourseSections(id);
        Repeater1.DataSource = DT;
        Repeater1.DataBind();
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnView_Click1(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
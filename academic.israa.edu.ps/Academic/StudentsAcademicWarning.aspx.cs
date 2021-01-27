using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StudentsAcademicWarning :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlProgram.DataBind();
            ddlProgram.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlSemester.DataBind();
            ddlSemester.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }

    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
    }

    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/Student.aspx");
    }
}
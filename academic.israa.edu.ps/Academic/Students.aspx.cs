using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Students : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = EmployeeID;
        if (!Permissions.Contains("StudentSearch"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/Student.aspx");
    }

    protected void LinkButton1_OnClick(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
       var id = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/StudentMain.aspx?id="+id);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_Students : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlStudentStatus.DataBind();
            ddlStudentStatus.SelectedValue = "1";
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
        Response.Redirect("~/Financial/Student.aspx");
    }
}
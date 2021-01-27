using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentsImages : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Students"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView2.DataBind();
    }

    protected void UserLink_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Response.Redirect("~/Admission/StudentTest.aspx?id=" + ((Label)item.FindControl("StudentID2")).Text+"&tab=1");
    }
}
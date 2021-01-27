using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_DeanRequiredTransforamtion : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("DeanTransforamtionAccreditation"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void lbEditTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        Session["StudentID"] = id;
        Response.Redirect("~/Academic/Student.aspx#tab3");
    }
}
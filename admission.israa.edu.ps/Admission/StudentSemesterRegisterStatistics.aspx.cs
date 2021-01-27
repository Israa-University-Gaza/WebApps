using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentSemesterRegisterStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Admission/Student.aspx");
    }
}
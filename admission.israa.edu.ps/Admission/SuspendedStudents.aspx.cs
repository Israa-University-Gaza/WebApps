using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_SuspendStudentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
         ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Response.Redirect("~/Admission/Student.aspx?id=" + ((Label)item.FindControl("StudentID")).Text);    }
}
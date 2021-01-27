using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcceptStudentCondition1 : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbView_Click(object sender, EventArgs e)
    {
        ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StdID"] = ((Label)ri.FindControl("StudentID")).Text;
        Session["StdTypeID"] = ((Label)ri.FindControl("StudentTypeID")).Text;
        Response.Redirect("~/Academic/StudentConditionApp.aspx");
    }
}
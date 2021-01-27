using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbOpenEmployee_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        Session["EmployeeID"] = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("Employee.aspx");
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
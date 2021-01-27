using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbOpenEmployee_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        Session["Emp_ID"] = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void lbEmployeeCategories_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        Session["Emp_ID"] = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("~/APP_HRM/EmployeeTypeCategoryAddEdit.aspx");
    }
}
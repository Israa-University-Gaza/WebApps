using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Profile_Veiw : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Emp_ID"] = null;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Emp_ID"] = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
    }
    protected void btn1Filter_Click(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string CVid = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("../ReportView.aspx?CVid="+CVid);
    }
    //protected void LinkButton3_Click(object sender, EventArgs e)
    //{
    //    RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
    //    Session["infoEmpID"] = ((Label)ri.FindControl("EmpID")).Text;
    //    Response.Redirect("AddNewEmployee.aspx");
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?Names=" + 1);
    }
}
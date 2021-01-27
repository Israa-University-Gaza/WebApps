using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_EvaluationChooseEmployee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = EmployeeID;
    }
    protected void btnStartEvaluation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("EmpID")).Text;
        string Employee = ((Label)ri.FindControl("Employee")).Text;
        string collageName = collage.SelectedItem.Text;
        Session["EvalutionEmployee"] = ID + "," + Employee + "," + collageName+","+"";
        Response.Redirect("AcadmicEvaluateEmployee.aspx");
    }
    protected void btnUpdateEvaluation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("EmpID")).Text;
        string Employee = ((Label)ri.FindControl("Employee")).Text;
        string collageName = collage.SelectedItem.Text;
        Session["EvalutionEmployee"] = ID + "," + Employee + "," + collageName+ ","+ID;
        Response.Redirect("AcadmicEvaluateEmployee.aspx");
    }
}
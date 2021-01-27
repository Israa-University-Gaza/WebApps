using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_EmpSalaryFormReport : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?month1=" + DropDownList1.SelectedValue + "&year1=" + TextBox1.Text + "&Emp_ID=" + UserID);
    }
}
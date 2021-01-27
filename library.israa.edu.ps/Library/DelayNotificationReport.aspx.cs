using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_DelayNotificationReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void print_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?Notify=" + RadioButtonList1.SelectedValue);
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
}
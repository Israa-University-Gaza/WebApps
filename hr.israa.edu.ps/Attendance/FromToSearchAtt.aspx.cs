using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_FromToSearchAtt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
      //  Repeater1.DataBind();

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReportView.aspx?YearNF=" + TextBox1.Text + "&&MonthNF=" + DDMonth.SelectedValue);

    }
}
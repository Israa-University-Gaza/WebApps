using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_LibraryRegisterReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void print_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?Registerfrom=" + from.Text + "&Registerto=" + to.Text);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Default : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        Label count = (Label)GridView1.HeaderRow.FindControl("count");
        Label count0 = (Label)GridView1.HeaderRow.FindControl("count0");
        count.Text = GridView1.Rows.Count.ToString();
        count0.Text = m.hr_emp_users_COUNT();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
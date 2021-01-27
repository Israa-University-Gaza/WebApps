using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default7 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");
        h1.HRef = "OtherExperiences.aspx";
        h2.HRef = "PracticalLife.aspx";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        m.hr_emp_identifier_add(Convert.ToInt32(Session["emp_id"].ToString()), exp_name.Text, exp_addr.Text, exp_type.Text);
        GridView1.DataBind();
    }
}
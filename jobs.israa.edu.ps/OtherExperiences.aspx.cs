using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default6 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        h1.HRef = "PersonalSkills.aspx";
        h2.HRef = "Identifiers.aspx";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (extra_name.Text != "")
        {
            m.hr_emp_extra_add(Convert.ToInt32(Session["emp_id"].ToString()), extra_name.Text);
            GridView1.DataBind();
        }
    }
}
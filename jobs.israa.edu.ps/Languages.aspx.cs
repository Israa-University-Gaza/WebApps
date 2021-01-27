using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (GridView1.Rows.Count > 0)
        //    not_found.Visible = false;
        //else
        //    not_found.Visible = true;
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        h1.HRef = "ScientificData.aspx";
        h2.HRef = "Experiences.aspx";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        m.hr_emp_lang_add(Convert.ToInt32(Session["emp_id"].ToString()), DropDownList3.SelectedItem.Text, lan_conversation.SelectedItem.Text, lan_write.SelectedItem.Text, lan_read.SelectedItem.Text, TextBox1.Text);
        GridView1.DataBind();
    }
}
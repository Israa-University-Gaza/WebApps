using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default8 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        if (!IsPostBack)
        {
            DataTable dt = m.get_Future(Convert.ToInt32(Session["emp_id"].ToString()));
            try
            {
                fut.Text = dt.Rows[0][0].ToString();
            }
            catch
            { }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        m.add_Future(Convert.ToInt32(Session["emp_id"].ToString()), fut.Text);
        Response.Redirect("Attachments.aspx");
    }
}
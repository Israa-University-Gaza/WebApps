using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");
        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("Label2") != null)
            if (DataBinder.Eval(e.Row.DataItem, "Deadline") != null)
            {
                CultureInfo culture = new CultureInfo("gsw-FR");
                DateTime Deadline = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Deadline"), culture);
                Label Label2 = (Label)e.Row.FindControl("Label2");
                Label2.Text = Deadline.ToString("dd/MM/yyyy");
            }
        if (Session["stat"].ToString() == "no")
        {
            if (e.Row.FindControl("HyperLink1") != null)
            {
                HyperLink HyperLink1 = (HyperLink)e.Row.FindControl("HyperLink1");
                HyperLink1.Enabled = false;
                HyperLink1.Text = "لا يمكن التقديم";
                HyperLink1.ToolTip = "يرجى استكمال السيرة الذاتية";
            }
        }

    }
}
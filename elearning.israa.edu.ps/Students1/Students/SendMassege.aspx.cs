using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_SendMassege : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        if (!IsPostBack)
        {
            Done.Visible = false;
        }
            Label1.Text = r.lec_name(Request.QueryString["id"]);
        sender1.Text = Session["name"].ToString();


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        r.e_masseges_add(Session["log"].ToString(), Session["name"].ToString(), title.Text, Editor2.Text, Request.QueryString["id"], Label1.Text);

        mas.Visible = false;
        Done.Visible = true;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_createSession : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session.Clear();
        //Session.Abandon();
        //Session.RemoveAll();
        if (Session["admin"] == null)
            Response.Redirect("login.aspx");
            Session["log"] = Request.QueryString["id"];
        Session["name"] = Request.QueryString["name"];
        Session["role"] = "1";
        Session["last_log"] = Request.QueryString["last_log"];
        Response.Redirect("../Instructor");
    }
}
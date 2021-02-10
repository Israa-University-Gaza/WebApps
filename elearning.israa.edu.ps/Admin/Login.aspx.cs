using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            no.Visible = false;
        if (Request.QueryString["login"] != null)
        {
            log.Visible = true;
            Label1.Text = Request.QueryString["login"];
        }
        else
            log.Visible = false   ;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (loginId.Text == "dept1" && password.Text == "israa@departments@100")
        {
            Session["admin"] = "ok";
            Session["typ"] = "الشؤون الاكاديمية";
            Response.Redirect("lec.aspx");
        }
            
    }

}


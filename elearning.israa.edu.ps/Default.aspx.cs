using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] == null)
            Response.Redirect("Login.aspx");



        if (Session["role"].ToString() == "1")
            Response.Redirect("Instructor");

        else
        {


            if (Session["role"].ToString() == "2")
                Response.Redirect("Students");
            else
                Response.Redirect("Login.aspx");
        }

       



    }
}
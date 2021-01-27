using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lock : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      
        if (TextBox1.Text == "israa@hr@360")
        {
            Session["adminin"] = "1";
            Response.Redirect("Default.aspx");
        }
        else
            msg.Visible = true;

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogOff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Cookies.Remove("emp_id");
        Response.Cookies["emp_id"].Expires = DateTime.Now.AddDays(-1d);
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moodle_loginMoodle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Value = Request.QueryString["user"];
        password.Value = Request.QueryString["pass"];
    }
}
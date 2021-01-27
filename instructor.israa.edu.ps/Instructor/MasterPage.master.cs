using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = Context.User.Identity.Name;
    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void lbLock_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session["LockedUser"] = Context.User.Identity.Name;
        Response.Redirect("~/Lock");
    }
}
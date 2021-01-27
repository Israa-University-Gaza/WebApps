using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_E_BookView : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = UserID;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
      Session["E_ID"] = ((Label)ri.FindControl("Label2")).Text;
       Response.Redirect("E_BookAddEdit.aspx");
    }
}
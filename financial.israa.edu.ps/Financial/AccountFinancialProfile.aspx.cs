using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_AccountFinancialProfile : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                    lblAccountID.Text = Request.QueryString["id"];
                else
                    Response.Redirect("~/Financial/Account.aspx");
            }
            else if (lblAccountID.Text == "")
            {
                Response.Redirect("~/Financial/Account.aspx");
            }
        }
    }
}
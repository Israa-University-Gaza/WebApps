﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Visitors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["VisitorID"] = ((Label)item.FindControl("VisitorID")).Text;
        Response.Redirect("Visitor.aspx");
    }
}
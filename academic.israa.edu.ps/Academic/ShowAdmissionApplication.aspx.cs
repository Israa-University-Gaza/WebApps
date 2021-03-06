﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_ShowAdmissionApplication : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void lbView_Click(object sender, EventArgs e)
    {
        ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StdID"] = ((Label)ri.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/StudentAdmissionApp.aspx");
    }
}
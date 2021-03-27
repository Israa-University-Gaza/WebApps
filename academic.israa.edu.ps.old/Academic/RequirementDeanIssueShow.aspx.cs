﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_RequirementDeanIssueShow :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Permissions.Contains("RequirementDeanIssueShow"))
            UserID.Text = EmployeeID;
        else
            Response.Redirect("Default.aspx");
    }

    protected void BtnAcceptReject_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        string Place = ((Label)li.FindControl("Place")).Text;
        string MinOrderDepartment = ((Label)li.FindControl("MinOrderDepartment")).Text;
        Session["IssueID"] = id;
        Session["Place"] = Place;
        Session["MinOrderDepartment"] = MinOrderDepartment;
        Response.Redirect("Accept-RejectStudentsIssues.aspx");
    }
}
﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicMarkRevision : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("AcademicSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnAcceptRequest_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string MarkRevisionID = ((Label)item.FindControl("MarkRevisionID")).Text;

        DataTable DT = DataAccess.AcceptRegictMarkRevisionRequest(MarkRevisionID, "3", true, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void btnRejectRequest_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string MarkRevisionID = ((Label)item.FindControl("MarkRevisionID")).Text;

        DataTable DT = DataAccess.AcceptRegictMarkRevisionRequest(MarkRevisionID, "3", false, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    //protected void btnMarkUnaccreditation_Click(object sender, EventArgs e)
    //{
    //    ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
    //    string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
    //    DataTable DT = DataAccess.SetMarkUnaccreditation(StdSectionID, 4);
    //    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
    //    if (DT.Rows[0]["status"].ToString() != "0")
    //    {
    //        ListView1.DataBind();
    //    }
    //}
}
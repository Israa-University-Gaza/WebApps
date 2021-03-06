﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicCourseTransformationStudents : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("AcademicSectionStudents"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        Repeater1.DataBind();
    }
    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Academic/Student.aspx");
    }
}
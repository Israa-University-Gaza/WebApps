﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpTasks_TasksAllEmpView : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmpID.Text = UserID;
        if (!Permissions.Contains("TasksAllEmpView"))
        {
            //Response.Redirect("../Login.aspx");
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void DDMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void Date_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
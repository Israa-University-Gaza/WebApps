using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_OfferdCourseManage2 : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = EmployeeID;
        if (!IsPostBack)
        {

          
            ddlStudyLevel.DataBind();
            ddlStudyLevel.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlOfferdCourseType.DataBind();
            ddlOfferdCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlCCourseType.DataBind();
            ddlCCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }

    protected void dataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
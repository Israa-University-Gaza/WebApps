using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_OfferdCourseManage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlStudyLevel.DataBind();
            ddlStudyLevel.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlOfferdCourseType.DataBind();
            ddlOfferdCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlCCourseType.DataBind();
            ddlCCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
        }
        divSections.Visible = false;
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        divSections.Visible = true;
        DataTable DT = DataAccess.GetOfferdCourseSections(id);
        Repeater1.DataSource = DT;
        Repeater1.DataBind();
    }


    protected void dataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
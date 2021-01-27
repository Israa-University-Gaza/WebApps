using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_SemesterCollegeStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCollege.DataBind();
            ddlCollege.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        ListView2.DataBind();
        ListView3.DataBind();
        ListView5.DataBind();
    }



    protected void LinkButton_TotalAmount_Click(object sender, EventArgs e)
    {

        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)item.FindControl("CollegeID")).Text;
        ListView3.DataSource = DataAccess.GetSemesterCollegeTotalStatistics(ddlSemester.SelectedValue, CollegeID);
        ListView3.DataBind();

    }

    protected void LinkButton_TotalIncomeAmount_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)item.FindControl("CollegeID")).Text;
        ListView2.DataSource = DataAccess.GetSemesterCollegeIncomeStatistics(ddlSemester.SelectedValue, CollegeID);
        ListView2.DataBind();
    }

    protected void LinkButton_TotalReterunAmount_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string CollegeID = ((Label)item.FindControl("CollegeID")).Text;
        ListView5.DataSource = DataAccess.GetSemesterCollegeReturnStatistics(ddlSemester.SelectedValue, CollegeID);
        ListView5.DataBind();
    }
}
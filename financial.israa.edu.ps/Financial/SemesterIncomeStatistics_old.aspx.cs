using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_SemesterIncomeStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Search_Click(object sender, EventArgs e)
    {
       
        ListView3.DataBind();
        ListView4.DataBind();
        ListView5.DataBind();
    }



    protected void LinkButton_TotalAmount_Click(object sender, EventArgs e)
    {
        /*by RSR
         * ListView4.DataSource = DataAccess.GetSemesterTotalStatistics(ddlSemester.SelectedValue);
        ListView4.DataBind();
        */

    }

    protected void LinkButton_TotalIncomeAmount_Click(object sender, EventArgs e)
    {
        /*by RSR
         * ListView5.DataSource = DataAccess.GetSemesterIncomeStatistics(ddlSemester.SelectedValue);
        ListView5.DataBind();
        */
    }

    protected void LinkButton_TotalReterunAmount_Click(object sender, EventArgs e)
    {
        /*by RSR
         * ListView6.DataSource = DataAccess.GetSemesterReturnStatistics(ddlSemester.SelectedValue);
        ListView6.DataBind();
        */
    }
}
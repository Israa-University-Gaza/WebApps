using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_SemesterIncomeStatisticsDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtDateFrom.Text = DateTime.Now.AddDays(-30).ToString("yyyy/MM/dd");
            txtDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        ListView2.DataBind();
    }
}
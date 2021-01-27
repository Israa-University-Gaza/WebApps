using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StdSectionRegistreStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { if (!IsPostBack)
        {
        txtDateFrom.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
        txtDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
}
    }

    protected void DataBind_Click(object sender, EventArgs e)
    {

        ListView1.DataBind();
    }
}
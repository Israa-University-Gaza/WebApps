using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StdHowKnowStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
}
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SemesterEmployeesTotalHours : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlFilterSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
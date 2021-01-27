using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AcademicStudentStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Permissions.Contains("AcademicStudentStatistics"))
        //    Response.Redirect("Default.aspx");
    }
}
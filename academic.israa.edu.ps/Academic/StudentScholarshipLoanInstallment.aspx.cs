using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StudentScholarshipLoanInstallment : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("StudentScholarshipAccreditation"))
        {
            Response.Redirect("Default.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SectionStudentsMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("SectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    
    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Student_BlockStudent : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "1")
        {
            Response.Redirect("Default.aspx");
        }
    }
    
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentsCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbGoStudent_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("lblStudentID")).Text;
        Response.Redirect("~/Admission/Student.aspx?id=" + id);
    }



    protected void txtStudentName_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
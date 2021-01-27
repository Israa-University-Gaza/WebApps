using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_SemesterStudentsInstallments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void lbBalance_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Affairs/StudentFinancialProfile.aspx");
    }

    protected void lbStudentName_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Affairs/Student.aspx");
    }

    protected void lbStudentInstallments_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["StudentID"] = ((Label)item.FindControl("StudentID")).Text;
        Response.Redirect("~/Affairs/StudentInstallment.aspx#tab7");
    }

    //protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //ListView1.DataBind();
    //}
}
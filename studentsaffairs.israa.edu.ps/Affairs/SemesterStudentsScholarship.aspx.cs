using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_SemesterStudentsLoans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["SemesterID"] != null && Request.QueryString["ActionID"] != null)
            {
                ddlSemester.SelectedValue = int.Parse(Request.QueryString["SemesterID"]).ToString();
                ddlAction.SelectedValue = int.Parse(Request.QueryString["ActionID"]).ToString();
            }
        }
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
        Response.Redirect("~/Financial/StudentInstallment.aspx");
    }
}
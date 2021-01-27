using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_IssuesSearch : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            UserID.Text = EmployeeID;
        }
    }


    protected void BtnViewIssueDetails_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        Session["IssueID"] = id;
        Response.Redirect("IssueDetails.aspx");
    }

    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataSource = SqlDataSource1;
        ListView1.DataBind();
    }
}
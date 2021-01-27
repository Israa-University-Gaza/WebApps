using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AdmissionIssueDetails : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserID.Text = EmployeeID;
        try
        {
            if (!IsPostBack)
            {
                if (Session["IssueID"] != null)
                {
                    lblIssueID.Text = Session["IssueID"].ToString();
                    Session["IssueID"] = null;
                    DataTable dt = DataAccess.GetIssue(lblIssueID.Text);
                    if (dt.Rows.Count > 0)
                    {
                        StudentName.Enabled = false;
                        StudentName.Text = dt.Rows[0]["StudentName"].ToString();
                        txtStudentNo.Enabled = false;
                        txtStudentNo.Text = dt.Rows[0]["StudentNo"].ToString();
                        txtStudentCollege.Enabled = false;
                        txtStudentCollege.Text = dt.Rows[0]["StudentCollege"].ToString();
                        Issue.Enabled = false;
                        Issue.Text = dt.Rows[0]["IsuueName"].ToString();
                        Issue.Enabled = false;
                        txtIssueDate.Text = dt.Rows[0]["InsertDate"].ToString();
                        txtIssueDate.Enabled = false;
                        Description.Text = dt.Rows[0]["Describtion"].ToString();
                        Description.Enabled = false;
                    }
                    else
                    {
                        ShowToast(this, "لايمكنك اتمام العملية ", "", "error");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
        catch
        {
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("id")).Text;
        DataTable DT = DataAccess.ReAccredationIssue(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}

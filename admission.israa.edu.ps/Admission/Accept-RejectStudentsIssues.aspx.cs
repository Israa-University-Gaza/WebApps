using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admission_Accept_RejectStudentsIssues : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserID.Text = EmployeeID;
        
            if (!IsPostBack)
            {
                if (Session["IssueID"] != null && Session["Place"] != null)
                {
                    lblIssueID.Text = Session["IssueID"].ToString();
                    Session["IssueID"] = null;
                    lblPlaceID.Text = Session["Place"].ToString();
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
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { Opinion });
        if (valid)
        {
            DataTable DT = DataAccess.AccredationIssue(lblIssueID.Text, "1", Opinion.Text, lblPlaceID.Text, UserID.Text);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                btnAccept.Enabled = false;
                btnReject.Enabled = false;
                btnReturn.Enabled = false;
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "لايمكن اتمام العملية", "", "error");
            }
        }
        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { Opinion });
        if (valid)
        {
            DataTable DT = DataAccess.AccredationIssue(lblIssueID.Text, "2", Opinion.Text, lblPlaceID.Text, UserID.Text);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                btnAccept.Enabled = false;
                btnReject.Enabled = false;
                btnReturn.Enabled = false;
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "لايمكن اتمام العملية", "", "error");
            }
        }
        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }
    }
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { Opinion });
        if (valid)
        {
            DataTable DT = DataAccess.AccredationIssue(lblIssueID.Text, "3", Opinion.Text, lblPlaceID.Text, UserID.Text);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                btnAccept.Enabled = false;
                btnReject.Enabled = false;
                btnReturn.Enabled = false;
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "لايمكن اتمام العملية", "", "error");
            }
        }
        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }
    }
}
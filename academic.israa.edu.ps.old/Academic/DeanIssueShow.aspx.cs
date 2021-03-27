using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeanIssueShow : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPermissionsContains("DeanIssueShow") || IsPermissionsContains("HeadIssueShow"))
        {
            UserID.Text = EmployeeID;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void BtnAcceptReject_Click(object sender, EventArgs e)
    {
    ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
    string id = ((Label)li.FindControl("ID")).Text;
    string Place = ((Label)li.FindControl("Place")).Text;
    string MinOrderDepartment = ((Label)li.FindControl("MinOrderDepartment")).Text;
    //Session["IssueID"] = id;
    //Session["Place"] = Place;
    //Session["MinOrderDepartment"] = MinOrderDepartment;
    Response.Redirect("Accept-RejectStudentsIssues.aspx?id="+id+ "&Place="+Place+ "&MinOrderDepartment="+ MinOrderDepartment);
    }

    protected void lbTransferIssue_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("id")).Text;

        DataTable DT = DataAccess.UpdateAccreditationSeries(id,EmployeeID);
        if (DT.Rows.Count > 0)
        {
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        }

    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbTransferIssueCollege_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        lblStudentIssueID.Text = id;
        divTransfer.Visible = true;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlIssueColleges, txtReason });
        if (Validate)
        {
            DataTable DT = DataAccess.TransferStudentIssueCollege(lblStudentIssueID.Text,ddlIssueColleges.SelectedValue,txtReason.Text,EmployeeID,"2");
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                divTransfer.Visible = false;
                ListView1.DataBind();

            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }
}
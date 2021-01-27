using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_MidtermMarkRevision : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("Default");
    }

    protected void btnAcceptRequest_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string MarkRevisionID = ((Label)item.FindControl("MarkRevisionID")).Text;
        string lblMidtermMark = ((Label)item.FindControl("lblMidtermMark")).Text;
        string txtMidtermMark = ((TextBox)item.FindControl("txtMidtermMark")).Text;
        if (lblMidtermMark != txtMidtermMark)
        {
            DataTable DT = DataAccess.AcceptMidtermMarkRevisionRequest(MarkRevisionID, txtMidtermMark, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg("قم بإدخال الدرجة بعد المراجعة لقبول الطلب", "danger");
        }
    }

    protected void btnRejectRequest_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string MarkRevisionID = ((Label)item.FindControl("MarkRevisionID")).Text;

        DataTable DT = DataAccess.AcceptRegictMarkRevisionRequest(MarkRevisionID, false, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }
}
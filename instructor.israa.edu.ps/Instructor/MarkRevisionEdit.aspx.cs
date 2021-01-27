using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_MarkRevision : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MarkRevisionID"] != null)
                lblMarkRevisionID.Text = Session["MarkRevisionID"].ToString();
            else
                Response.Redirect("/Instructor/MarkRevision");
        }
    }

    protected void btnAcceptRequest_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string lblWorkMark = ((Label)item.FindControl("lblWorkMark")).Text;
        string lblFinalMark = ((Label)item.FindControl("lblFinalMark")).Text;
        string txtWorkMark = ((TextBox)item.FindControl("txtWorkMark")).Text;
        string txtFinalMark = ((TextBox)item.FindControl("txtFinalMark")).Text;
        TextBox txtUpdateReason = ((TextBox)item.FindControl("txtUpdateReason"));
        if (lblWorkMark != txtWorkMark || lblFinalMark != txtFinalMark)
        {
            if (ValidateControls(new WebControl[] { txtUpdateReason }))
            {
                DataTable DT = DataAccess.AcceptMarkRevisionRequest(lblMarkRevisionID.Text, txtWorkMark, txtFinalMark, txtUpdateReason.Text, EmployeeID);
                ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
                if (DT.Rows[0]["status"].ToString() != "0")
                {
                    Repeter1.DataBind();
                }
            }
            else
            {
                ShowMsg("الرجاء ذكر سبب تعديل الدرجة", "danger");
            }
        }
        else
        {
            ShowMsg("الرجاء إدخال الدرجة بعد المراجعة لقبول الطلب", "danger");
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
            Response.Redirect("/Instructor/MarkRevision");
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentInstallment : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    lblStudentID.Text = Request.QueryString["id"];
                }
                else
                    Response.Redirect("~/Financial/Students.aspx");
            }
            else if (lblStudentID.Text == "")
            {
                Response.Redirect("~/Financial/Students.aspx");
            }
        }
    }

    protected void lbPaidInstallment_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentInstallmentID")).Text;
        DataTable DT = DataAccess.SetStudentInstallmentPaid(id);
        ListView3.DataBind();
        ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }
    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg.Visible = (msg != "");
    }
}
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Financial_StudentFromAccount : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lblStudentID.Text = Request.QueryString["id"];
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg.Visible = (msg != "");
    }

    protected void btnAddStudentFinancialReturn_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlAction, lblStudentID });
        if (Validate)
        {
            DataTable DT = DataAccess.AddStudentFinancialReturn(lblStudentID.Text, ddlAction.SelectedValue, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        }
        else
        {
            ShowMsg("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }
}
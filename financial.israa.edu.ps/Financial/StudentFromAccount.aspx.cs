using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;

public partial class Financial_StudentFromAccount : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lblStudentID.Text = Request.QueryString["id"];
        }
    }
    protected void AddAccountToStudentTransaction_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlAccount, lblStudentID, txtValue });
        if (Validate)
        {
            DataTable DT = DataAccess.AddAccountToStudentTransaction(ddlAccount.SelectedValue, lblStudentID.Text, txtValue.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            Response.Redirect("https://api.israa.edu.ps/students/printVoucher.php?VoucherNum=30329");
        }
        else
        {
            ShowMsg("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg.Visible = (msg != "");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentBlockExceptionAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lblStudentID.Text = Request.QueryString["id"];
        }

        if (!IsPostBack)
        {
            ddlSemester.DataSourceID ="SqlDataSource1";

        }
    }

    protected void btnStudentBlock_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlSemester, lblStudentID, txtNote });
        if (Validate)
        {
            DataTable DT = DataAccess.StudentBlockExceptionAdd(lblStudentID.Text, ddlSemester.SelectedValue, txtNote.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
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
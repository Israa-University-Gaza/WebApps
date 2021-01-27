using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_VisitorSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["VisitorID"] != null)
            {
                lblVisitorID.Text = Session["VisitorID"].ToString();
                Session["VisitorID"] = null;
            }
            else
            {
                Response.Redirect("Visitors.aspx");
            }
        }
    }

    protected void btnChechVisitor_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckVisitor(txtSSN.Text);
        if (DT.Rows.Count > 0)
        {
            Session["VisitorID"] = DT.Rows[0]["ID"].ToString();
            Response.Redirect("Visitor.aspx");
        }
        else
        {
            ShowToast(this, "رقم هوية الزائر غير صحيح", "", "error");
        }
    }

    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.GetVisitorMobile(lblVisitorID.Text);
        if (SendSMS(DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text))
        {
            ShowMsg9("تم إرسال الرسالة بنجاح", "success");
        }
        else
        {
            ShowMsg9("لم يتم إرسال الرسالة", "danger");
        }
    }

    public void ShowMsg9(string msg = "", string status = "warning")
    {
        lblMsg9.Text = msg;
        divMsg9.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg9.Visible = (msg != "");
    }
    protected void lbEditVisitor_Click(object sender, EventArgs e)
    {
        Session["VisitorID"] = lblVisitorID.Text;
        Response.Redirect("VisitorAddEdit.aspx");
    }
}
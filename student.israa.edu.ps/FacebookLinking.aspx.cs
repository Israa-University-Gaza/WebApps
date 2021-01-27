using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacebookLinking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtStudentNo.Text != "" && txtPassword.Text != "")
        {
            DataTable DT = DataAccess.StudentMessengerAccountLinking(txtStudentNo.Text, txtPassword.Text);
            if (DT.Rows.Count > 0)
            {
                if (int.Parse(DT.Rows[0]["status"].ToString()) > 0)
                {
                    Response.Redirect(Request.QueryString["redirect_uri"] + "&authorization_code=" + DT.Rows[0]["AuthorizationCode"].ToString());
                }
                else
                {
                    loginResponse.Visible = true;
                    lblMsg.Text = DT.Rows[0]["msg"].ToString();
                }
            }
        }
        else
        {
            if (txtStudentNo.Text == "")
                txtStudentNo.Attributes.Add("Class", "form-control placeholder-no-fix isra-error");
            if (txtPassword.Text == "")
                txtPassword.Attributes.Add("Class", "form-control placeholder-no-fix isra-error");
            loginResponse.Visible = true;
            lblMsg.Text = "الرجاء إدخال البيانات المطلوبة .";
        }
    }
}
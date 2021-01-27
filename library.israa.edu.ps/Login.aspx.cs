using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    DataAccess DA = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
            Response.Redirect("~/Library/Default.aspx");
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.IsValidEmployee(txtUsername.Text, txtPassword.Text);
        if (DT.Rows.Count > 0)
        {
            if (Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString()))
            {
                int empID = Convert.ToInt32(DT.Rows[0]["ID"].ToString());
                DataTable DT1 = DataAccess.IsEmployeeInSystem(empID, 16);
                if (DT1.Rows.Count > 0)
                {
                    FormsAuthentication.RedirectFromLoginPage(empID.ToString(), false);
                }
                else
                {
                    loginResponse.Visible = true;
                    lblMsg.Text = "لا يمكنك الدخول الي النظام";
                }
            }
            else
            {
                loginResponse.Visible = true;
                lblMsg.Text = "غير مفعل";
            }
        }
        else
        {
            loginResponse.Visible = true;
            lblMsg.Text = "خطأ في إسم المستخدم أو كلمة المرور";
        }
    }
    }

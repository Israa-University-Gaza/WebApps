﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["as"] != null)
            {
                FormsAuthentication.RedirectFromLoginPage(Request.QueryString["as"], false);
            }
            else
            {
                if (User.Identity.IsAuthenticated)
                    Response.Redirect("~/Instructor/Default");
                else if (Session["LockedUser"] != null)
                    Response.Redirect("~/Lock");
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.IsValidEmployee(txtEmployeeNo.Text, txtPassword.Text);
        if (DT.Rows.Count > 0)
        {
            if (Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString()))
            {
                string empID = DT.Rows[0]["ID"].ToString();
                DataTable DT1 = DataAccess.IsInstructorEmployee(empID);
                if (DT1.Rows.Count > 0)
                {
                    FormsAuthentication.RedirectFromLoginPage(empID, cbRememberMe.Checked);
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
            txtEmployeeNo.Attributes.Add("class", "gui-input font-Ta border-erorr");
            txtPassword.Attributes.Add("class", "gui-input font-Ta border-erorr");
        }
    }
}
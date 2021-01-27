﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ChangePassword : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtOldPassword, txtNewPassword, txtConfirmPassword });

        if (Validate)
        {
            if (txtNewPassword.Text == txtConfirmPassword.Text)
            {
               // DataTable DT = DataAccess.EmpChangePassword(EmployeeID, txtOldPassword.Text, txtNewPassword.Text);
               // ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
               // if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
               // {
               //     EmptyControls(new WebControl[] { txtOldPassword, txtNewPassword, txtConfirmPassword });
               // }
            }
            else
            {
                txtNewPassword.CssClass = txtConfirmPassword.CssClass = "form-control isra-error";
                ShowMsg("كلمتي المرور المدخلتين غير متطابقتين .", "danger");
            }
        }
        else
        {
            ShowMsg("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtOldPassword, txtNewPassword, txtConfirmPassword });
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status);
        divMsg.Visible = (msg != "");
    }
}
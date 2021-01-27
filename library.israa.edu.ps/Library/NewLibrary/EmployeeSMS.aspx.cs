﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_EmployeeSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["EmployeeID"] != null)
            {
                lblEmployeeID.Text = Session["EmployeeID"].ToString();
                DataTable DT = NewDataAccess.EmployeePhoto_Get(lblEmployeeID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Employees.aspx");
            }
        }
    }

    protected void btnChechEmployee_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckEmployee(txtEmployeeNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["EmployeeID"] = DT.Rows[0]["EmployeeID"].ToString();
            Response.Redirect("Employee.aspx");
        }
        else
        {
            ShowToast(this, "رقم الموظف غير صحيح", "", "error");
        }
    }

    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.GetEmployeeMobile(lblEmployeeID.Text);
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
}
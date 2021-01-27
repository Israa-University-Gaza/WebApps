using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LockedUser"] != null)
        {
            DataTable DT1 = DataAccess.GetEmployeeData(Session["LockedUser"].ToString());
            if (DT1.Rows.Count > 0)
            {
                lblEmployeeNo.Text = DT1.Rows[0]["EmployeeNo"].ToString();
                lblDisplayName1.Text = lblDisplayName2.Text = DT1.Rows[0]["DisplayName"].ToString();
                if (!Convert.IsDBNull(DT1.Rows[0]["Emp_Picture"]))
                {
                    byte[] imgBytes = (byte[])DT1.Rows[0]["Emp_Picture"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.IsValidEmployee(lblEmployeeNo.Text, txtPassword.Text);
        if (DT.Rows.Count > 0)
        {
            if (Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString()))
            {
                string empID = DT.Rows[0]["ID"].ToString();
                DataTable DT1 = DataAccess.IsInstructorEmployee(empID);
                if (DT1.Rows.Count > 0)
                {
                    FormsAuthentication.RedirectFromLoginPage(empID, false);
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

    protected void lbNotLocked_Click(object sender, EventArgs e)
    {
        Session["LockedUser"] = null;
        Response.Redirect("~/Login.aspx");
    }
}
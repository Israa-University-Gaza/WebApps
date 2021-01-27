using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
            {
                Response.Redirect("ReadRool.aspx");
            }

            else
                Response.Redirect("~/Student/Default.aspx");
        }
           
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtStudentNo.Text != "" && txtPassword.Text != "")
        {
            DataTable DT = DataAccess.IsValidStudent(txtStudentNo.Text, txtPassword.Text);
            if (DT.Rows.Count > 0)
            {
                if (int.Parse(DT.Rows[0]["status"].ToString()) > 0)
                {

                    if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
                    {
                        Response.Redirect("ReadRool.aspx");
                    }

                    else
                    FormsAuthentication.RedirectFromLoginPage(DT.Rows[0]["msg"].ToString(), false);
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
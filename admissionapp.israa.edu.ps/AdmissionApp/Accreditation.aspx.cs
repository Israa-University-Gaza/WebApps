using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_Accreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable DT = DA.StudentAppAccreditate(UserPage.StudentID);
        if (DT.Rows.Count > 0)
        {
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) == 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
            else
            {
                SendSMS(DT.Rows[0]["jawwal"].ToString(),DT.Rows[0]["smstext"].ToString());
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx");
            }
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SendSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (EmployeeID == "5017" || EmployeeID == "5275")
        {

        }
        else
        {
            Response.Redirect("Default.aspx");
        }


    }
    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        string result = "";
        bool status = false;
        string[] receviers = txtSMSReceviers.Text.Split(',');
        foreach (string recevier in receviers)
        {
            status = SendSMS(recevier, txtSMSBody.Text);
            if (status)
            {
                result += "تم إرسال الرسالة الى رقم " + recevier + " بنجاح<br />";
            }
            else
            {
                result += "لم يتم إرسال الرسالة الي الرقم " + recevier + "<br />";
            }
            DataAccess.AddSMSArchive(EmployeeID, recevier, txtSMSBody.Text, status);
        }
        ShowMsg1(result);
        ListView1.DataBind();
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }
}
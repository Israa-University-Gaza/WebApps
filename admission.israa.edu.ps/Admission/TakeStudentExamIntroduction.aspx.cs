using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EExam_TakeStudentExamIntroduction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentExamID"] != null)
            {
                lblStudentExamID.Text = Session["StudentExamID"].ToString();
                Session["StudentExamID"] = null;
            }
            else
            {
                Response.Redirect("StudentExams.aspx");
            }
        }
    }
    protected void btnStartExamNow_Click(object sender, EventArgs e)
    {
        Label lblExamCategoryID = Repeater2.Items[0].FindControl("lblExamCategoryID") as Label;
        Label lblExamCategoryArName = Repeater2.Items[0].FindControl("lblExamCategoryArName") as Label;

        string ipaddress = GetIPAddress();

        if (ipaddress == "213.6.129.13" || (lblExamCategoryID.Text != "4" && lblExamCategoryID.Text != "5"))
        {
            DataTable DT = DataAccess.StartStudentExam(lblStudentExamID.Text);
            if (DT.Rows[0]["status"].ToString() == "1")
            {
                Session["StudentExamID"] = lblStudentExamID.Text;
                Response.Redirect("TakeStudentExam.aspx");
            }
            else if (DT.Rows[0]["status"].ToString() == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", "setTimeout(function(){ window.location = 'StudentExams.aspx' }, 15000); bootbox.setLocale('noexam'); bootbox.alert('<br />لم يبدأ موعد تقديم الإمتحان بعد - لا يمكنك الدخول الى الإمتحان <br /><br /> سيتم تحويلك لجدول الإمتحانات خلال ثواني معدودة', function () { window.location = 'StudentExams.aspx' });", true);
            }
            else if (DT.Rows[0]["status"].ToString() == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", "setTimeout(function(){ window.location = 'StudentExams.aspx' }, 15000); bootbox.setLocale('noexam'); bootbox.alert('<br />لقد إنتهي موعد تقديم الإمتحان - لا يمكنك الدخول الى الإمتحان <br /><br /> سيتم تحويلك لجدول الإمتحانات خلال ثواني معدودة', function () { window.location = 'StudentExams.aspx' });", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "", "setTimeout(function(){ window.location = 'StudentExams.aspx' }, 15000); bootbox.setLocale('noexam'); bootbox.alert('لا يمكنك تقديم امتحان " + lblExamCategoryArName.Text + " من خارج مختبرات الجامعة', function () { window.location = 'StudentExams.aspx' });", true);
        }
    }


    public string GetIPAddress()
    {
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];

        return ipaddress;
    }
}
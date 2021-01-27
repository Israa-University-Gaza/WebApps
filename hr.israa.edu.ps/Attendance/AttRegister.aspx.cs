using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttRegister : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsValidVisitor())
        {
           // Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {
            DataTable DT = DataAccess.Attendance_TB_GetRow(UserID, DateTime.Now.Date);

            if (DT.Rows.Count > 0)
            {


                if (DT.Rows[0]["Attendance_To"].ToString() == "")
                {
                    Button2.Visible = true;
                    // Button1.Text = "تسجيل الانصراف";
                }
                else
                    if (DT.Rows[0]["Attendance_To"].ToString() != "" && DT.Rows[0]["Attendance_To"].ToString() != "")
                    {
                        //msg.InnerText = "تم تسجيل دوامك لهذا اليوم مسبقا";
                    }
               
            }
            else if(DateTime.Now.TimeOfDay >= System.TimeSpan.Parse("15:00:00"))
                msg.InnerText = "عذرًا ,لايمكنك تسجيل الحضور بعد الساعة 12";
                 else Button1.Visible = true;
                 Button1.Text = "تسجيل الحضور";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(rblBranch.SelectedValue))
        {
            ShowToast(this, "يجب إختيار الفرع.", "", "error");
        }
        else if (DataAccess.Attendance_TB_EmpAdd(UserID, DateTime.Now.Date) > 0)
        {
            DataTable DT = DataAccess.hrManualFingerprintAdd(UserID, "1", DateTime.Now, rblBranch.SelectedValue);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                ShowToast(this, "تم تسجيل الحضور بنجاح.", "", "success");
            else
                ShowToast(this, "تم تسجيل حضورك لهذا ليوم مسبقاً.", "", "error");
            Button2.Visible = true;
            Button1.Visible = false;
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (rblBranch.SelectedValue == null)
        {
            ShowToast(this, "يجب إختيار الفرع.", "", "error");
        }
        else if (DataAccess.Attendance_TB_EmpAdd(UserID, DateTime.Now.Date) > 0)
        {
            DataTable DT = DataAccess.hrManualFingerprintAdd(UserID, "2", DateTime.Now, rblBranch.SelectedValue);
        if  (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                ShowToast(this, "تم تسجيل الانصراف بنجاح.", "", "success");
        else
                ShowToast(this, "تم تسجيل انصرافك لهذا اليوم مسبقاً.", "", "error");
            //msg.InnerText = "تم تسجيل دوامك لهذا اليوم مسبقا";
            Button2.Visible = false;
            Button1.Visible = false;
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
        }
    }

    bool IsValidVisitor()
    {
        string Visitor = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            Visitor = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            Visitor = HttpContext.Current.Request.UserHostAddress;
        }
        return Visitor.StartsWith("10.1.");
    }
  
}
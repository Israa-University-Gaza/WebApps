using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_SendClientSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                lblStudentID.Text = Session["StudentID"].ToString();
                DataTable DT = NewDataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Students.aspx");
            }
        }
    }

    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.GetStudentMobile(lblStudentID.Text);
        bool sendStatus = SendSMS(DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text);
        NewDataAccess.StdMessageAdd(EmployeeID, lblStudentID.Text, DT.Rows[0]["Mobile"].ToString(), txtSMSText.Text, sendStatus);
        ShowMsg9((sendStatus) ? "تم إرسال الرسالة بنجاح" : "لم يتم إرسال الرسالة", (sendStatus) ? "success" : "danger");
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    public void ShowMsg9(string msg = "", string status = "warning")
    {
        lblMsg9.Text = msg;
        divMsg9.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg9.Visible = (msg != "");
    }
}
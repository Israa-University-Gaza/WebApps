using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentImage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"].ToString();
                    DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                    if (DT.Rows.Count > 0)
                    {
                        if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                        {
                            // Get the byte array from image file
                            byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                            string imgString = Convert.ToBase64String(imgBytes);
                            //Set the source with data:image/bmp
                            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                            Img1.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                        }
                    }
                    else
                    {
                        image.Src = "../images/std.jpg";
                        Img1.Src = "../images/std.jpg";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
    }

    protected void Upload(object sender, EventArgs e)
    {
        string base64 = Request.Form["imgCropped"];
        byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);

        if (DataAccess.StudentImageAddEdit(lblStudentID.Text, bytes) > 0)
        {
            string imgString = Convert.ToBase64String(bytes);
            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);

            ShowToast(this, "تم الحفظ بنجاح.", "", "success");
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
        }
    }


    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Response.Redirect("~/Admission/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

}

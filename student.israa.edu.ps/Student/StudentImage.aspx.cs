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

public partial class Student_StudentImage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
        //if (da.status == 1)
        //{
        //    Response.Redirect("StudentAcademicWarning.aspx");
        //}
        if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("ReadRool.aspx");
        }
        if (DataAccess.IsStudentHavePoll(StudentID))
        {
            Response.Redirect("StudentPoll.aspx");
        }
        if (!DataAccess.IsStudentFinishEvaluation(StudentID))
        {
            Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }



        if (!IsPostBack)
        {
            DataTable DT = DataAccess.StudentImageGet(StudentID);
            if (DT.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                {
                    byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    ImgStudentProfile.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
                else
                {
                    ImgStudentProfile.Src = "../images/std.jpg";
                }
            }
        }
    }

    protected void Upload(object sender, EventArgs e)
    {
        //string base64 = Request.Form["imgCropped"];
        //byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);

        //if (DataAccess.StudentImageAddEdit(StudentID, bytes) > 0)
        //{
        //    string imgString = Convert.ToBase64String(bytes);
        //    ImgStudentProfile.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);

        //    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
        //    Response.Redirect(Request.RawUrl);
        //}
        //else
        //{
        //    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
        //}
        ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}

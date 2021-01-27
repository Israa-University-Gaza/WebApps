using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentAdvertisement : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            try
            {
                int x = int.Parse(Request.QueryString["id"].ToString());
                DataTable DT = DataAccess.StudentImageGet(StudentID);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        ImgStudentProfile.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
                else
                {
                    ImgStudentProfile.Src = "../images/std.jpg";
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
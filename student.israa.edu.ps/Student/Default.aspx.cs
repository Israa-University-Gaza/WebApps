using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Student_Default : UserPage
{
    public bool IsGraduated = false;
    // public bool InGraduationCeremony = false;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {


        var d = DataAccess.GetStudentInfo(StudentID);
        var g  = (string)d.Rows[0]["GraduationStatus"];

        if (g == "خريج" || g == "متوقع تخرجه")
        {
            IsGraduated = true;
        }



        // var r = d.Rows[0]["InGraduationCeremony"] == null ? " " : "1";

        // if (r== "1")
        // {
            // InGraduationCeremony = true;
        // }
        // var t = DataAccess.stude

        GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
        if (da.status == 1)
        {
            box.Visible = true;
            // Response.Redirect("StudentAcademicWarning.aspx");
        }
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

        SqlDataAdapter daZ = new SqlDataAdapter("select std_id from Eva_answer where std_id='" + Session["log"] + "'", conn);
        DataTable dtZ = new DataTable();
        daZ.Fill(dtZ);
        if (dtZ.Rows.Count == 0)
        {
            Response.Redirect("Eva.aspx");
        }
        /*   if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "0")
         {
          Response.Redirect("BlockStudent.aspx");
          }*/


        DataTable DT = DataAccess.StudentImageGet(StudentID);
        if (DT.Rows.Count > 0)
        {
            if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
            {
                byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                string imgString = Convert.ToBase64String(imgBytes);

                image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
            }
            else
            {
                image.Src = "../images/std.jpg";
            }
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddGraduationCost(StudentID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
    }
}
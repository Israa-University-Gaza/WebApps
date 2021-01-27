using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StdSemesterTranscript : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("ReadRool.aspx");
        }
        if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "0")
       {
           Response.Redirect("BlockStudent.aspx");
       }


    }
}
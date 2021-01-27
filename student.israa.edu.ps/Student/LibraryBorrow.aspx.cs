using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_LibraryBorrow : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
        //if (da.status == 1)
        //{
        //    Response.Redirect("StudentAcademicWarning.aspx");
        //}
        DataTable DT=   DataAccess.StudentMainDataGet(StudentID);
     ID.Text = DT.Rows[0]["StudentNo"].ToString();
    }
}
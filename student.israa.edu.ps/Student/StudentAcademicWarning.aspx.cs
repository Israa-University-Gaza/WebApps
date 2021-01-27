using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentAcademicWarning : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {

            GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
            if (da.status == 0)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                title.Text = da.title;
                msg.Text = da.msg;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            }
        }
    }
}
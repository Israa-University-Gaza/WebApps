using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_AttendanceStudent : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListView1.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            string AttendanceStudentID = ((Label)item.FindControl("AttendanceStudentID")).Text;
            string StudentID = ((Label)item.FindControl("StudentID")).Text;
            bool IsExist = ((CheckBox)item.FindControl("cbIsExist")).Checked;
            bool IsNoProblem = ((CheckBox)item.FindControl("cbIsNoProblem")).Checked;
            DataAccess.AttendanceStudentAddEdit(AttendanceStudentID, ddlLecture.SelectedValue, StudentID, (!IsNoProblem && IsExist), IsNoProblem, EmployeeID);
        }
        ListView1.DataBind();
        ShowMsg1("تم الحفظ بنجاح.", "success");
    }
    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg1.Visible = (msg != "");
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        ddlWeek.DataBind();
        ddlLecture.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlWeek.DataBind();
        ddlLecture.DataBind();
        ListView1.DataBind();
    }

    protected void ddlWeek_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlLecture.DataBind();
        ListView1.DataBind();
    }
}
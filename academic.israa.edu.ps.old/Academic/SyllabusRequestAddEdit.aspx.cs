using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusRequestAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {



          

            if (IsPermissionsContains("SyllabusRequestAddEdit"))
            {
                lbEmployeeID.Text = EmployeeID;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlProgram, ddlCollege, ddlDepartment, ddlCourse, ddlInstructor });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusAddEdit(lblSyllabusID.Text, ddlCourse.SelectedValue, ddlInstructor.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ddlProgram.SelectedValue = null;
                ddlCollege.SelectedValue = null;
                ddlDepartment.SelectedValue = null;
                ddlCourse.SelectedValue = null;
                ddlInstructor.SelectedValue = null;
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ddlProgram.SelectedValue = null;
        ddlCollege.SelectedValue = null;
        ddlDepartment.SelectedValue = null;
        ddlCourse.SelectedValue = null;
        ddlInstructor.SelectedValue = null;

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("SyllabusID")).Text;
        lblSyllabusID.Text = ID;
        DataTable DT = DataAccess.SyllabusGet(lblSyllabusID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlProgram.DataBind();
            ddlProgram.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
            ddlCollege.DataBind();
            ddlCollege.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
            ddlDepartment.DataBind();
            ddlDepartment.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
            ddlCourse.DataBind();
            ddlCourse.SelectedValue = DT.Rows[0]["CourseID"].ToString();
            ddlInstructor.DataBind();
            ddlInstructor.SelectedValue = DT.Rows[0]["InstructorID"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("SyllabusID")).Text;
        DataTable DT = DataAccess.SyllabusDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }


    protected void ddlFilterInstructor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlFilterCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
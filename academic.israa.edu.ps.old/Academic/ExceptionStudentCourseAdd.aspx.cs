using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_ExceptionStudentCourseAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"].ToString();
            }
            else
                Response.Redirect("~/Academic/Students.aspx");
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCourse, ddlExceptionsCourseType, ddlSemesterID, txtDate, txtNote });
        if (Validate)
        {
            DataTable DT = DataAccess.ExceptionStudentCourseAdd( lblExceptionsCourseID.Text, lblStudentID.Text, ddlSemesterID.SelectedValue, ddlExceptionsCourseType.SelectedValue, ddlCourse.SelectedValue, Convert.ToDateTime(txtDate.Text + " "+ txtTime.Text), txtNote.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ddlCourse.SelectedValue = null;
                ddlExceptionsCourseType.SelectedValue = null;
                ddlSemesterID.SelectedValue = null;
                txtDate.Text = null;
                txtNote.Text = null;
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }


    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.ExceptionStudentCourseDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }


    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((CheckBox)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        bool IsActive = ((CheckBox)li.FindControl("cbIsActive")).Checked;
        DataTable DT = DataAccess.ExceptionStudentCourseActivate(ID, IsActive, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}
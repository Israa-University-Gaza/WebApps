using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StdOfficeRegister : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblEmployeeID.Text = EmployeeID;
                lblSemesterID.Text = "12";
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"];



                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }



    protected void txtCourseCode_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void txtCourseName_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdSectionID = ((Label)li.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.RemoveOfficeCourse(lblStudentID.Text, StdSectionID, lblEmployeeID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        DataTable DA = DataAccess.StudentBranchAddEdit(lblStudentID.Text,13);
        if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)li.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.OfficeSectionRegister(lblStudentID.Text, SectionID, lblEmployeeID.Text);
        DataTable DA = DataAccess.StudentBranchAddEdit(lblStudentID.Text, 13);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }


}
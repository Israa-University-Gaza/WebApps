using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_PlanCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (IsPermissionsContains("PlanCourse"))
            //{
                if (Session["PlanID"] != null)
                {
                    //ddlCourseID.DataSourceID = (IsPermissionsContains("Academic")) ? "SqlDataSource6" : "SqlDataSource5";
                    lblEmployeeID.Text = User.Identity.Name.ToString();
                    lblPlanID.Text = Session["PlanID"].ToString();
                    Session["PlanID"] = null;
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            //}
            //else
            //{
            //    Response.Redirect("Default.aspx");
            //}
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PlanCourseID")).Text;
        DataTable DT = DataAccess.PlanCourseGet(id);
        if (DT.Rows.Count > 0)
        {
            lblPlanCourse.Text = DT.Rows[0]["ID"].ToString();
            ddlCourseID.DataBind();
            ddlCourseID.SelectedValue = DT.Rows[0]["CourseID"].ToString();
            ddlCourseCategoryID.SelectedValue = DT.Rows[0]["CourseCategoryID"].ToString();
            ddlCSemesterID.SelectedValue = DT.Rows[0]["CSemesterID"].ToString();
                     
        }

        string PlanID = ((Label)ri.FindControl("PlanID")).Text;
        string a = "https://system.israa.edu.ps/app/RefreshPlanSumofHours?planId=" + PlanID;
        ExcuteApI(a);

    }

 
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PlanCourseID")).Text;

        DataTable DT = DataAccess.PlanCourseDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater1.DataBind();

        string PlanID = ((Label)ri.FindControl("PlanID")).Text;
        string a = "https://system.israa.edu.ps/app/RefreshPlanSumofHours?planId=" + PlanID;
        ExcuteApI(a);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCourseID, ddlCSemesterID });
        if (Validate)
        {
            DataTable DT = DataAccess.PlanCourseAddEdit(lblPlanCourse.Text, lblPlanID.Text, ddlCSemesterID.SelectedValue, ddlCourseID.SelectedValue,ddlCourseCategoryID.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            Repeater1.DataBind();
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblPlanCourse, ddlCourseID });
             
                Repeater1.DataBind();
            }
           
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }


        string a = "https://system.israa.edu.ps/app/RefreshPlanSumofHours?planId=" + lblPlanID.Text ;
        ExcuteApI(a);

    }
    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("PlanCourseID")).Text;
       
        if (DataAccess.PlanCourseActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }

        string PlanID = ((Label)item.FindControl("PlanID")).Text;
        string a = "https://system.israa.edu.ps/app/RefreshPlanSumofHours?planId=" + PlanID;
        ExcuteApI(a);
    }

    protected void lbCode_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CourseID")).Text;
        DataTable DT = DataAccess.GenerateCourseCode(id);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater1.DataBind();
        }
    }
}
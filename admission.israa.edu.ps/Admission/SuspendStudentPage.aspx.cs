using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_SuspendStudentPage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"].ToString();

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
    protected void Suspend_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { SuspendDetails, SuspendCondition, (SuspendCondition.SelectedValue == "9999") ? OtherCondition : null }))
        {
            if (DataAccess.SuspendedStudent("", lblStudentID.Text, SuspendCondition.SelectedValue, (SuspendCondition.SelectedValue == "9999") ? OtherCondition.Text : "", SuspendDetails.Text, lblDepartmentID.Text, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { SuspendDetails, SuspendCondition, OtherCondition });

            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

    }

    protected void SuspendCondition_SelectedIndexChanged(object sender, EventArgs e)
    {
        others.Visible = (SuspendCondition.SelectedValue == "9999");
    }


}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_InstructorAttendance2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Empstatus.SelectedValue = "1041";
        }
    }
    protected void date_TextChanged(object sender, EventArgs e)
    {

        ListView1.DataBind();
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ListView1.DataBind();
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
       
    }
    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Label lblTotalHours = (Label)ListView2.Items[0].FindControl("lblTotalHours");
        DataAccess.UpdateLoadHoursContract(ddlEmployee.SelectedValue, ddlSemester.SelectedValue, lblTotalHours.Text);
    }

  
}
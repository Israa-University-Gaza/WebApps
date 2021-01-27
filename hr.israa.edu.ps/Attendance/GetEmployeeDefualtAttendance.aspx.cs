using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_GetEmployeeDefualtAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Empstatus.SelectedValue = "1041";
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
            ddlEmpSubStatus.DataBind();
            ddlEmpSubStatus.SelectedValue = "2126";
            ListView1.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlEmpCategoryID2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlEmpSubStatus.Visible = true;
        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
        }
        else if (Empstatus.SelectedValue == "1043")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource34";

        }
        else if (Empstatus.SelectedValue == "2122")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource8";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }
        
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

    protected void lbEdit_Click(object sender, EventArgs e)
    {

        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        string EmployeeID = ((Label)item.FindControl("EmployeeID")).Text;
        Session["ID"] = id;
        Session["EmployeeID"] = EmployeeID;
        Response.Redirect("EmployeeDefualtAttendanceAdd.aspx");
    }

    protected void ddlDefualtAttendanceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDefualtAttendance.DataBind();
        ListView1.DataBind();
    }

    protected void ddlDefualtAttendance_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlEmpSubStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
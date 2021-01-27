using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_EmployeeDefualtAttendanceAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Empstatus.SelectedValue = "1041";
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
            ddlEmpSubStatus.DataBind();
            ddlEmpSubStatus.SelectedValue = "2126";
            chEmployeeName.DataBind();
        }

        if (!IsPostBack)
        {
            if (Session["ID"] != null)
            {
                ID.Text = Session["ID"].ToString();
                EmployeeID.Text = Session["EmployeeID"].ToString();
                DataTable dt = DataAccess.EmployeeDefualtAttendanceGet(ID.Text);
                Session["ID"] = null;
                Session["EmployeeID"] = null;
                if (dt.Rows.Count > 0)
                {
                    DisableControls(new WebControl[] { Empstatus, ddlContractTypeID, ddlEmpCategoryID,ddlEmpSubStatus, chEmployeeName, ddlEmployeeCat, ddlSubContractType, ddlContractTypeID });
                    chEmployeeName.Visible = false;
                    EmployeeName.Visible = true;
                    EmployeeName.Text = dt.Rows[0]["DisplayName"].ToString();
                    ddlDefualtAttendance.SelectedValue = dt.Rows[0]["DefualtAttendanceID"].ToString();
                    ddlDefualtAttendanceType.SelectedValue = dt.Rows[0]["DefualtAttendanceTypeID"].ToString();
                    ddlEmpCategoryID.SelectedValue = dt.Rows[0]["EmpCategoryID"].ToString();
                    Empstatus.DataBind();
                    Empstatus.SelectedValue = dt.Rows[0]["Emp_Status_ID"].ToString();
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
                        ddlEmpSubStatus.DataSourceID = "SqlDataSource5";
                    }
                    else
                    {
                        ddlEmpSubStatus.Visible = false;
                    }
                    ddlEmpSubStatus.DataBind();
                    ddlEmpSubStatus.SelectedValue= dt.Rows[0]["EmpSubStatusID"].ToString();
                    ddlContractTypeID.SelectedValue = dt.Rows[0]["ContractTypeID"].ToString();
                    ddlSubContractType.DataBind();
                    ddlSubContractType.SelectedValue = dt.Rows[0]["SubContractTypeID"].ToString();
                    ddlEmployeeCat.SelectedValue = dt.Rows[0]["EmployeeCatID"].ToString();



                }
                else
                {
                    ShowToast(this, "بالرجاء ادخال بيانات سليمة ", "", "error");
                }
            }
            else
            {
               
                Empstatus.SelectedValue = "1041";
            }

        }
    }

    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        chEmployeeName.DataBind();
    }

    protected void ddlEmpCategoryID2_SelectedIndexChanged(object sender, EventArgs e)
    {
        chEmployeeName.DataBind();
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
            ddlEmpSubStatus.DataSourceID = "SqlDataSource5";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }
        
        chEmployeeName.DataBind();
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        chEmployeeName.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
       
        if (ValidateControls(new WebControl[] { chEmployeeName, ddlDefualtAttendance,ddlDefualtAttendanceType }))
        {
            if (EmployeeID.Text == "")
            {
                foreach (ListItem item in chEmployeeName.Items)
                {
                    if (item.Selected && item.Value != "-1")
                    {
                    
                         DataTable DT = DataAccess.EmployeeDefualtAttendanceAdd(item.Value, ddlDefualtAttendance.SelectedValue, ddlDefualtAttendanceType.SelectedValue, UserID);
                        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                    }
                }
            }
            else
            {
                DataTable dt = DataAccess.EmployeeDefualtAttendanceAdd(EmployeeID.Text, ddlDefualtAttendance.SelectedValue, ddlDefualtAttendanceType.SelectedValue, UserID);
                ShowToast(this, dt.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(dt.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

    }
    protected void chEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        for (int i = 1; i < chEmployeeName.Items.Count; i++)
        {
            if(chEmployeeName.SelectedValue=="-1")
            chEmployeeName.Items[i].Selected = true;
        }
    }

    protected void ddlEmpSubStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        chEmployeeName.DataBind();
    }
}
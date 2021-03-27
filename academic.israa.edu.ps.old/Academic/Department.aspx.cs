using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Department : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Department"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("DepartmentID")).Text;
        DataTable DT = DataAccess.DepartmentGet(id);
        if (DT.Rows.Count > 0)
        {
            txtDepartmentNum.Text = DT.Rows[0]["DepartmentNum"].ToString();
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            ddlCollege.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
            ddlEmployeeID.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
            txtAcceptanceRate.Text = DT.Rows[0]["AcceptanceRate1"].ToString();
            txtAcceptanceRate2.Text = DT.Rows[0]["AcceptanceRate2"].ToString();
            txtStdMCapacity.Text = DT.Rows[0]["StdMCapacity"].ToString();
            txtStdFMCapacity.Text = DT.Rows[0]["StdFMCapacity"].ToString();
            txtHourCost.Text = DT.Rows[0]["HourCost"].ToString();
            txtMarkOfSuccess.Text = DT.Rows[0]["MarkOfSuccess"].ToString();
            txtUniversityHour.Text = DT.Rows[0]["UniversityHour"].ToString();
            txtCollegeHour.Text = DT.Rows[0]["CollegeHour"].ToString();
            txtDepartmentHour.Text = DT.Rows[0]["DepartmentHour"].ToString();
            txtOptionalHour.Text = DT.Rows[0]["OptionalHour"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblDepartmentID.Text = id;
            ListView1.DataBind();
        }
    }


    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("DepartmentID")).Text;
        DataTable DT = DataAccess.DepartmentDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
      
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtDepartmentNum, txtArName, txtEnName, txtHourCost, ddlEmployeeID, ddlCollege, txtAcceptanceRate,txtAcceptanceRate2, txtUniversityHour, txtCollegeHour, txtDepartmentHour, txtOptionalHour,txtStdMCapacity, txtStdFMCapacity, txtMarkOfSuccess }))
        {
            if (DataAccess.DepartmentAddEdit(lblDepartmentID.Text, txtDepartmentNum.Text, txtArName.Text, txtEnName.Text, ddlCollege.SelectedValue, ddlEmployeeID.SelectedValue, Convert.ToDouble(txtAcceptanceRate.Text), Convert.ToDouble(txtAcceptanceRate2.Text),
                txtHourCost.Text, txtStdMCapacity.Text, txtStdFMCapacity.Text, txtMarkOfSuccess.Text, txtUniversityHour.Text, txtCollegeHour.Text, txtDepartmentHour.Text, txtOptionalHour.Text, "", cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblDepartmentID, txtDepartmentNum, txtArName, txtEnName, txtHourCost, ddlEmployeeID, ddlCollege, txtAcceptanceRate, txtAcceptanceRate2,txtStdMCapacity, txtStdFMCapacity, txtUniversityHour, txtCollegeHour, txtDepartmentHour, txtOptionalHour, txtMarkOfSuccess, cbActive });
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnEditSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtDepartmentNum, txtArName, txtEnName, txtHourCost, ddlEmployeeID, ddlCollege, txtAcceptanceRate,txtAcceptanceRate2, txtUniversityHour, txtCollegeHour, txtDepartmentHour, txtOptionalHour, txtStdMCapacity, txtStdFMCapacity, txtMarkOfSuccess }))
        {
            if (DataAccess.DepartmentAddEdit(lblDepartmentID.Text, txtDepartmentNum.Text, txtArName.Text, txtEnName.Text, ddlCollege.SelectedValue, ddlEmployeeID.SelectedValue, Convert.ToDouble(txtAcceptanceRate.Text), Convert.ToDouble(txtAcceptanceRate2.Text),
                txtHourCost.Text, txtStdMCapacity.Text, txtStdFMCapacity.Text, txtMarkOfSuccess.Text, txtUniversityHour.Text, txtCollegeHour.Text, txtDepartmentHour.Text, txtOptionalHour.Text, lblDepartmentID.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblDepartmentID, txtDepartmentNum, txtArName, txtEnName, txtHourCost, ddlEmployeeID, ddlCollege, txtAcceptanceRate,txtAcceptanceRate2, txtStdMCapacity, txtStdFMCapacity, txtUniversityHour, txtCollegeHour, txtDepartmentHour, txtOptionalHour, txtMarkOfSuccess, cbActive });
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblDepartmentID, txtDepartmentNum, txtArName, txtEnName, txtHourCost, ddlEmployeeID, ddlCollege, txtAcceptanceRate,txtAcceptanceRate2, txtStdMCapacity,txtStdFMCapacity, txtUniversityHour, txtCollegeHour, txtDepartmentHour, txtOptionalHour, txtMarkOfSuccess, cbActive });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("DepartmentID")).Text;

        if (DataAccess.DepartmentActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
}
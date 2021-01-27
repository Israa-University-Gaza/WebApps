using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_PermissionAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlEmployee, ddlRole });
        if (Validate)
        {
            DataAccess.EmployeeRoleAddEdit(ddlEmployee.SelectedValue, ddlRole.SelectedValue, cbIsActive.Checked, UserID);
            ShowToast(this, "تمت الاضافة بنجاح", "", "success");

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagePermissions.aspx");
    }
}
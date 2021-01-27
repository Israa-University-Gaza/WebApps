using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_DeanGivePermissionsPlan : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("DeanGivePermissionsPlan"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Repeater1.Items.Count > 0)
        {
            bool isExistPermission = false;
            foreach (RepeaterItem item in Repeater1.Items)
            {
                CheckBox cbAction = (CheckBox)item.FindControl("cbAction");
                if (cbAction.Checked)
                {
                    Label lblActionID = (Label)item.FindControl("lblActionID");
                    CheckBox cbIsAllTime = (CheckBox)item.FindControl("cbIsAllTime");
                    TextBox txtAvailableFrom = (TextBox)item.FindControl("txtAvailableFrom");
                    TextBox txtAvailableTo = (TextBox)item.FindControl("txtAvailableTo");

                    DataAccess.GiveAcadimecPermission(ddlEmployee.SelectedValue, true, "", "", true, lblActionID.Text, cbIsAllTime.Checked, txtAvailableFrom.Text, txtAvailableTo.Text, cbAction.Checked, EmployeeID);
                    isExistPermission = true;
                }
            }
            Repeater1.DataBind();
            if (isExistPermission)
            {
                ShowToast(this, "تم اعتماد الصلاحيات بنجاح", "", "success");
            }
            else
            {
                ShowToast(this, "لا يوجد صلاحيات للاعتماد", "", "error");
            }
        }
        else
        {
            ShowToast(this, "لا يوجد صلاحيات للاعتماد", "", "error");
        }
    }
}
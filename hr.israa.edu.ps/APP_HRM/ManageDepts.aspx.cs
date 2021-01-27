using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_ManageDepts : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("ID")).Text;
        ((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue = DataAccess.GetDepartmentInfo(id).Rows[0]["EmployeeID"].ToString();

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)(sender as Control).Parent;
        string ID = ((Label)item.FindControl("ID")).Text;
        string emp1 = ((DropDownList)item.FindControl("ddlEmployee")).SelectedValue;
        DataAccess.DepartmentEmployeeEdit(ID, emp1, UserID);
        DataAccess.EmployeeRoleAddEdit(emp1, "3022", true, UserID);

        ShowToast(this, "تم التعديل بنجاح", "", "success");
        ListView1.DataBind();
    }
}
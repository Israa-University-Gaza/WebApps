using Org.BouncyCastle.Bcpg;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Activities;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_ManageColleges : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)(sender as Control).Parent;
        string ID= ((Label)item.FindControl("ID")).Text;
        string emp1 = ((DropDownList)item.FindControl("ddlEmployee")).SelectedValue;
        string emp2= ((DropDownList)item.FindControl("ddlEmployee2")).SelectedValue;
        DataAccess.CollegeEmployeeEdit(ID, emp1, emp2, UserID);
        DataAccess.EmployeeRoleAddEdit(emp1, "2009", true, UserID);
        ShowToast(this, "تم التعديل بنجاح", "", "success");
        ListView1.DataBind();
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        string id= ((Label)e.Item.FindControl("ID")).Text;
        ((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue = DataAccess.GetCollegeInfo(id).Rows[0]["EmployeeID"].ToString();
        ((DropDownList)e.Item.FindControl("ddlEmployee2")).SelectedValue = DataAccess.GetCollegeInfo(id).Rows[0]["EmployeeID2"].ToString();

    }
}
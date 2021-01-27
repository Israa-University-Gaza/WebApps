using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_MainSalaryAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {

        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        if (ValidateControls(new WebControl[] { ((DropDownList)ri.FindControl("ddlManager")) }))
        {
        string EmpID = ((Label)ri.FindControl("EmpID")).Text;
       string ManagerID = ((DropDownList)ri.FindControl("ddlManager")).SelectedValue;



       if (DataAccess.EmployeeManagerAddEdit(EmpID, ManagerID) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                ListView1.DataBind();

            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "يرجى تعبئة الحقول المطلوبة", "", "error");
        }



    }
  
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            if (ValidateControls(new WebControl[] { ((DropDownList)item.FindControl("ddlManager")) }))
            {
                string EmpID = ((Label)item.FindControl("EmpID")).Text;
                string ManagerID =((DropDownList)item.FindControl("ddlManager")).SelectedValue;
                DataAccess.EmployeeManagerAddEdit(EmpID, ManagerID);
            }
        }
        ListView1.DataBind();
        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
}
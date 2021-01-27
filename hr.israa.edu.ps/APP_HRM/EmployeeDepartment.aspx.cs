using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_EmployeeDepartment : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmpID")).Text;
        string Department = ((DropDownList)ri.FindControl("DropDownList1")).SelectedValue;
        

        if (ValidateControls(new WebControl[] {  }))
        {
            if (DataAccess.EmployeeDepartment(id, Department) > 0)
            {
               
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                Repeater1.DataBind();

            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
      


    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;

        if (DataAccess.Dep_Section_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }



    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //EmptyControls(new WebControl[] { lblSectionID, txtName, TextBox1, cbActive });
        //txtName.Text = "";
        //TextBox1.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            string id = ((Label)item.FindControl("EmpID")).Text;
            string Department = ((DropDownList)item.FindControl("DropDownList1")).SelectedValue;
           
            DataAccess.EmployeeDepartment(id, Department);
        }
        Repeater1.DataBind();
        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
}
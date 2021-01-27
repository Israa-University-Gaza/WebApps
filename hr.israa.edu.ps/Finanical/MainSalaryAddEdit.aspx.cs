using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_MainSalaryAddEdit : UserPage
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
        if (ValidateControls(new WebControl[] { ((TextBox)ri.FindControl("salary")), (DropDownList)ri.FindControl("CurrType") }))
        {
        string id = ((Label)ri.FindControl("EmpID")).Text;
        decimal salary =Convert.ToDecimal( ((TextBox)ri.FindControl("salary")).Text);
        string CurrencyTypeID = ((DropDownList)ri.FindControl("CurrType")).SelectedValue;


     
            if (DataAccess.EmployeeSalaryEdit(id, salary,CurrencyTypeID) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                Repeater1.DataBind();

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
        foreach (RepeaterItem item in Repeater1.Items)
        {
            if (ValidateControls(new WebControl[] { ((TextBox)item.FindControl("salary")), (DropDownList)item.FindControl("CurrType") }))
            {
                string id = ((Label)item.FindControl("EmpID")).Text;
                decimal salary = Convert.ToDecimal(((TextBox)item.FindControl("salary")).Text);
                string CurrencyTypeID = ((DropDownList)item.FindControl("CurrType")).SelectedValue;
                DataAccess.EmployeeSalaryEdit(id, salary, CurrencyTypeID);
            }
        }
        Repeater1.DataBind();
        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Differances_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void DD_Plus_Type_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DD_Plus_Type.SelectedValue == "1")
        {
            Type.DataSourceID = "SqlDataSource1";
            Type.DataTextField = "Allowance_Type";
            Type.DataValueField = "Allowance_Type_ID";
        }
       else if (DD_Plus_Type.SelectedValue == "2")
        {

            Type.DataSourceID = "SqlDataSource2";
            Type.DataTextField = "Bouns_Type";
            Type.DataValueField = "Bouns_Type_ID";
          
        }
         
        else if (DD_Plus_Type.SelectedValue == "3")
        {
            Type.DataSourceID = "SqlDataSource3";
            Type.DataTextField = "Motivation_Type";
            Type.DataValueField = "Motivation_Type_ID";
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        Plus.Visible = true;
        Discount.Visible = false;
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        Discount.Visible = true;
        Plus.Visible = false;
    }
    protected void DD_Discount_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DD_Discount.SelectedValue == "2") { DD_Discount_Type.Visible = false; }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        bool validate = ValidateControls(new WebControl[] {DropDownList1,TextBox1 ,Value,DropDownList8});
        bool DecimalValidate = DecimalValidateControls(new WebControl[] {Value });
        if(validate && DecimalValidate )
      
        {
            if (DataAccess.Differences_TB_AddEdit((Session["Diff_ID"] == null) ? "" : Session["Diff_ID"].ToString(),
                Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text), ((RadioButton1.Checked) ? DD_Plus_Type.SelectedItem.Text : DD_Discount.SelectedItem.Text),
                ((RadioButton1.Checked) ? "استحقاق" : "استقطاع"), Convert.ToDecimal(Value.Text), Convert.ToInt16(DropDownList8.SelectedValue), Convert.ToInt16(UserID), 0,
                ((DD_Plus_Type.SelectedValue != null) ? Type.SelectedItem.Text : DD_Discount_Type.SelectedItem.Text), Convert.ToDecimal("0"), "قيمة", "", 0) > 0)
            {
                
                Session["Diff_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] {  });
               // Repeater1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }


    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Diff_ID")).Text;

        if (DataAccess.Differences_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
   
}
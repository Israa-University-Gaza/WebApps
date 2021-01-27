using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Emp_Evaluate_Bouns_Monthly : UserPage
{
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

 

    protected void Button2_Click(object sender, EventArgs e)
    {
        Div1.Visible = false;
        row.Visible = true;
        
        Repeater1.DataBind();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        row.Visible = false;
        Div1.Visible = true;

        Repeater2.DataBind();

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Motivation_ID"] = ((Label)ri.FindControl("MotivationID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbSubmit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("MotivationID")).Text;
        // اضافة في جدول الاستحقاقات المفروض انشاؤه لاعتماد استحقاقات الشهر المحدد
        DT = DataAccess.Motivation_TB_Get(id);


           if (DataAccess.Plus_TB_AddEdit("", Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text),
           "Motivation_TB", ((Label)ri.FindControl("MotivationID")).Text, Convert.ToDecimal(((Label)ri.FindControl("Motivation_Value")).Text),
           Convert.ToInt16(DropDownList8.SelectedValue), Convert.ToInt16(UserID), 0, ((Label)ri.FindControl("Label1")).Text,
           Convert.ToDecimal(((Label)ri.FindControl("Motivation_Rate")).Text), ((Label)ri.FindControl("M_description")).Text,
           ((Label)ri.FindControl("Motivation_Code")).Text, Convert.ToInt16(((Label)ri.FindControl("Label4")).Text)) > 0)
     //   if (DataAccess.Plus_TB_AddEdit("", Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text),
     //"Motivation_TB", id, Convert.ToDecimal(DT.Rows[0]["Motivation_Value"].ToString()),
     //Convert.ToInt16(HiddenField3.Value), Convert.ToInt16(UserID), 0, ((Label)ri.FindControl("Label1")).Text,
     //Convert.ToDecimal(DT.Rows[0]["Motivation_Rate"].ToString()), DT.Rows[0]["description"].ToString(),
     //DT.Rows[0]["Code"].ToString()) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
        }
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Deduction_ID"] = ((Label)ri.FindControl("DeductionID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbSubmit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DeductionID")).Text;
      //  DT = DataAccess.Deduction_TB_Get(id);
        
        // اضافة في جدول الاستقطاعات المفروض انشاؤه لاعتماد استقطاع الشهر المحدد

        if (DataAccess.Discount_TB_AddEdit("",Convert.ToInt16(DropDownList1.SelectedValue),Convert.ToInt16(TextBox1.Text),
         "Deduction_TB", id, Convert.ToDecimal(((Label)ri.FindControl("Deduction_Value")).Text),
         Convert.ToInt16(DropDownList8.SelectedValue), Convert.ToInt16(UserID), 0, ((Label)ri.FindControl("Label3")).Text,
         Convert.ToDecimal(((Label)ri.FindControl("Deduction_Rate")).Text), ((Label)ri.FindControl("description")).Text,
         ((Label)ri.FindControl("Deduction_Code")).Text, Convert.ToInt16(((Label)ri.FindControl("Label4")).Text)) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
        }
    }
}
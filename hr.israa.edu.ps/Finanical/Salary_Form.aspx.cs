using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Salary_Form : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["Emp_ID"] != null && Session["Salary_ID"] != null)
            {
                Label4.Text=Session["Salary_ID"].ToString() ;
                Label5.Text=Session["Emp_ID"].ToString();
                DataTable DT2 = DataAccess.Salary_Transaction_TB_Get(Session["Salary_ID"].ToString());
            
                Label2.Text = DT2.Rows[0]["Year"].ToString();
                P_Total.Text = DT2.Rows[0]["Plus_Total"].ToString();
                DisTotal.Text = DT2.Rows[0]["Discount_Total"].ToString();
                Diff_Total.Text = DT2.Rows[0]["Differences_Total"].ToString();
                Label1.Text = DT2.Rows[0]["Salary_Month_ID"].ToString();
                
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Session["Salary_ID"].ToString();
      
      // ازا هذا الموظف خاضع للضريبة يجب احتساب الضريبة قبل الاعتماد
      if(  DataAccess.Salary_Transaction_TB_Accredited(id,"نسخة معتمدة",Convert.ToInt16(UserID))>0)
      {
          ShowToast(this, "تم اعتماد استمارة الراتب بنجاح.", "", "success");
          adpotsalary.Visible = false;
      }
      else
      {
          ShowToast(this, "عذرًا , لم يتم اعتماد استمارة الراتب .", "", "error");
      }

  
 
 // call 
       // System.Drawing.Image image = CaptureScreen(0, 0, 0, 0, new System.Drawing.Size(800, 600));
         //image.Save(@"I:\screen.jpg");




    }
    protected void LinkButton2_Click(object sender, EventArgs e)//for delete plus
    {
       RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PlusID")).Text;

        if (DataAccess.Plus_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
          Repeater2.DataBind();
         decimal total = Convert.ToDecimal(P_Total.Text) - Convert.ToDecimal(((TextBox)ri.FindControl("P_Value")).Text);
       P_Total.Text=Convert.ToString(total);
      // ((Label)Repeater5.Items[0].FindControl("Plus")).Text=Convert.ToString(total);
       ((Label)Repeater4.Items[0].FindControl("Plus1")).Text = Convert.ToString(total);
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }
    protected void PlusAdopt_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PlusID")).Text;

        if (DataAccess.Plus_TB_Adopt(id, UserID) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");


        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
    }
    protected void DiscountDelete_Click(object sender, EventArgs e)
{
    RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
    string id = ((Label)ri.FindControl("DiscountID")).Text;

    if (DataAccess.Discount_TB_Delete(id, UserID) > 0)
    {
        ShowToast(this, "تم الحذف بنجاح.", "", "success");
        Repeater3.DataBind();
        decimal total = Convert.ToDecimal(DisTotal.Text) - Convert.ToDecimal(((TextBox)ri.FindControl("D_Value")).Text);
        Diff_Total.Text = Convert.ToString(total);
       // ((Label)Repeater5.Items[0].FindControl("Discount")).Text = Convert.ToString(total);
        ((Label)Repeater4.Items[0].FindControl("Discount1")).Text = Convert.ToString(total);
    }
    else
        ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
}
    protected void DiscountAdopt_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DiscountID")).Text;

        if (DataAccess.Discount_TB_Adopt(id, UserID) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");


        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
    }

    protected void DiffDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DiffID")).Text;

        if (DataAccess.Differences_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater4.DataBind();
            decimal total = Convert.ToDecimal(Diff_Total.Text) - Convert.ToDecimal(((TextBox)ri.FindControl("Diff_Value")).Text);
            Diff_Total.Text = Convert.ToString(total);
            //((Label)Repeater5.Items[0].FindControl("Differences")).Text = Convert.ToString(total);
            ((Label)Repeater4.Items[0].FindControl("Diff1")).Text = Convert.ToString(total);
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void DiffAdopt_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DiffID")).Text;

        if (DataAccess.Differences_TB_Adopt(id, UserID) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
         
     
        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
    }
    protected void Button2_Click(object sender, EventArgs e)//update salary form
    {
       // string id = ((Label)Repeater4.Items[0].FindControl("Salary_ID")).Text;
        string id = Session["Salary_ID"].ToString();

        if (DataAccess.CalculateSalaryUpdate(id, Convert.ToInt16(UserID)) > 0)
        {
            ShowToast(this, "تم تعديل استمارة الراتب بنجاح.", "", "success");
            adpotsalary.Visible = true;
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم تعديل استمارة الراتب .", "", "error");
        }
    }


  
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_HWStatus : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("rem") != null)
        {
            int remin_day = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "remin_day"));
            int remin_hour = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "remin_hour"));
            int remin_Minute = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "remin_Minute"));
            Label rem = (Label)e.Row.FindControl("rem");
            Label hw_stat = (Label)e.Row.FindControl("hw_stat");
            Label hw_stat1 = (Label)e.Row.FindControl("hw_stat1");

            SqlDataAdapter DA1 = new SqlDataAdapter("SELECT ROW_NUMBER() OVER (ORDER BY id desc) row_num,* FROM [e_HomeWork_answer_answer] WHERE h_id = "+ DataBinder.Eval(e.Row.DataItem, "id"), conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            hw_stat.Text = DT1.Rows.Count.ToString();


             DA1 = new SqlDataAdapter("SELECT ROW_NUMBER() OVER (ORDER BY id desc) row_num,* FROM [e_HomeWork_answer_answer] WHERE grade is null and h_id = " + DataBinder.Eval(e.Row.DataItem, "id"), conn);
            DT1.Clear();
            DA1.Fill(DT1);
            hw_stat1.Text = DT1.Rows.Count.ToString();
            if(DT1.Rows.Count==0)
                e.Row.Cells[4].BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
            //if (dt_answer.Rows.Count > 0)
            //{
            //    if (dt_answer.Rows[0]["grade"].ToString() != "")
            //    {
            //        t_img.Visible = false;
            //        hw_stat.Text = "تم التقييم وحصلت على   ";
            //        hw_stat1.Visible = true;
            //        hw_stat1.Font.Size = System.Web.UI.WebControls.FontUnit.Large;
            //        hw_stat1.Text = dt_answer.Rows[0]["grade"].ToString();
            //    }
            //    else
            //    {
            //        hw_stat.Text = "في انتظار التقييم";

            //        t_img.Visible = true;
            //    }
            //}
            //else
            //{

            //    f_img.Visible = true;
            //}



            if (remin_day > 0)
            {
                 rem.Text = remin_day + " يوم ";
                e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
            }
                   
                else
                {
                if(remin_day == 0)
                {
                    if(remin_hour==0 && remin_Minute>0)
                    {
 rem.Text = remin_Minute + " دقيقة ";
                        e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#fcf8e3");
                    }
                  
                    else
                        if(remin_hour>0)
                    {
 rem.Text = remin_hour + " ساعه ";
                        e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#fcf8e3");
                    }
                   
                    else
                    {
                        rem.Text = "انتهى اليوم";
                        e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");
                    }
                   
                }
                    
                else
                {
                  rem.Text = "منتهي";
                    e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");
                }
                   
            }
            
            
               
        }
    }
}
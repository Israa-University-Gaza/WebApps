using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_stat : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        res.Visible = false;
        if (Request.QueryString["id"] != null)
            id.Text = Request.QueryString["id"];

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt_exist = new DataTable();
            res.Visible = true;
            HyperLink1.Visible = true;
            HyperLink1.NavigateUrl = "ShowData.aspx?id=" + id.Text;
            dt_exist = m.hr_emp_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows[0][0].ToString() == "")
            {
                s1.Text = "غير مدخلة";
                s1.Style.Add("color", "red");

            }
            else
                s1.Text = " مدخلة";

            dt_exist = m.hr_emp_cer_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s2.Text = "غير مدخلة";
                s2.Style.Add("color", "red");

            }
            else
                s2.Text = " مدخل عدد " + dt_exist.Rows.Count + "  مؤهل ";



            dt_exist = m.hr_emp_lang_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s3.Text = "غير مدخلة";
                s3.Style.Add("color", "red");

            }
            else
                s3.Text = " مدخل عدد " + dt_exist.Rows.Count + " لغة ";

            dt_exist = m.hr_emp_exp_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s4.Text = "غير مدخلة";
                s4.Style.Add("color", "red");

            }
            else
                s4.Text = " مدخل عدد " + dt_exist.Rows.Count + " خبرة ";

            dt_exist = m.hr_emp_skills_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s5.Text = "غير مدخلة";
                s5.Style.Add("color", "red");

            }
            else
                s5.Text = " مدخل عدد " + dt_exist.Rows.Count + " مهارة ";

            dt_exist = m.hr_emp_extra_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s6.Text = "غير مدخلة";
                s6.Style.Add("color", "red");
            }
            else
                s6.Text = " مدخل عدد " + dt_exist.Rows.Count + " خبرة ";

            dt_exist = m.hr_emp_identifier_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s7.Text = "غير مدخلة";
                s7.Style.Add("color", "red");

            }
            else
                s7.Text = " مدخل عدد " + dt_exist.Rows.Count + " معرف ";

            dt_exist = m.hr_emp_Future_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s8.Text = "غير مدخلة";
                s8.Style.Add("color", "red");

            }
            else
                s8.Text = " مدخلة";

            dt_exist = m.hr_emp_img_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s9.Text = "غير مدخلة";
                s9.Style.Add("color", "red");

            }
            else
                s9.Text = " مدخل عدد " + dt_exist.Rows.Count + " مرفق ";

            dt_exist = m.hr_emp_cv_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s10.Text = "غير مدخلة";
                s10.Style.Add("color", "red");
                cvv.Visible = false;
            }
            else
            {
                s10.Text = " ";
                //s10.Visible = false;
                cvv.Visible = true;
                //cvv.HRef= "Showcv.ashx?id=" + id.Text;
                cccv.Src = "Showcv.ashx?id=" + id.Text;
            }

            dt_exist = m.hr_emp_p_img_exist(Convert.ToInt32(id.Text));
            if (dt_exist.Rows.Count == 0)
            {
                s11.Text = "غير مدخلة";
                s11.Style.Add("color", "red");
                Image1.Visible = false;
            }
            else
            {
                s11.Text = " مدخلة";
                s11.Visible = false;
                Image1.ImageUrl = "ShowImage_p.ashx?id=" + id.Text;

            }
        }
        catch
        {
            //exp_lab.Visible = true;
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب") != null)
        {
            Label Label3 = (Label)e.Row.FindControl("Label3");
            if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب").ToString() == "مؤهل غير كافي")
            {
                Label3.ForeColor = System.Drawing.Color.Red;
                Label3.Font.Bold = true;
            }
            else
                Label3.ForeColor = System.Drawing.Color.Green;
        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "الخبرة") != null)
        {
            if (DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString() != "لا يوجد خبرة")
            {
                string exp = DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString();
                Label exp_lab1 = (Label)e.Row.FindControl("exp_lab1");
                string exp_output = DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString();
                string y = exp.Split('-')[0];
                string m = exp.Split('-')[1];
                if (y.StartsWith("0"))
                    exp_output = m;
                if (m.StartsWith("0"))
                    exp_output = y;
                if (y.StartsWith("0") && m.StartsWith("0"))
                    exp_output = "";

                exp_lab1.Text = exp_output;
            }
        }
    }
}
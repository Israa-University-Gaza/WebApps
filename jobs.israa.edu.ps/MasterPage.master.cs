using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");
        bool stat=true;
        idd.InnerText = Session["emp_id"].ToString();
        DataTable dt = m.hr_p_img_get(Convert.ToInt32(Session["emp_id"].ToString()));
        if (dt.Rows.Count > 0)
            Image1.ImageUrl = "ShowImage_p.ashx";
        else
            Image1.ImageUrl = "http://romaparvaz.com/wp-content/uploads/2017/07/no-pic.jpg";

        DataTable dt_exist = new DataTable();

        dt_exist = m.hr_emp_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows[0][0].ToString() == "")
        {
            s1.InnerText = "غير مدخلة";
            s1.Style.Add("color", "red");
            stat = false;
        }
        else
            s1.InnerText = " مدخلة";

        dt_exist = m.hr_emp_cer_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s2.InnerText = "غير مدخلة";
            s2.Style.Add("color", "red");
            stat = false;
        }
        else
            s2.InnerText = " مدخل عدد " + dt_exist.Rows.Count + "  مؤهل ";



        dt_exist = m.hr_emp_lang_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s3.InnerText = "غير مدخلة";
            s3.Style.Add("color", "red");
            stat = false;
        }
        else
            s3.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " لغة ";

        dt_exist = m.hr_emp_exp_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s4.InnerText = "غير مدخلة";
            s4.Style.Add("color", "red");
            stat = false;
        }
        else
            s4.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " خبرة ";

        dt_exist = m.hr_emp_skills_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s5.InnerText = "غير مدخلة";
            s5.Style.Add("color", "red");
        
        }
        else
            s5.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " مهارة ";

        dt_exist = m.hr_emp_extra_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s6.InnerText = "غير مدخلة";
            s6.Style.Add("color", "red");
        }
        else
            s6.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " خبرة ";

        dt_exist = m.hr_emp_identifier_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s7.InnerText = "غير مدخلة";
            s7.Style.Add("color", "red");
            stat = false;
        }
        else
            s7.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " معرف ";

        dt_exist = m.hr_emp_Future_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count ==0)
        {
            s8.InnerText = "غير مدخلة";
            s8.Style.Add("color", "red");
            stat = false;
        }
        else
            s8.InnerText = " مدخلة";

        dt_exist = m.hr_emp_img_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s9.InnerText = "غير مدخلة";
            s9.Style.Add("color", "red");
            stat = false;
        }
        else
            s9.InnerText = " مدخل عدد " + dt_exist.Rows.Count + " مرفق ";

        dt_exist = m.hr_emp_cv_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s10.InnerText = "غير مدخلة";
            s10.Style.Add("color", "red");
            stat = false;
        }
        else
            s10.InnerText = " مدخلة";

        dt_exist = m.hr_emp_p_img_exist(Convert.ToInt32(Session["emp_id"]));
        if (dt_exist.Rows.Count == 0)
        {
            s11.InnerText = "غير مدخلة";
            s11.Style.Add("color", "red");
            stat = false;
        }
        else
            s11.InnerText = " مدخلة";


        if (stat == false)
        {
            msg.InnerText = "الطلب غير مستكمل";
            msg1.InnerText = "غير مكتمل";
            Session["stat"] = "no";
        }
        else
        {
            //msg.InnerText = "الطلب";
            msg.InnerText = " بالامكان التقديم";
            Session["stat"] = "yas";
        }


    }
}

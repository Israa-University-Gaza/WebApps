using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lock : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if(!IsPostBack)
        {
            Session["Lock"] = 1;
        }


        emp.InnerText = Session["emp_id"].ToString();
        emp1.InnerText ="لست "+ Session["emp_id"].ToString();
        DataTable dt = m.hr_p_img_get(Convert.ToInt32(Session["emp_id"].ToString()));
        if(dt.Rows.Count>0)
      img1.Src= "ShowImage_p.ashx";
        else
            img1.Src = "http://jobs.israa.edu.ps/Sofouf_files/img/logo.png";

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       DataTable dt= m.hr_login(Session["emp_id"].ToString(), TextBox1.Text);
        if (dt.Rows.Count > 0)
        {
            Session["Lock"] = null;
            Response.Redirect("Default.aspx");
        }
        else
            msg.Visible = true;

    }
}
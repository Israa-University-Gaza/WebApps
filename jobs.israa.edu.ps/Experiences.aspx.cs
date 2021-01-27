using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");
        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        h1.HRef = "Languages.aspx";
        h2.HRef = "PersonalSkills.aspx";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        CultureInfo culture = new CultureInfo("gsw-FR");
        DateTime from_date = Convert.ToDateTime(exp_from.Text, culture);
        DateTime to_date = Convert.ToDateTime(exp_to.Text, culture);
        if (from_date > to_date)
        {
           
            msg.Visible = true;
            msg.InnerText = "خطأ في تاريخ الفترة ";
        }
        else
        {
           
                m.hr_emp_exp_add(Convert.ToInt32(Session["emp_id"].ToString()), exp_name.Text, exp_addr.Text, exp_from.Text, exp_to.Text, exp_type.Text);
                Response.Redirect("Experiences.aspx");
            
        }



    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox exp_from = (TextBox)GridView1.Rows[e.RowIndex].FindControl("exp_from");
        TextBox exp_to = (TextBox)GridView1.Rows[e.RowIndex].FindControl("exp_to");

        DateTime from_date = Convert.ToDateTime(exp_from.Text);
        DateTime to_date = Convert.ToDateTime(exp_to.Text);

        if (from_date > to_date)
        {

            msg.Visible = true;
            msg.InnerText = "خطأ في تاريخ الفترة ";
            e.Cancel = true;
         
        }
        else
            msg.Visible = false;
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (DataBinder.Eval(e.Item.DataItem, "الخبرة") != null)
        {
            if (DataBinder.Eval(e.Item.DataItem, "الخبرة").ToString() != "لا يوجد خبرة")
            {
                string exp = DataBinder.Eval(e.Item.DataItem, "الخبرة").ToString();
                Label Label1 = (Label)e.Item.FindControl("Label1");
                string exp_output = DataBinder.Eval(e.Item.DataItem, "الخبرة").ToString();
                string y = exp.Split('-')[0];
                string m = exp.Split('-')[1];
                if (y.StartsWith("0"))
                    exp_output = m;
                if (m.StartsWith("0"))
                    exp_output = y;
                if (y.StartsWith("0") && m.StartsWith("0"))
                    exp_output = "";

                Label1.Text = exp_output;
            }
        }
    }
}
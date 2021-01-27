using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");
        //if (GridView1.Rows.Count > 0)
        //    not_found.Visible = false;
        //else
        //    not_found.Visible = true;
        h1.HRef = "PersonalInformation.aspx";
        h2.HRef = "Languages.aspx";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        CultureInfo culture = new CultureInfo("gsw-FR");
        DateTime from_date = Convert.ToDateTime(from.Text,culture);
        DateTime to_date = Convert.ToDateTime(to.Text, culture);
        if (from_date > to_date)
        {
         
            msg.Visible = true;
            msg.InnerText = "خطأ في تاريخ الفترة ";
        }
        else
        {
            DateTime date_degree_d = Convert.ToDateTime(date_degree.Text, culture);
            if (date_degree_d > DateTime.Now)
            {
                msg.Visible = true;
                msg.InnerText = "خطأ في تاريخ البداية ";
            }
            else
            {
                m.hr_emp_cer(Convert.ToInt32(Session["emp_id"].ToString()), uni.Text, DropDownList1.SelectedItem.Text, from.Text, to.Text, DropDownList2.SelectedItem.Text, date_degree.Text, gpa.Text, maj.SelectedValue);
                Response.Redirect("ScientificData.aspx");
            }
            }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox exp_from = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        TextBox exp_to = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
        TextBox date_degree = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6");

        DateTime from_date = Convert.ToDateTime(exp_from.Text);
        DateTime to_date = Convert.ToDateTime(exp_to.Text);
        DateTime date_degree_d = Convert.ToDateTime(date_degree.Text);
        if (from_date > to_date)
        {

            msg.Visible = true;
            msg.InnerText = "خطأ في تاريخ الفترة ";
            e.Cancel = true;
        }
        else
        {
            msg.Visible = false;
        }
        if (date_degree_d > DateTime.Now)
        {
            msg.Visible = true;
            msg.InnerText = "خطأ في تاريخ البداية ";
            e.Cancel = true;
        }
        else
        {
            msg.Visible = false;
        }
    }

    protected void maj_DataBound(object sender, EventArgs e)
    {
        maj.Items.Insert(0, new ListItem("اختر", "-1"));
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("cer1") != null)
        
            if (DataBinder.Eval(e.Row.DataItem, "cer") != null)
            {
                TextBox cer1 = (TextBox)e.Row.FindControl("cer1");
                cer1.Text = m.maj_get(Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "cer")));
            }
        
    }
}
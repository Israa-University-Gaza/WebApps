using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class JobsAvailable : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        tit.InnerText = " اعلانات الوظائف المتاحة "+"1-2020";

        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");
        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Button Button1 = (Button)e.Row.FindControl("Button1");
        Label Label1 = (Label)e.Row.FindControl("Label1");
        DataTable dt = m.hr_emp_jobs_exist(Convert.ToInt32(Session["emp_id"]), Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id")));
        if (dt.Rows.Count > 0)
        {
            CultureInfo culture = new CultureInfo("gsw-FR");
            DateTime Deadline = Convert.ToDateTime(dt.Rows[0]["dat"], culture);
            Button1.Visible = false;
            Label1.Text=" تم التقديم في تاريخ "+ Deadline.ToString("dd/MM/yyyy");
        }
        if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب") != null)
        {
            if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب").ToString() == "مؤهل غير كافي")
            {
                Button1.Visible = false;
                Label1.Text = "مؤهل غير كافي";
            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = (Button)sender;
        m.hr_emp_jobs_add(Convert.ToInt32(Session["emp_id"]), Convert.ToInt32(Button1.CommandArgument));
        GridView1.DataBind();
    }
}
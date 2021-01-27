using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Default : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView1.HeaderRow.FindControl("count") != null)
        {
            HyperLink count = (HyperLink)GridView1.HeaderRow.FindControl("count");
            count.Text = GridView1.Rows.Count.ToString();
            count.NavigateUrl = "rep_job.aspx?id=" + Request.QueryString["id"];        }
        tit.InnerText = m.hr_emp_job_name(Convert.ToInt32(Request.QueryString["id"]));
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب") != null)
        {
            Label Label1 = (Label)e.Row.FindControl("Label1");
            if (DataBinder.Eval(e.Row.DataItem, "حالة_الطلب").ToString() == "مؤهل غير كافي")
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Font.Bold = true;
            }
            else
                Label1.ForeColor = System.Drawing.Color.Green;
        }

        

        if (DataBinder.Eval(e.Row.DataItem, "الخبرة") != null)
        {
            if (DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString() != "")
            {
                string exp = DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString();
                Label exp_lab = (Label)e.Row.FindControl("exp_lab");
                string exp_output = DataBinder.Eval(e.Row.DataItem, "الخبرة").ToString();
                string y = exp.Split('-')[0];
                string m = exp.Split('-')[1];
                if (y.StartsWith("0"))
                    exp_output = m;
                if (m.StartsWith("0"))
                    exp_output = y;
                if (y.StartsWith("0") && m.StartsWith("0"))
                    exp_output = "";
                
                exp_lab.Text = exp_output;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = (Button)sender;
        int id = Convert.ToInt32(Button1.CommandArgument);
        m.hr_jobs_emp_delete(id);
        GridView1.DataBind();
    }
}
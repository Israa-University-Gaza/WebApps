using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_rep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "البلد") != null)
        {
            Label Label1 = (Label)e.Row.FindControl("Label1");
            Label Label3 = (Label)e.Row.FindControl("Label3");
            try {
                Label1.Text = DataBinder.Eval(e.Row.DataItem, "البلد").ToString().Split('_')[1];
                Label3.Text = DataBinder.Eval(e.Row.DataItem, "البلد").ToString().Split('_')[0];
            }
            catch
            { }
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
}
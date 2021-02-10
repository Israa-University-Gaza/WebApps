using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Inbox : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void show_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

        
            Label dt_s = (Label)e.Row.FindControl("dt_s");
            if (DataBinder.Eval(e.Row.DataItem, "r_dt") == null)
            dt_s.Visible = false;
            else
            {
            dt_s.Visible = true;
            dt_s.ToolTip = "تم الرد والتعديل في   " + DataBinder.Eval(e.Row.DataItem, "r_dt");
            }
        }
        catch
        {

        }


        if (DataBinder.Eval(e.Row.DataItem, "seen") != null)
        {
            Boolean seen = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "seen"));
            if (!seen)
                e.Row.Style.Add("background-color", "#eff0f1");
        }
      
    }

    protected void show0_Click(object sender, EventArgs e)
    {
        Button show = (Button)sender;
        string id = show.CommandArgument;
        r.masseges_del(id);
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Button Button1 = (Button)sender;
        int id =Convert.ToInt32(Button1.CommandArgument);
        TextBox TextBox1 =(TextBox) GridView1.Rows[id-1].FindControl("TextBox1");
        Label Label1=(Label) GridView1.Rows[id-1].FindControl("Label1");
        Repeater Repeater1=(Repeater)GridView1.Rows[id - 1].FindControl("Repeater1");
        r.masseges_rep(Session["log"].ToString(), Session["name"].ToString(), TextBox1.Text, Label1.Text);
        Repeater1.DataBind();
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
    }
}
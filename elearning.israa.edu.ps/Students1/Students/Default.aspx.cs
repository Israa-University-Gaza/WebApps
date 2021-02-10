
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    eLern r = new  eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)

            Response.Redirect("../Login.aspx");
        if (Session["id"] == null)
            Response.Redirect("../Login.aspx");
        f_name.Text = Session["name"].ToString().Split(' ')[0];
        DataTable dt1 = r.std_data(Session["id"].ToString());
        coll.Text = dt1.Rows[0]["college"].ToString();
        dept.Text = dt1.Rows[0]["department"].ToString(); 
        gpa.Text = dt1.Rows[0]["gpauniversity"].ToString(); 
        prod.Text = dt1.Rows[0]["program"].ToString();

        DataTable dt = r.STD_COURS(Session["log"].ToString());
        //Response.Write(dt.Rows[0][0]);
        Repeater.DataSource = dt;
        Repeater.DataBind();

    }


    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label Label1 = (Label)e.Item.FindControl("Label1");
        HyperLink HyperLink5 = (HyperLink)e.Item.FindControl("HyperLink5");
HyperLink5.NavigateUrl = "javascript:openDetailsWindow2(\""+ r.get_lec(DataBinder.Eval(e.Item.DataItem, "courseCode").ToString(), DataBinder.Eval(e.Item.DataItem, "sectionNum").ToString()) + "\")";
        Label1.Text = r.lec_name(r.get_lec(DataBinder.Eval(e.Item.DataItem, "courseCode").ToString(), DataBinder.Eval(e.Item.DataItem, "sectionNum").ToString()));
    }
}


   

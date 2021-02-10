using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Instructor_ViewFile : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        DataTable dt = r.e_exams_get1(Convert.ToInt32(Request.QueryString["id"]));
        Label1.Text = dt.Rows[0]["title"].ToString();
        pass.Text = dt.Rows[0]["pass"].ToString();
        det.Text = dt.Rows[0]["det"].ToString();
        HyperLink1.NavigateUrl= dt.Rows[0]["link"].ToString();
        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "exm", Request.QueryString["id"]);
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        

    }
}

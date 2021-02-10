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
        DataTable dt = r.e_files_get1(Convert.ToInt32(Request.QueryString["id"]));
        Label1.Text = dt.Rows[0]["title"].ToString();
        dt1.Text = dt.Rows[0]["EnterDate"].ToString().Split(' ')[0];
        dt2.Text = dt.Rows[0]["EnterDate"].ToString().Split(' ')[1];
        Label2.Text = dt.Rows[0]["det"].ToString();
        Image1.ImageUrl = "~/assets/"+ dt.Rows[0]["path"].ToString().Split('.')[1] + ".png";
        a.HRef = "~//Filess//" + dt.Rows[0]["path"].ToString();
        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "fil", Request.QueryString["id"]);
        if (!IsPostBack)
        {
            Repeater.DataSource = r.comments_get(Request.QueryString["id"], "fil");
            Repeater.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        r.e_comments_add(Session["log"].ToString(), Session["name"].ToString(), Editor1.Text, Request.QueryString["id"], "fil");
        Response.Redirect("Viewfile.aspx?id=" + Request.QueryString["id"]);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.comments_del(id);
        Response.Redirect("Viewfile.aspx?id=" + Request.QueryString["id"]);

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        

    }
}

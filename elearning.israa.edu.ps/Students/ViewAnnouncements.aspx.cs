using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ViewAnnouncements : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        DataTable dt = r.e_Announcements_get1(Convert.ToInt32(Request.QueryString["id"]));
        Label1.Text = dt.Rows[0]["title"].ToString();

        det.Text = dt.Rows[0]["det"].ToString();
        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "ann", Request.QueryString["id"]);
        if(!IsPostBack)
        {
Repeater.DataSource = r.comments_get(Request.QueryString["id"], "ann");
        Repeater.DataBind();
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        r.e_comments_add(Session["log"].ToString(), Session["name"].ToString(), Editor1.Text, Request.QueryString["id"], "ann");
        Response.Redirect("ViewAnnouncements.aspx?id=" + Request.QueryString["id"]);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.comments_del(id);
        Response.Redirect("ViewAnnouncements.aspx?id=" + Request.QueryString["id"]);

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)e.Item.FindControl("ImageButton1");
        string who = DataBinder.Eval(e.Item.DataItem, "std_id").ToString();
        if (who == Session["log"].ToString())
            ImageButton1.Visible = true;
        else
            ImageButton1.Visible = false;

    }
}
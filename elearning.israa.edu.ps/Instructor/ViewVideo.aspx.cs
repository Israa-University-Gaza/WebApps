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
        DataTable dt = r.e_vids_get1(Convert.ToInt32(Request.QueryString["id"]));
        Label1.Text = dt.Rows[0]["title"].ToString();
        h1.NavigateUrl = dt.Rows[0]["link"].ToString();
        if (dt.Rows[0]["link"].ToString().Contains("you"))
        {
            if (dt.Rows[0]["link"].ToString().Contains("?v="))
            {
                if (dt.Rows[0]["link"].ToString().Split('?')[1].Replace("v=", "").Contains("&"))
                    fram.Src = "https://www.youtube.com/embed/" + dt.Rows[0]["link"].ToString().Split('?')[1].Replace("v=", "").Split('&')[0];
                else
                    fram.Src = "https://www.youtube.com/embed/" + dt.Rows[0]["link"].ToString().Split('?')[1].Replace("v=", "");
            }
            else
                fram.Src = "https://www.youtube.com/embed/" + dt.Rows[0]["link"].ToString().Replace("https://youtu.be/", "");

        }
        else
            fram.Visible = false;

        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "vid", Request.QueryString["id"]);
        if (!IsPostBack)
        {
            Repeater.DataSource = r.comments_get(Request.QueryString["id"], "vid");
            Repeater.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        r.e_comments_add(Session["log"].ToString(), Session["name"].ToString(), Editor1.Text, Request.QueryString["id"], "vid");
        Response.Redirect("ViewVideo.aspx?id=" + Request.QueryString["id"]);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.comments_del(id);
        Response.Redirect("ViewVideo.aspx?id=" + Request.QueryString["id"]);

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    }
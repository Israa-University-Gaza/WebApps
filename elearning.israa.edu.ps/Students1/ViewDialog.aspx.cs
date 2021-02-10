using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Dialog_ : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "dia", Request.QueryString["id"]);
        if (!IsPostBack)
        {
       
        DataTable dt = r.e_dialog_get1(Request.QueryString["id"]);
        title.Text = dt.Rows[0]["title"].ToString();
            det.Text = dt.Rows[0]["det"].ToString();
            Repeater.DataSource = r.Dialog_Replays_get(Request.QueryString["id"]);
        Repeater.DataBind();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        r.e_Dialog_Replays_add(Request.QueryString["id"], Editor1.Text, Session["log"].ToString(), Session["name"].ToString(), Session["role"].ToString());
        Repeater.DataSource = r.Dialog_Replays_get(Request.QueryString["id"]);
        Repeater.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.Dialog_Replays_del(id);
        Response.Redirect("ViewDialog.aspx?id="+ Request.QueryString["id"]);
     
    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)e.Item.FindControl("ImageButton1");
        string who = DataBinder.Eval(e.Item.DataItem, "who").ToString();
        if (who == Session["log"].ToString())
            ImageButton1.Visible = true;
        else
            ImageButton1.Visible = false;

    }
}
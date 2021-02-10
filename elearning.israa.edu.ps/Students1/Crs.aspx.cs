
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        h1.NavigateUrl = "~/Students/HomeworkReport.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"];

        DataTable dt = r.e_crs_OverVeiw_get(Request.QueryString["crs"]);
        if (dt.Rows.Count == 0)
            OverVeiwL.Enabled = false;
        else
        {
            OverVeiwL.NavigateUrl = "ViewOverView.aspx?crs=" + Request.QueryString["crs"];
            OverVeiw.Visible = false;
        }
        DataTable dt1 = r.e_crs_syllbus_get(Request.QueryString["crs"]);
        if (dt1.Rows.Count == 0)
            SyllbusL.Enabled = false;
        else
        {
            SyllbusL.NavigateUrl = "~//Syllbus//" + dt1.Rows[0]["path"];
            Syllbus.Visible = false;
        }
        DataTable dt2 = r.e_crs_books_get(Request.QueryString["crs"]);
        if (dt2.Rows.Count == 0)
            bookL.Enabled = false;

        else
        {
            bookL.NavigateUrl = "~//books//" + dt2.Rows[0]["path"];
            book.Visible = false;
        }
        section.Text = Request.QueryString["section"];
        c_code.Text =  Request.QueryString["crs"];
        c_name.Text= Request.QueryString["c_n"];
        DataTable dt12 = r.GetSectionDetails(Request.QueryString["sectionid"]);
        if (dt12.Rows.Count > 0)
            lec.Text = dt12.Rows[0]["instructor"].ToString();
        else
            lec.Text = "";
    }


    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater Repeater1 = (Repeater)e.Item.FindControl("Repeater1");
        Repeater Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
        Repeater Repeater3 = (Repeater)e.Item.FindControl("Repeater3");
        Repeater Repeater4 = (Repeater)e.Item.FindControl("Repeater4");
        Repeater Repeater5 = (Repeater)e.Item.FindControl("Repeater5");
        Repeater Repeater6 = (Repeater)e.Item.FindControl("Repeater6");
        Repeater Repeater7 = (Repeater)e.Item.FindControl("Repeater7");
        HtmlGenericControl r1 = (HtmlGenericControl)e.Item.FindControl("r1");
        HtmlGenericControl r11 = (HtmlGenericControl)e.Item.FindControl("r11");



        Label Label4 = (Label)e.Item.FindControl("Label4");
        Label Label5 = (Label)e.Item.FindControl("Label5");

        DataTable dt = r.e_files_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text),Request.QueryString["section"]);

        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        DataTable dt1 = r.e_Announcements_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);
        Repeater2.DataSource = dt1;
        Repeater2.DataBind();
        DataTable dt2 = r.e_homework_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);
        Repeater3.DataSource = dt2;
        Repeater3.DataBind();


        DataTable dt3 = r.e_links_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);

        Repeater4.DataSource = dt3;
        Repeater4.DataBind();

        DataTable dt4 = r.e_vids_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);

        Repeater5.DataSource = dt4;
        Repeater5.DataBind();

        DataTable dt5 = r.e_dialog_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);

        Repeater6.DataSource = dt5;
        Repeater6.DataBind();

        DataTable dt6 = r.e_exams_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);

        Repeater7.DataSource = dt6;
        Repeater7.DataBind();

        if (Repeater1.Items.Count == 0 && Repeater2.Items.Count == 0 && Repeater3.Items.Count == 0 && Repeater4.Items.Count == 0 && Repeater5.Items.Count == 0 && Repeater6.Items.Count == 0 && Repeater7.Items.Count == 0)
        {
            r11.Style.Add("height", "228px");
            r1.Visible = false;
            Label5.Visible = true;
        }


    }

    protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Image Image1 = (Image)e.Item.FindControl("Image1");
        Image1.ImageUrl = "~/assets/" + DataBinder.Eval(e.Item.DataItem, "path").ToString().Split('.')[1] + ".png";

    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
    }

}

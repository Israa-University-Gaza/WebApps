using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    eLern r = new eLern();
   
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)

    {

      





        HyperLink1.NavigateUrl = "~/Instructor/HomeWorksReports.aspx?crs=" + Request.QueryString["crs"] + "&section="+ Request.QueryString["section"];
        L1.NavigateUrl= "OverVeiw.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"];
        L2.NavigateUrl= "Syllbus.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"];
        L3.NavigateUrl = "books.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"];
        DataTable dt = r.e_crs_OverVeiw_get(Request.QueryString["crs"]);

        SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
        DataTable DT1 = new DataTable();
        DA1.Fill(DT1);

        SqlDataAdapter DA11 = new SqlDataAdapter("SELECT       crs_name   FROM            crs_2020 where crs_id='"+Request.QueryString["crs"]+"'", conn);
        DataTable DT11 = new DataTable();
        DA11.Fill(DT11);
        try
        {
   crs_name.InnerText = DT11.Rows[0][0].ToString();
        }
     catch
        {
            crs_name.InnerText = "";
        }
        setinon.InnerText = Request.QueryString["section"];

        DataTable dt1e = r.std_cours(Request.QueryString["crs"], Request.QueryString["section"]);
        std_count.InnerText = dt1e.Rows.Count.ToString();


        string sem;
        if (Request.QueryString["sem"] == "" || Request.QueryString["sem"] ==null )
            sem = DT1.Rows[0][0].ToString();
        else
            sem = Request.QueryString["sem"];
        SqlDataAdapter DA2 = new SqlDataAdapter("SELECT * FROM [e_crs_week] where sem ="+sem, conn);
        DataTable DT2 = new DataTable();
        DA2.Fill(DT2);
        Repeater.DataSource = DT2;
        Repeater.DataBind();


        if (dt.Rows.Count == 0)
            OverVeiwL.Enabled = false;
        else
        {
            OverVeiwL.NavigateUrl = "~/Instructor/ViewOverView.aspx?crs=" + Request.QueryString["crs"];
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
        SqlDataAdapter DA_files = new SqlDataAdapter("select count(distinct path) from e_files where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);

        DataTable DTfiles = new DataTable();
        DA_files.Fill(DTfiles);
        files.InnerText = DTfiles.Rows[0][0].ToString();


         DA_files = new SqlDataAdapter("select count(distinct EnterDate) from e_HomeWork where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);
        DTfiles.Clear();
        DA_files.Fill(DTfiles);
        hw.InnerText = DTfiles.Rows[0][0].ToString();

        DA_files = new SqlDataAdapter("select count(distinct EnterDate) from e_dialog where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);
        DTfiles.Clear();
        DA_files.Fill(DTfiles);
        dialog.InnerText = DTfiles.Rows[0][0].ToString();

        DA_files = new SqlDataAdapter("select count(distinct EnterDate) from e_links where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);
        DTfiles.Clear();
        DA_files.Fill(DTfiles);
        links.InnerText = DTfiles.Rows[0][0].ToString();

        DA_files = new SqlDataAdapter("select count(distinct EnterDate) from e_vids where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);
        DTfiles.Clear();
        DA_files.Fill(DTfiles);
        vids.InnerText = DTfiles.Rows[0][0].ToString();


        DA_files = new SqlDataAdapter("select count(distinct EnterDate) from e_Announcements where  sem = (select top 1 semester_id from e_semester) and crs_id='" + Request.QueryString["crs"] + "' and section=" + Request.QueryString["section"], conn);
        DTfiles.Clear();
        DA_files.Fill(DTfiles);
        ann.InnerText = DTfiles.Rows[0][0].ToString();

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

        DataTable dt = r.e_files_get(Request.QueryString["crs"], Convert.ToInt32(Label4.Text), Request.QueryString["section"]);

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


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "1");
        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "2");
        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "3");
        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "4");

        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "5");

        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "6");

        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.e_del(id, "7");

        Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
    }

    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;


        Response.Redirect("HomeWork.aspx?id=" + id);
    }
}


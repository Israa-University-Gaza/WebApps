using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_lecc : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../login.aspx");

        if (Session["log"] == null)
            Response.Redirect("../login.aspx");
        DataTable dt = r.coll_lect(all.SelectedValue);
        if (Session["log"].ToString() == "215" || Session["log"].ToString() == "133" || Session["log"].ToString() == "225" )
        {
            all.Visible = true;
            dt = r.coll_lect(all.SelectedValue);
        }

        if (Session["log"].ToString() == "127" || Session["log"].ToString() == "276")
        {
            d127.Visible = true;
            dt = r.coll_lect(d127.SelectedValue);
        }

        if (Session["log"].ToString() == "110" || Session["log"].ToString() == "186" || Session["log"].ToString() == "8130")
        {
            d110.Visible = true;
            dt = r.coll_lect(d110.SelectedValue);
        }

        if (Session["log"].ToString() == "269")
        {
            d269.Visible = true;
            dt = r.coll_lect(d269.SelectedValue);

        }

        if (Session["log"].ToString() == "8118")
        {
            d8118.Visible = true;
            dt = r.coll_lect(d8118.SelectedValue);
        }

        if (Session["log"].ToString() == "275")
        {
            d275.Visible = true;
            dt = r.coll_lect(d275.SelectedValue);
        }





        Repeater.DataSource = GridView1.DataSource = r.RemoveDuplicateRows(dt, "employeeNo"); ;
        Repeater.DataBind();
        GridView1.DataBind();
        Label t_files = (Label)GridView1.FooterRow.FindControl("t_files");
        Label t_homeworks = (Label)GridView1.FooterRow.FindControl("t_homeworks");
        Label t_Announcements = (Label)GridView1.FooterRow.FindControl("t_Announcements");
        Label t_links = (Label)GridView1.FooterRow.FindControl("t_links");
        Label t_videos = (Label)GridView1.FooterRow.FindControl("t_videos");
        Label t_dis = (Label)GridView1.FooterRow.FindControl("t_dis");
        Label tot = (Label)GridView1.FooterRow.FindControl("tot");
        int f = 0;
        int h = 0;
        int a = 0;
        int l = 0;
        int v = 0;
        int d = 0;
        int tt = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label files = (Label)GridView1.Rows[i].FindControl("files1");
            Label homeworks = (Label)GridView1.Rows[i].FindControl("homeworks1");
            Label Announcements = (Label)GridView1.Rows[i].FindControl("Announcements1");
            Label links = (Label)GridView1.Rows[i].FindControl("links1");
            Label videos = (Label)GridView1.Rows[i].FindControl("videos1");
            Label dis = (Label)GridView1.Rows[i].FindControl("dis");
            Label total = (Label)GridView1.Rows[i].FindControl("total");
            int t = 0;
            t = Convert.ToInt32(files.Text) + Convert.ToInt32(homeworks.Text) + Convert.ToInt32(Announcements.Text) + Convert.ToInt32(links.Text) + Convert.ToInt32(videos.Text) + Convert.ToInt32(dis.Text);
            total.Text = t.ToString();
            f = f + Convert.ToInt32(files.Text);
            h = h + Convert.ToInt32(homeworks.Text);
            a = a + Convert.ToInt32(Announcements.Text);
            l = l+ Convert.ToInt32(links.Text);
            v = v + Convert.ToInt32(videos.Text);
            d = d + Convert.ToInt32(dis.Text);
            tt=tt+Convert.ToInt32(total.Text);
        }
        t_files.Text = f.ToString();

        t_homeworks.Text = h.ToString();
        t_Announcements.Text = a.ToString();
        t_links.Text = l.ToString();
        t_videos.Text = v.ToString();
        t_dis.Text = d.ToString();
        tot.Text = tt.ToString();

       

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string last = DataBinder.Eval(e.Item.DataItem, "lastLogin").ToString();
        HyperLink HyperLink4 = (HyperLink)e.Item.FindControl("HyperLink4");

        Label files = (Label)e.Item.FindControl("files");
        Label homeworks = (Label)e.Item.FindControl("homeworks");
        Label Announcements = (Label)e.Item.FindControl("Announcements");
        Label links = (Label)e.Item.FindControl("links");
        Label videos = (Label)e.Item.FindControl("videos");
        Label dis = (Label)e.Item.FindControl("dis");

        SqlDataAdapter DA = new SqlDataAdapter("select count(*) from e_files where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        try
        {
            files.Text = DT.Rows[0][0].ToString();
        }
        catch
        {

        }


        SqlDataAdapter DA1 = new SqlDataAdapter("select count(*) from e_HomeWork where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT1 = new DataTable();
        DA1.Fill(DT1);
        homeworks.Text = DT1.Rows[0][0].ToString();

        SqlDataAdapter DA2 = new SqlDataAdapter("select count(*) from e_Announcements where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT2 = new DataTable();
        DA2.Fill(DT2);
        Announcements.Text = DT2.Rows[0][0].ToString();

        SqlDataAdapter DA3 = new SqlDataAdapter("select count(*) from e_links where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT3 = new DataTable();
        DA3.Fill(DT3);
        links.Text = DT3.Rows[0][0].ToString();

        SqlDataAdapter DA4 = new SqlDataAdapter("select count(*) from e_vids where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT4 = new DataTable();
        DA4.Fill(DT4);
        videos.Text = DT4.Rows[0][0].ToString();

        SqlDataAdapter DA5 = new SqlDataAdapter("select count(*) from e_dialog where lec=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString(), conn);
        DataTable DT5 = new DataTable();
        DA5.Fill(DT5);
        dis.Text = DT5.Rows[0][0].ToString();

        HyperLink4.NavigateUrl = "createSession.aspx?id=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString() + "&name=ك--" + DataBinder.Eval(e.Item.DataItem, "instructor").ToString().Replace(' ', '_') + "&last_log=no&session=" + Guid.NewGuid();
        Label lastl = (Label)e.Item.FindControl("last");
        if (last.Contains("لم"))
            lastl.ForeColor = System.Drawing.Color.Red;

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label files1 = (Label)e.Row.FindControl("files1");
        Label homeworks = (Label)e.Row.FindControl("homeworks1");
        Label Announcements = (Label)e.Row.FindControl("Announcements1");
        Label links = (Label)e.Row.FindControl("links1");
        Label videos = (Label)e.Row.FindControl("videos1");
        Label dis = (Label)e.Row.FindControl("dis");
        if (DataBinder.Eval(e.Row.DataItem, "employeeNo") != null)
        {
            SqlDataAdapter DA = new SqlDataAdapter("select count(*) from e_files where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            try
            {
                files1.Text = DT.Rows[0][0].ToString();
            }
            catch
            { }



            SqlDataAdapter DA1 = new SqlDataAdapter("select count(*) from e_HomeWork where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            try
            {
                homeworks.Text = DT1.Rows[0][0].ToString();
            }
            catch
            { }

            SqlDataAdapter DA2 = new SqlDataAdapter("select count(*) from e_Announcements where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT2 = new DataTable();
            DA2.Fill(DT2);
            try
            {
                Announcements.Text = DT2.Rows[0][0].ToString();

            }
            catch
            { }

            SqlDataAdapter DA3 = new SqlDataAdapter("select count(*) from e_links where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT3 = new DataTable();
            DA3.Fill(DT3);
            try
            {
                links.Text = DT3.Rows[0][0].ToString();
            }
            catch
            { }

            SqlDataAdapter DA4 = new SqlDataAdapter("select count(*) from e_vids where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT4 = new DataTable();
            DA4.Fill(DT4);
            try
            {
                videos.Text = DT4.Rows[0][0].ToString();

            }
            catch
            {

            }
            SqlDataAdapter DA5 = new SqlDataAdapter("select count(*) from e_dialog where lec=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString(), conn);
            DataTable DT5 = new DataTable();
            DA5.Fill(DT5);
            try
            {
                dis.Text = DT5.Rows[0][0].ToString();

            }
            catch
            {

            }

        }
    }

   

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = (Button) (sender);
        string employeeNo = Button1.CommandArgument;

        Response.Redirect("'javascript:openDetailsWindow1(" + employeeNo + ")'");
       

    }
}

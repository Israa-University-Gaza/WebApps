using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_lec_display : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = r.lec_name(Request.QueryString["emp"]);
        g2.DataSource = r.lec_COURS(Request.QueryString["emp"],"20");
        g2.DataBind();
        int tt = 0;
        for (int i = 0; i < g2.Rows.Count; i++)
        {
            Label files_t = (Label)g2.Rows[i].FindControl("files_t");
            Label homework_t = (Label)g2.Rows[i].FindControl("homework_t");
            Label Announcements_t = (Label)g2.Rows[i].FindControl("Announcements_t");
            Label link_t = (Label)g2.Rows[i].FindControl("link_t");
            Label vedio_t = (Label)g2.Rows[i].FindControl("vedio_t");
            Label dis_t = (Label)g2.Rows[i].FindControl("dis_t");
            Label total = (Label)g2.Rows[i].FindControl("total_t");
           
            
            tt = Convert.ToInt32(files_t.Text) + Convert.ToInt32(homework_t.Text) + Convert.ToInt32(Announcements_t.Text) + Convert.ToInt32(link_t.Text) + Convert.ToInt32(vedio_t.Text)+Convert.ToInt32(dis_t.Text);
            total.Text = tt.ToString();
        }

    }
    protected void g2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "courseCode") != null)
        {

            string crs_id = DataBinder.Eval(e.Row.DataItem, "courseCode").ToString();
            string sectionNum = DataBinder.Eval(e.Row.DataItem, "sectionNum").ToString();
            Label files_t = (Label)e.Row.FindControl("files_t");
            Label homework_t = (Label)e.Row.FindControl("homework_t");
            Label Announcements_t = (Label)e.Row.FindControl("Announcements_t");
            Label link_t = (Label)e.Row.FindControl("link_t");
            Label vedio_t = (Label)e.Row.FindControl("vedio_t");
            Label dis_t = (Label)e.Row.FindControl("dis_t");
            Label branch = (Label)e.Row.FindControl("branch");
            if (branch.Text == "1")
                branch.Text = "الزهراء";
            else
                branch.Text = "يافا";


            SqlDataAdapter DA = new SqlDataAdapter("select count(distinct path) from e_files where crs_id='" + crs_id + "' and section=" + sectionNum, conn);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            try
            {
                files_t.Text = DT.Rows[0][0].ToString();
            }
            catch
            { }



            //SqlDataAdapter DA1 = new SqlDataAdapter("select count(*) from e_HomeWork  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            SqlDataAdapter DA1 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_HomeWork where crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            try
            {
                homework_t.Text = DT1.Rows[0][0].ToString();
            }
            catch
            { }

            //SqlDataAdapter DA2 = new SqlDataAdapter("select count(*) from e_Announcements  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            SqlDataAdapter DA2 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_Announcements where crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            DataTable DT2 = new DataTable();
            DA2.Fill(DT2);
            try
            {
                Announcements_t.Text = DT2.Rows[0][0].ToString();

            }
            catch
            { }

            //SqlDataAdapter DA3 = new SqlDataAdapter("select count(*) from e_links  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            SqlDataAdapter DA3 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct EnterDate FROM e_links where crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            DataTable DT3 = new DataTable();
            DA3.Fill(DT3);
            try
            {
                link_t.Text = DT3.Rows[0][0].ToString();
            }
            catch
            { }

            //SqlDataAdapter DA4 = new SqlDataAdapter("select count(*) from e_vids  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            SqlDataAdapter DA4 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_vids where crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            DataTable DT4 = new DataTable();
            DA4.Fill(DT4);
            try
            {
                vedio_t.Text = DT4.Rows[0][0].ToString();

            }
            catch
            {

            }
            //SqlDataAdapter DA5 = new SqlDataAdapter("select count(*) from e_dialog  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            SqlDataAdapter DA5 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_dialog where crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            DataTable DT5 = new DataTable();
            DA5.Fill(DT5);
            try
            {
                dis_t.Text = DT5.Rows[0][0].ToString();

            }
            catch
            {

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");

    }
}
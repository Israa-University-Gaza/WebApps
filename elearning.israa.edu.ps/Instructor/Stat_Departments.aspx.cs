using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Stat_Departments : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        coll.Items.Insert(0, new ListItem("اختر", "-1"));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = r.coll_lect(coll.SelectedValue);
        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr = dt.Rows[i];
            if (dr["courseDepartment"].ToString() != dept.SelectedItem.Text /*|| dr["crs_count"].ToString() == "0"*/)
                dr.Delete();

        }
        dt.AcceptChanges();
        GridView2.DataSource = r.RemoveDuplicateRows(dt, "instructor"); ;
        GridView2.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (DataBinder.Eval(e.Row.DataItem, "courseDepartment") != null)
        {
            string courseDepartment = DataBinder.Eval(e.Row.DataItem, "courseDepartment").ToString();
            HyperLink HyperLink4 = (HyperLink)e.Row.FindControl("HyperLink4");
            HyperLink4.NavigateUrl = "createSession.aspx?id=" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString() + "&name=ك--" + DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString().Replace(' ', '_') + "&last_log=no&session=" + Guid.NewGuid();

            if (courseDepartment != dept.SelectedItem.Text)
            {
                e.Row.Visible = false;
            }
        }

           
            if (e.Row.FindControl("Label3") != null)
                {


                    Label Label3 = (Label)e.Row.FindControl("Label3");
                    GridView g2 = (GridView)e.Row.FindControl("g2");
                    SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
                    DataTable DT1 = new DataTable();
                    DA1.Fill(DT1);



                    g2.DataSource = r.lec_COURS(Label3.Text, DT1.Rows[0][0].ToString());
                    g2.DataBind();
            int tt = 0;
            for (int i = 0; i < g2.Rows.Count; i++)
            {
                Label files_t = (Label)g2.Rows[i].FindControl("files_t");
                Label homework_t = (Label)g2.Rows[i].FindControl("homework_t");
                Label Announcements_t = (Label)g2.Rows[i].FindControl("Announcements_t");
                Label link_t = (Label)g2.Rows[i].FindControl("link_t");
                Label vedio_t = (Label)g2.Rows[i].FindControl("vedio_t");
                Label vedio_t1 = (Label)g2.Rows[i].FindControl("vedio_t1");
                Label dis_t = (Label)g2.Rows[i].FindControl("dis_t");
                Label total = (Label)g2.Rows[i].FindControl("total_t");

                try
                {
                    tt = Convert.ToInt32(files_t.Text) + Convert.ToInt32(homework_t.Text) + Convert.ToInt32(Announcements_t.Text) + Convert.ToInt32(link_t.Text) + Convert.ToInt32(vedio_t.Text) + Convert.ToInt32(vedio_t1.Text) + Convert.ToInt32(dis_t.Text);
                }
                catch
                {
                    tt = 0;
                }
                total.Text = tt.ToString();
            }
        }
       


    }
    protected void g2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "courseCode") != null)
        {

            string crs_id = DataBinder.Eval(e.Row.DataItem, "courseCode").ToString();
            string departmentArName = DataBinder.Eval(e.Row.DataItem, "departmentArName").ToString();
            string sectionNum = DataBinder.Eval(e.Row.DataItem, "sectionNum").ToString();
            //    Label files_t = (Label)e.Row.FindControl("files_t");
            //    Label homework_t = (Label)e.Row.FindControl("homework_t");
            //    Label Announcements_t = (Label)e.Row.FindControl("Announcements_t");
            //    Label link_t = (Label)e.Row.FindControl("link_t");
            //    Label vedio_t = (Label)e.Row.FindControl("vedio_t");
            //    Label dis_t = (Label)e.Row.FindControl("dis_t");
                Label sec = (Label)e.Row.FindControl("sec");
            Label viwe = (Label)e.Row.FindControl("viwe");

            if (departmentArName != dept.SelectedItem.Text)

                e.Row.Visible = false;

            //        //Label branch = (Label)e.Row.FindControl("branch");
            //        //if (branch.Text == "1")
            //        //    branch.Text = "الزهراء";
            //        //else
            //        //    branch.Text = "يافا";
            DataTable f = r.std_cours(crs_id, sectionNum);
            sec.Text = f.Rows.Count.ToString();

            //    SqlDataAdapter DA = new SqlDataAdapter("select count(distinct path) from e_files where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum, conn);

            //    DataTable DT = new DataTable();
            //    DA.Fill(DT);
            //    try
            //    {
            //        files_t.Text = DT.Rows[0][0].ToString();
            //    }
            //    catch
            //    { }



            //    //SqlDataAdapter DA1 = new SqlDataAdapter("select count(*) from e_HomeWork  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            //    SqlDataAdapter DA1 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_HomeWork where   sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            //    DataTable DT1 = new DataTable();
            //    DA1.Fill(DT1);
            //    try
            //    {
            //        homework_t.Text = DT1.Rows[0][0].ToString();
            //    }
            //    catch
            //    { }

            //    //SqlDataAdapter DA2 = new SqlDataAdapter("select count(*) from e_Announcements  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            //    SqlDataAdapter DA2 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_Announcements where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            //    DataTable DT2 = new DataTable();
            //    DA2.Fill(DT2);
            //    try
            //    {
            //        Announcements_t.Text = DT2.Rows[0][0].ToString();

            //    }
            //    catch
            //    { }

            //    //SqlDataAdapter DA3 = new SqlDataAdapter("select count(*) from e_links  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            //    SqlDataAdapter DA3 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct title FROM e_links where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            //    DataTable DT3 = new DataTable();
            //    DA3.Fill(DT3);
            //    try
            //    {
            //        link_t.Text = DT3.Rows[0][0].ToString();
            //    }
            //    catch
            //    { }

            //    //SqlDataAdapter DA4 = new SqlDataAdapter("select count(*) from e_vids  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            //    SqlDataAdapter DA4 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct link FROM e_vids where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            //    DataTable DT4 = new DataTable();
            //    DA4.Fill(DT4);
            //    try
            //    {
            //        vedio_t.Text = DT4.Rows[0][0].ToString();

            //    }
            //    catch
            //    {

            //    }
            //    //SqlDataAdapter DA5 = new SqlDataAdapter("select count(*) from e_dialog  where crs_id='" + crs_id + "' and section=" + sectionNum, conn);
            //    SqlDataAdapter DA5 = new SqlDataAdapter("SELECT COUNT(*) AS RowCounter FROM (SELECT  distinct crs_id,week_id,lec FROM e_dialog where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section=" + sectionNum + ") AS Q1", conn);
            //    DataTable DT5 = new DataTable();
            //    DA5.Fill(DT5);
            //    try
            //    {
            //        dis_t.Text = DT5.Rows[0][0].ToString();

            //    }
            //    catch
            //    {

            //    }
            SqlDataAdapter DA15 = new SqlDataAdapter("select std_id from seen where typ='fil' and re_id in(select id from e_files where  sem = (select top 1 semester_id from e_semester) and crs_id='" + crs_id + "' and section ='" + sectionNum + "') union select std_id from seen where typ = 'vid' and re_id in(select id from e_vids where crs_id='" + crs_id + "' and section ='" + sectionNum + "') union select std_id from seen where typ = 'dia' and re_id in(select id from e_dialog where crs_id='" + crs_id + "' and section ='" + sectionNum + "') union select std_id from seen where typ = 'lin' and re_id in(select id from e_links where crs_id='" + crs_id + "' and section ='" + sectionNum + "') union select std_id from seen where typ = 'ann' and re_id in(select id from e_Announcements where crs_id = '" + crs_id + "' and section = '" + sectionNum + "')", conn);
            DataTable DT15 = new DataTable();
            DA15.Fill(DT15);



            viwe.Text = DT15.Rows.Count.ToString();
        }

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
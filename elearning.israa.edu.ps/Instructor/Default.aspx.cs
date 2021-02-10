
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Instructor_Crs : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["log"] == null)
            Response.Redirect("../Login.aspx");
        mood.Src = "~/moodle/loginMoodle.aspx?user="+Session["log"]+"&pass="+ Session["pass"];
        DataTable dt = r.lec_COURS(Session["log"].ToString(),"21");
        r.reg_del(Session["log"].ToString());
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            r.reg_add(Session["log"].ToString(), dt.Rows[i]["courseCode"].ToString(), dt.Rows[i]["courseArName"].ToString(), dt.Rows[i]["sectionNum"].ToString(), "-1");
        }
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "day") != null)
        {


            string dayy = DataBinder.Eval(e.Row.DataItem, "day").ToString();
            HyperLink HyperLink8 = (HyperLink)e.Row.FindControl("HyperLink8");
            string today = DateTime.Today.DayOfWeek.ToString();
            string today_ar = DateTime.Today.DayOfWeek.ToString();
            switch (today)
            {
                case "Saturday":
                    today_ar = "السبت";
                    break;
                case "Sunday":
                    today_ar = "الاحد";
                    break;
                case "Monday":
                    today_ar = "الاثنين";
                    break;
                case "Tuesday":
                    today_ar = "الثلاثاء";
                    break;
                case "Wednesday":
                    today_ar = "الأربعاء";
                    break;
                case "Thursday":
                    today_ar = "الخميس";
                    break;
                case "Friday":
                    today_ar = "الجمعة";
                    break;
            }
            if (today_ar == dayy)
            {
                HyperLink8.CssClass = "bg-success";
                e.Row.Cells[GridView1.Columns.Count-1].BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
            }
            else

                e.Row.Cells[GridView1.Columns.Count - 1].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");
        }

        if (DataBinder.Eval(e.Row.DataItem, "sectionid") != null)
        {
            Label lec = (Label)e.Row.FindControl("lec");
            DataTable dtt = r.GetSectionDetails(DataBinder.Eval(e.Row.DataItem, "sectionid").ToString());
            if (dtt.Rows.Count != 0)

                lec.Text = dtt.Rows[0]["instructor"].ToString();
            else
                lec.Text = "لا يوجد";
        }
        if (DataBinder.Eval(e.Row.DataItem, "courseCode") != null)
        {
            string crs_id = DataBinder.Eval(e.Row.DataItem, "courseCode").ToString();
            string sectionnum = DataBinder.Eval(e.Row.DataItem, "section").ToString();
            string crs_name = DataBinder.Eval(e.Row.DataItem, "crs_name").ToString().Trim();


            if (crs_name.Contains("شعب"))
            {

                string section_zoom = crs_name.Substring(crs_name.Length - 3);
                if (section_zoom != sectionnum)
                    e.Row.Visible = false;
            }

        }
    }
}
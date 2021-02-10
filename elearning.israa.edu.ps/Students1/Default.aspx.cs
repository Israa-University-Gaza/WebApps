
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    eLern r = new  eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)

            Response.Redirect("../Login.aspx");
        if (Session["id"] == null)
            Response.Redirect("../Login.aspx");
        f_name.Text = Session["name"].ToString().Split(' ')[0];
        GridView1.DataBind();
        GridView2.DataBind();
        DataTable dt1 = r.std_data(Session["id"].ToString());
        coll.Text = dt1.Rows[0]["college"].ToString();
        dept.Text = dt1.Rows[0]["department"].ToString(); 
      // gpa.Text = dt1.Rows[0]["gpauniversity"].ToString(); 
        prod.Text = dt1.Rows[0]["program"].ToString();

        DataTable dt = r.STD_COURS(Session["log"].ToString());
        //Response.Write(dt.Rows[0][0]);
        Repeater.DataSource = dt;
        Repeater.DataBind();
        mood.Src = "~/moodle/loginMoodle.aspx?user=" + Session["log"] + "&pass=" + Session["pass"];

    }


    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label Label1 = (Label)e.Item.FindControl("Label1");
        HyperLink HyperLink5 = (HyperLink)e.Item.FindControl("HyperLink5");
        DataTable dt1 = r.GetSectionDetails(DataBinder.Eval(e.Item.DataItem, "sectionId").ToString());
        if(dt1.Rows.Count==0)
        {
            Label1.Text = "";
            HyperLink5.Enabled = false;
        }
        else
        {
 HyperLink5.NavigateUrl = "javascript:openDetailsWindow2(\"" + dt1.Rows[0]["employeeNo"].ToString() + "\")";
        //Label1.Text = r.lec_name(r.get_lec(DataBinder.Eval(e.Item.DataItem, "courseCode").ToString(), DataBinder.Eval(e.Item.DataItem, "sectionNum").ToString()));
        Label1.Text = dt1.Rows[0]["instructor"].ToString();
        }
       
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
                e.Row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
            }
            else

                e.Row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");
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
            string sectionnum = DataBinder.Eval(e.Row.DataItem, "sectionnum").ToString();
            string crs_name = DataBinder.Eval(e.Row.DataItem, "crs_name").ToString().Trim(); ;

            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNID1212" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNID1212" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;

            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Row.Visible = false;
            if (crs_name.Contains("شعب"))
            {

                string section_zoom = crs_name.Substring(crs_name.Length - 3);
                if (section_zoom != sectionnum)
                    e.Row.Visible = false;
            }

        }
    }
}


   

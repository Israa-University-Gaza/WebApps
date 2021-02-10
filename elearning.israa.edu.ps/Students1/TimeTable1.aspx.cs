using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class Students_TimeTable : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //    {
    //        if (DataBinder.Eval(e.Row.DataItem, "day") != null)
    //        {


    //            string dayy = DataBinder.Eval(e.Row.DataItem, "day").ToString();
    //            HyperLink HyperLink8 = (HyperLink)e.Row.FindControl("HyperLink8");
    //            string today = DateTime.Today.DayOfWeek.ToString();
    //            string today_ar = DateTime.Today.DayOfWeek.ToString();
    //            switch (today)
    //            {
    //                case "Saturday":
    //                    today_ar = "السبت";
    //                    break;
    //                case "Sunday":
    //                    today_ar = "الاحد";
    //                    break;
    //                case "Monday":
    //                    today_ar = "الاثنين";
    //                    break;
    //                case "Tuesday":
    //                    today_ar = "الثلاثاء";
    //                    break;
    //                case "Wednesday":
    //                    today_ar = "الأربعاء";
    //                    break;
    //                case "Thursday":
    //                    today_ar = "الخميس";
    //                    break;
    //                case "Friday":
    //                    today_ar = "الجمعة";
    //                    break;
    //            }
    //            if (today_ar == dayy)
    //            {
    //HyperLink8.CssClass = "bg-success";
    //                e.Row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
    //            }
    //            else

    //                e.Row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

    //        }

    //        if (DataBinder.Eval(e.Row.DataItem, "sectionid") != null)
    //        {
    //            Label lec = (Label)e.Row.FindControl("lec");
    //            DataTable dtt = r.GetSectionDetails(DataBinder.Eval(e.Row.DataItem, "sectionid").ToString());
    //            if (dtt.Rows.Count != 0)

    //                lec.Text = dtt.Rows[0]["instructor"].ToString();
    //            else
    //                lec.Text = "لا يوجد";
    //        }
    //        if (DataBinder.Eval(e.Row.DataItem, "courseCode") != null)
    //        {
    //            string crs_id = DataBinder.Eval(e.Row.DataItem, "courseCode").ToString();
    //            string sectionnum = DataBinder.Eval(e.Row.DataItem, "sectionnum").ToString();
    //            string crs_name = DataBinder.Eval(e.Row.DataItem, "crs_name").ToString().Trim(); ;
    //            if (crs_name.Contains("شعب"))
    //            {

    //                string section_zoom = crs_name.Substring(crs_name.Length - 3);
    //                if (section_zoom != sectionnum)
    //                    e.Row.Visible = false;
    //            }

    //            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNID1212" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNID1212" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
    //            //    e.Row.Visible = false;

    //        }
    //    }




    protected void Unnamed_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (DataBinder.Eval(e.Item.DataItem, "day") != null)
        {


            string dayy = DataBinder.Eval(e.Item.DataItem, "day").ToString();
            HyperLink HyperLink8 = (HyperLink)e.Item.FindControl("HyperLink8");
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
            //if (today_ar == dayy)
            //{
            //    HyperLink8.CssClass = "bg-success";
            //    e.Item.BackColor = System.Drawing.ColorTranslator.FromHtml("#dff0d8");
            //}
            //else

            //    e.Item.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

        }

        if (DataBinder.Eval(e.Item.DataItem, "sectionid") != null)
        {
            Label lec = (Label)e.Item.FindControl("lec");
            DataTable dtt = r.GetSectionDetails(DataBinder.Eval(e.Item.DataItem, "sectionid").ToString());
            if (dtt.Rows.Count != 0)

                lec.Text = dtt.Rows[0]["instructor"].ToString();
            else
                lec.Text = "لا يوجد";
        }
        if (DataBinder.Eval(e.Item.DataItem, "courseCode") != null)
        {
            string crs_id = DataBinder.Eval(e.Item.DataItem, "courseCode").ToString();
            string sectionnum = DataBinder.Eval(e.Item.DataItem, "sectionnum").ToString();
            string crs_name = DataBinder.Eval(e.Item.DataItem, "crs_name").ToString().Trim(); ;
            if (crs_name.Contains("شعب"))
            {

                string section_zoom = crs_name.Substring(crs_name.Length - 3);
                if (section_zoom != sectionnum)
                    e.Item.Visible = false;
            }

            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNID1212" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("10") && crs_name.Contains("طالبات"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV1211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV1213" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV4111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV3111" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNID1212" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV2211" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

            //if (crs_id == "UNIV3112" && sectionnum.StartsWith("20") && crs_name.Contains("طلاب"))
            //    e.Item.Visible = false;

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Students_TimeTable : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    




    protected void Unnamed_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (DataBinder.Eval(e.Item.DataItem, "day") != null)
        {


            string dayy = DataBinder.Eval(e.Item.DataItem, "day").ToString();
            HyperLink HyperLink8 = (HyperLink)e.Item.FindControl("HyperLink8");
            string today = DateTime.Today.DayOfWeek.ToString();
            string today_ar = DateTime.Today.DayOfWeek.ToString();
            HtmlGenericControl day1 = (HtmlGenericControl) e.Item.FindControl("day1");
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
                day1.Style.Add("background-color", "#dff0d8");
                day1.Style.Add("color", "#0c7322");
            }
            else
                HyperLink8.Visible = false;



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

         

        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Crs_stat : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "-1")
        {
gv.DataSourceID = "SqlDataSource1";
            gv.DataBind();
        }
            
        else
            gv.DataSourceID = "SqlDataSource3";
    }

    protected void Unnamed1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label files = (Label)e.Row.FindControl("files");

        Label Anno = (Label)e.Row.FindControl("Anno");
        Label dialog = (Label)e.Row.FindControl("dialog");
        Label hw = (Label)e.Row.FindControl("hw");
        Label links = (Label)e.Row.FindControl("links");
        Label vi = (Label)e.Row.FindControl("vi");
        Label ve = (Label)e.Row.FindControl("ve");
        Label tot = (Label)e.Row.FindControl("tot");
        Label lec = (Label)e.Row.FindControl("lec");
Label std_count = (Label)e.Row.FindControl("std_count");
        HyperLink HyperLink2 = (HyperLink)e.Row.FindControl("HyperLink2");

        if (e.Row.FindControl("files")!=null)
        if(files.Text=="0")
            e.Row.Cells[5].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

        if (e.Row.FindControl("Anno") != null)
            if (Anno.Text == "0")
                e.Row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

        if (e.Row.FindControl("dialog") != null)
            if (dialog.Text == "0")
                e.Row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

                     if (e.Row.FindControl("hw") != null)
            if (hw.Text == "0")
                e.Row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");


        if (e.Row.FindControl("links") != null)
            if (links.Text == "0")
                e.Row.Cells[9].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

        if (e.Row.FindControl("vi") != null)
            if (vi.Text == "0")
                e.Row.Cells[10].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");


        if (e.Row.FindControl("ve") != null)
            if (ve.Text == "0")
                e.Row.Cells[11].BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");

        if (e.Row.FindControl("tot") != null)
            if (tot.Text == "0")
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#f2dede");
        if (e.Row.FindControl("lec") != null)
        {


            SqlDataAdapter DA1 = new SqlDataAdapter("SELECT top 1  sectionid,sectionnum FROM  std_crs where coursecode='" + DataBinder.Eval(e.Row.DataItem, "رقم_المساق") + "'", conn);
         
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            try
            {
  HyperLink2.NavigateUrl = "Crs.aspx?crs=" + DataBinder.Eval(e.Row.DataItem, "رقم_المساق") + "&section=" + DT1.Rows[0][1].ToString();
            }
          catch
            {

            }
            if (DT1.Rows.Count!=0)
            {

                DataTable dt12 = r.GetSectionDetails(DT1.Rows[0][0].ToString());
                if (dt12.Rows.Count > 0)
                    lec.Text = dt12.Rows[0]["instructor"].ToString();
                else
                    lec.Text = "";


                DataTable dt1e = r.std_cours(DataBinder.Eval(e.Row.DataItem, "رقم_المساق").ToString(), DT1.Rows[0][1].ToString());
                std_count.Text = dt1e.Rows.Count.ToString();
            }
        }


    }


    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if(Session["log"].ToString()=="109" || Session["log"].ToString()== "225" || Session["log"].ToString()== "215")
        DropDownList1.Items.Insert(0, new ListItem("الكل", "-1"));
    }
}

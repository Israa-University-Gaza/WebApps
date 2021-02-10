using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Announcements : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        if (!IsPostBack)
        {
            Done.Visible = false;

            SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            DataTable dt = r.lec_COURS(Session["log"].ToString(), DT1.Rows[0][0].ToString());
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "courseCode+sectionNum";
            DropDownList2.DataTextField = "courseArName+sectionNum";
            DropDownList2.DataBind();
            if (Request.QueryString["week"] != null)
            {
                DropDownList1.SelectedValue = Request.QueryString["week"];
                DropDownList1.Enabled = false;
            }
            if (Request.QueryString["crs"] != null)
            {
                DropDownList2.SelectedValue = Request.QueryString["crs"] + " شعبة ." + Request.QueryString["section"];
                DropDownList2.Enabled = false;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (CheckBox1.Checked)
        {

            DataTable dt_sec = new DataTable();
            dt_sec = r.lec_section(Session["log"].ToString(), DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0]);
            for (int i = 0; i < dt_sec.Rows.Count; i++)
            {

                r.e_vids_add(tit.Text, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList1.SelectedValue, link.Text, dt_sec.Rows[i][1].ToString(), CheckBox1.Checked, Session["log"].ToString(),DropDownList3.SelectedValue);
                vids.Visible = false;
                Done.Visible = true;
            }

        }
        else
        {
 r.e_vids_add(tit.Text, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList1.SelectedValue, link.Text, DropDownList2.SelectedValue.ToString().Split('.')[1], CheckBox1.Checked, Session["log"].ToString(), DropDownList3.SelectedValue);
            vids.Visible = false;
            Done.Visible = true;

        }
           


        //  r.e_links_add(tit.Text, DropDownList2.SelectedValue, DropDownList1.SelectedValue, links.Text, DropDownList2.SelectedItem.Text.ToString().Split('.')[1], CheckBox1.Checked, Session["log"].ToString());
       // Response.Redirect("Crs.aspx?crs=" + DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0] + "&section=" + DropDownList2.SelectedValue.ToString().Split('.')[1]);


        


    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
       // DropDownList2.Items.Insert(0, new ListItem("اختر", "-1"));
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
       // DropDownList1.Items.Insert(0, new ListItem("اختر", "-1"));
    }
}
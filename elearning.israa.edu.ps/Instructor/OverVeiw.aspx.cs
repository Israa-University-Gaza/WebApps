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

 SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            DataTable dt = r.lec_COURS(Session["log"].ToString(), DT1.Rows[0][0].ToString());
            


            
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "courseCode";
            DropDownList2.DataTextField = "courseArName";
            DropDownList2.DataBind();

            if (Request.QueryString["crs"] != null)
            {
                DropDownList2.SelectedValue = Request.QueryString["crs"];
                DropDownList2.Enabled = false;
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        r.add_OverVeiw(DropDownList2.SelectedValue, Editor2.Text);
        Response.Redirect("crs.aspx?crs="+Request.QueryString["crs"]+ "&section="+Request.QueryString["section"]);


    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("اختر", "-1"));
    }


    protected void DropDownList2_TextChanged(object sender, EventArgs e)
    {
        DataTable dt1 = r.e_crs_OverVeiw_get(DropDownList2.SelectedValue);
        if (dt1.Rows.Count > 0)
            Editor2.Text = dt1.Rows[0]["det"].ToString();
        else
            Editor2.Text = "";
    }
}

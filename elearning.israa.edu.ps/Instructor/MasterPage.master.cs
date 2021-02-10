using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        else
        {
            if (Session["role"].ToString() != "1")
                Response.Redirect("../Logout.aspx");
            Label1.Text = Session["name"].ToString();
        }
        SqlDataAdapter DA = new SqlDataAdapter("SELECT       COUNT(id) FROM            masseges where to_id='"+Session["log"]+"' and seen=0 and isdelet=0 ", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows[0][0].ToString() == "0")
            new_act.Visible = false;
        else
            new_act.Text = DT.Rows[0][0].ToString();

        Label2.Text = Session["last_log"].ToString();
        SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
        DataTable DT1 = new DataTable();
        DA1.Fill(DT1);

        string sem;
        if (Request.QueryString["sem"] == "" || Request.QueryString["sem"] ==null )
            sem = DT1.Rows[0][0].ToString();
        else
            sem = Request.QueryString["sem"];
        DataTable dt = r.lec_COURS(Session["log"].ToString(), sem);
        //Response.Write(dt.Rows[0][0]);
        Repeater.DataSource = dt;
        Repeater.DataBind();
        if (Session["admin"] != null)
        {
admin.Visible = true;
            admin1.Visible = true;
            admin2.Visible = true;
            admin4.Visible = true;
            if (Session["log"].ToString() == "109" || Session["log"].ToString() == "225")
                admin3.Visible = true;
            else
                admin3.Visible = false;
        }
            
        else
        {
            admin.Visible = false;
            admin1.Visible = false;
            admin2.Visible = false;
            admin4.Visible = false;
admin3.Visible = false;
        }
           
    }
}

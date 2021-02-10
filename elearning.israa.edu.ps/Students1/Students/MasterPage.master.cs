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
            if (Session["role"].ToString() != "2")
                Response.Redirect("../Logout.aspx");
            Label1.Text = Session["name"].ToString();
        }

        try
        {
     Label2.Text = Session["last_log"].ToString();
        }
        catch
        {
            Label2.Text = "";

        }
   
        DataTable dt = r.STD_COURS(Session["log"].ToString());
     
        Repeater.DataSource = dt;
        Repeater.DataBind();

        DataTable dt1 = r.std_data(Session["id"].ToString());
      

        Image1.ImageUrl = "data:image/png;base64," + dt1.Rows[0]["studentImage"].ToString();

        SqlDataAdapter DA = new SqlDataAdapter("  SELECT  count(id) FROM    Messege_Replays  where seen=0  and m_id in ( select id from   masseges where sender_id="+ Session["log"] + " and isdelet=0)", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows[0][0].ToString() == "0")
            new_act.Visible = false;
        else
            new_act.Text = DT.Rows[0][0].ToString();

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label new_act = (Label)e.Item.FindControl("new_act");
        string courseCode = DataBinder.Eval(e.Item.DataItem, "courseCode").ToString();
        string sectionNum = DataBinder.Eval(e.Item.DataItem, "sectionNum").ToString();
        try
        {

       
            SqlDataAdapter DA = new SqlDataAdapter("select dbo.e_files_get_new1('"+courseCode+"',CONVERT(datetime, '" + Session["last_log"] + "'),'"+sectionNum+"') from test2", conn);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows[0][0].ToString() == "0")
                new_act.Visible = false;
            else
                new_act.Text = DT.Rows[0][0].ToString();
        }
        catch
        {

        }


    }
}

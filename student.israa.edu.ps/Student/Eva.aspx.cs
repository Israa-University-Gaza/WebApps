using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Students_Eva : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select std_id from Eva_answer where std_id='"+ Session["log"] + "'", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            delv.Visible = true;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView2.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView3.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView3.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView4.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView4.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView5.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView5.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView6.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView6.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            for (int i = 0; i < GridView7.Rows.Count; i++)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)GridView7.Rows[i].FindControl("RadioButtonList1");
                RadioButtonList1.Enabled = false;
            }
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            Button1.Enabled = false;
        }
        else
            delv.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlDataAdapter da = new SqlDataAdapter("select std_id from Eva_answer where std_id='" + Session["log"] + "'", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("Eva.aspx");
        }


            for (int i=0;i<GridView1.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
            Label Label1=(Label)GridView1.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','"+Label1.Text+"','"+RadioButtonList1.SelectedValue+"')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView2.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView2.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView3.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView3.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView3.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView4.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView4.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView4.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView5.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView5.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView5.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView6.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView6.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView6.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        for (int i = 0; i < GridView7.Rows.Count; i++)
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView7.Rows[i].FindControl("RadioButtonList1");
            Label Label1 = (Label)GridView7.Rows[i].FindControl("Label1");
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("insert into Eva_answer( std_id,qes_id,ans) VALUES ('" + Session["log"] + "','" + Label1.Text + "','" + RadioButtonList1.SelectedValue + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

      
        SqlCommand cmd1 = new SqlCommand();
        cmd1 = new SqlCommand("insert into Eva_answer1(std_id,ans) VALUES ('" + Session["log"] + "',N'" + TextBox1.Text + "')", conn);
        conn.Open();
        cmd1.ExecuteNonQuery();
        conn.Close();

        SqlCommand cmd11 = new SqlCommand();
        cmd11 = new SqlCommand("insert into Eva_answer1(std_id,ans) VALUES ('" + Session["log"] + "',N'" + TextBox2.Text + "')", conn);
        conn.Open();
        cmd11.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Default.aspx");
    }
}
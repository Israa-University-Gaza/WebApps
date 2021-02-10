using System;
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

public partial class Instructor_VoteResult : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select count( distinct std_id) from Eva_answer", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        all.Text = dt.Rows[0][0].ToString();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(DataBinder.Eval(e.Row.DataItem, "id")!=null)
        {

       
        Label a1 = (Label)e.Row.FindControl("a1");
        Label a2 = (Label)e.Row.FindControl("a2");
        Label a3 = (Label)e.Row.FindControl("a3");
        Label a4 = (Label)e.Row.FindControl("a4");
        Label a5 = (Label)e.Row.FindControl("a5");
        string id = DataBinder.Eval(e.Row.DataItem, "id").ToString();
        SqlDataAdapter da = new SqlDataAdapter("select count(ans) total,ans,qes_id  from [dbo].[Eva_answer] where qes_id = "+id+" group by qes_id, ans order by qes_id, ans", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
            decimal all =Convert.ToDecimal(Convert.ToDecimal(dt.Rows[0][0]) + Convert.ToDecimal(dt.Rows[1][0]) + Convert.ToDecimal(dt.Rows[2][0]) + Convert.ToDecimal(dt.Rows[3][0]) + Convert.ToDecimal(dt.Rows[4][0]));
            decimal a11 =Convert.ToDecimal(dt.Rows[0][0])/all;
            decimal a12= Convert.ToDecimal(dt.Rows[1][0]) / all;
            decimal a13 =Convert.ToDecimal(dt.Rows[2][0]) / all;
            decimal a14 =Convert.ToDecimal(dt.Rows[3][0]) / all;
            decimal a15 =Convert.ToDecimal(dt.Rows[4][0]) / all;

            a1.Text = dt.Rows[0][0].ToString()+" بنسبة "+a11.ToString("0.00%");
            a2.Text = dt.Rows[1][0].ToString() + " بنسبة " + a12.ToString("0.00%");
            a3.Text = dt.Rows[2][0].ToString() + " بنسبة " + a13.ToString("0.00%");
            a4.Text = dt.Rows[3][0].ToString() + " بنسبة " + a14.ToString("0.00%");
            a5.Text = dt.Rows[4][0].ToString() + " بنسبة " + a15.ToString("0.00%");
        }

    }
}
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

public partial class Instructor_vote : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "ans") != null)
        {
            Label Label1 = (Label)e.Row.FindControl("Label1");
            Label Label3 = (Label)e.Row.FindControl("Label3");
            string ans = DataBinder.Eval(e.Row.DataItem, "ans").ToString();
            if (ans == "1")
                Label1.Text = "موافق بشدة:";
            if (ans == "2")
                Label1.Text = " موافق:";
            if (ans == "3")
                Label1.Text = " محايد:";
            if (ans == "4")
                Label1.Text = " غير موافق:";
            if (ans == "5")
                Label1.Text = "  غير موافق بشدة:";


            SqlDataAdapter da = new SqlDataAdapter("select count( distinct std_id) from Eva_answer", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            decimal all =   Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "total"))/ Convert.ToDecimal(dt.Rows[0][0]) ;
            Label3.Text= all.ToString("0.00%");
        }

    }
}
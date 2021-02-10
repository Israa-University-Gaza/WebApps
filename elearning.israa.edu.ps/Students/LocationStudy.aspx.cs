using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class Students_LocationStudy : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            {
            std.Visible = true;
            Done.Visible = false;
        }
    }

    protected void btm_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [std_location]VALUES(@std_id,@location,@EnterDate)", conn);
        cmd.Parameters.AddWithValue("@std_id", Session["log"]);
        cmd.Parameters.AddWithValue("@location",dROP.SelectedValue);
        cmd.Parameters.AddWithValue("@EnterDate", DateTime.Now);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        std.Visible = false;
        Done.Visible = true;


    }
}
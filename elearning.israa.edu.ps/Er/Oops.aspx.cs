using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Er_Default : System.Web.UI.Page
{
   // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aspxerrorpath"] != null)
        {
          //  SqlCommand cmd = new SqlCommand("e_Errors_add", conn);
         
               //  if (Session["log"] != null)
               // cmd.Parameters.AddWithValue("@emp_id","admin"+Session["log"].ToString());
          //  else
              //  cmd.Parameters.AddWithValue("@emp_id", "DNE");

          //  cmd.Parameters.AddWithValue("@path", Request.QueryString["aspxerrorpath"]);
          //  cmd.CommandType = CommandType.StoredProcedure;
           // conn.Open();
           // cmd.ExecuteNonQuery();
           // conn.Close();
        }
    }
}
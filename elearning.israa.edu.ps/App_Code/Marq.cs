using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Marq
/// </summary>
public class Marq
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"] + "");
    public Marq()
    {
        //
        // TODO: Add constructor logic here
        //
    }

 
    public void EnJAZ_add_EnJAZ_Workshop(int emp_id,string title,string place,string dt,string emp_name,string typ,string notes,string coll)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_Workshop", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@place", place));
        cmd.Parameters.Add(new SqlParameter("@dt", dt));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.Parameters.Add(new SqlParameter("@notes", notes));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_Researches(int emp_id, string title, string publisher, string place,string conf_name, string conf_place, string conf_org,string jor_name,string jor_ver, string jor_url,string ipf,string emp_name,string note,string coll,string j_typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_Researches", conn);

        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@publisher", publisher));
        cmd.Parameters.Add(new SqlParameter("@place", place));

        cmd.Parameters.Add(new SqlParameter("@conf_name", conf_name));
        cmd.Parameters.Add(new SqlParameter("@conf_place", conf_place));
        cmd.Parameters.Add(new SqlParameter("@conf_org", conf_org));

        cmd.Parameters.Add(new SqlParameter("@jor_name", jor_name));
        cmd.Parameters.Add(new SqlParameter("@jor_ver", jor_ver));
        cmd.Parameters.Add(new SqlParameter("@jor_url", jor_url));
        cmd.Parameters.Add(new SqlParameter("@ipf", ipf));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.Parameters.Add(new SqlParameter("@j_typ", j_typ));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_Projects(int emp_id, string title, string note,string emp_name,string mom,string y,string coll,string budget)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_Projects", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@mom", mom));
        cmd.Parameters.Add(new SqlParameter("@y", y));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.Parameters.Add(new SqlParameter("@budget", budget));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_Books(int emp_id, string title, string note,string emp_name,string pub,string y,string coll)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_books", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@pub", pub));
        cmd.Parameters.Add(new SqlParameter("@y", y));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_conf(int emp_id, string title,string dt,string place,string typ, string note,string emp_name,string typ1,string coll)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_conf", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@dt", dt));
        cmd.Parameters.Add(new SqlParameter("@place", place));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@typ1", typ1));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_act(int emp_id, string title, string dt, string place, string note,string emp_name,string coll)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_act", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@dt", dt));
        cmd.Parameters.Add(new SqlParameter("@place", place));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void EnJAZ_add_EnJAZ_vids(int emp_id, string title, string url, string note,string emp_name,string coll)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_add_EnJAZ_vids", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
  
        cmd.Parameters.Add(new SqlParameter("@url", url));
        cmd.Parameters.Add(new SqlParameter("@note", note));
        cmd.Parameters.Add(new SqlParameter("@emp_name", emp_name));
        cmd.Parameters.Add(new SqlParameter("@coll", coll));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public DataTable EnJAZ_GetAll_EnJAZ_act_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_act_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_Get_Score (string emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_Get_Score", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_books_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_books_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_conf_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_conf_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_Projects_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_Projects_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_Researches_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_Researches_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_Workshop_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_Workshop_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_ads_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_ads_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable EnJAZ_GetAll_EnJAZ_vids_byID(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("EnJAZ_GetAll_EnJAZ_vids_byID", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public void Approv_Dept(int id,string typ,Boolean flag)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_Approv_dept", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.Parameters.Add(new SqlParameter("@flag", flag));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void Approv_Affairs(int id, string typ,Boolean flag)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("EnJAZ_Approv_Affairs", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.Parameters.Add(new SqlParameter("@flag", flag));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}
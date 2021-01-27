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
using System.Net.Mail;
using System.Net;
using System.IO;

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

   
    public void add_Future(int emp_id, string Future)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_add_update_Future", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@Future", Future);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void add_img(int emp_id, Byte[] img,string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_img_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@img", img);
        cmd.Parameters.AddWithValue("@typ", typ);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public  string maj_get(int id)
    {

        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("maj_get", conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt.Rows[0][0].ToString();


    }
    public string hr_jobs_emp_count(string id)
    {

        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_jobs_emp_count", conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt.Rows[0][0].ToString();


    }

    public string hr_emp_job_name (int id)
    {

        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_job_name", conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt.Rows[0][0].ToString();


    }


    public string hr_emp_users_COUNT()
    { 
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_users_COUNT", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt.Rows[0][0].ToString();


    }
    public void add_cv(int emp_id, Byte[] cv)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_cv_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@cv", cv);
       
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_jobs_add(int emp_id, int job)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_jobs_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@job", job);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_jobs_emp_delete(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_jobs_emp_delete", conn);
        cmd.Parameters.AddWithValue("@id",id);
        

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    public DataTable get_Future(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_add_update_Future_get", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }

    public DataTable hr_emp_jobs_exist(int emp_id,int job)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_jobs_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@job", job);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }


    public DataTable hr_add_emp_get(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_add_emp_get", conn);
        cmd.Parameters.AddWithValue("@id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }

    
    public void hr_add_update_emp(int id, string n1, string n2, string n3, string n4,string dop,string age,string n_id,string p_id,string addres,string stat,string tel,string email,string nat,string nat1,string pob, string rel, string n_has, string w_has, string d_mar, string h_stat, string w_c_type, string w_c_place, string w_c_date, string w_leav,string d_leave,string gender)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_add_update_emp", conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@n1", n1);
        cmd.Parameters.AddWithValue("@n2", n2);
        cmd.Parameters.AddWithValue("@n3", n3);
        cmd.Parameters.AddWithValue("@n4", n4);
        cmd.Parameters.AddWithValue("@dop", dop);
        cmd.Parameters.AddWithValue("@age",age);
        cmd.Parameters.AddWithValue("@n_id", n_id);
        cmd.Parameters.AddWithValue("@p_id", p_id);
        cmd.Parameters.AddWithValue("@addres", addres);
        cmd.Parameters.AddWithValue("@stat", stat);
        cmd.Parameters.AddWithValue("@tel", tel);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@nat", nat);
        cmd.Parameters.AddWithValue("@nat1", nat1);
        cmd.Parameters.AddWithValue("@pob", pob);

        cmd.Parameters.AddWithValue("@rel", rel);
        cmd.Parameters.AddWithValue("@n_has", n_has);
        cmd.Parameters.AddWithValue("@w_has", w_has);
        cmd.Parameters.AddWithValue("@d_mar", d_mar);
        cmd.Parameters.AddWithValue("@h_stat", h_stat);
        cmd.Parameters.AddWithValue("@w_c_type", w_c_type);
        cmd.Parameters.AddWithValue("@w_c_place", w_c_place);
        cmd.Parameters.AddWithValue("@w_c_date", w_c_date);
        cmd.Parameters.AddWithValue("@w_leav", w_leav);
        cmd.Parameters.AddWithValue("@d_leave", d_leave);
        cmd.Parameters.AddWithValue("@gender", gender);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        
    }

    public void hr_emp_cer(int emp_id, string uni, string place,string from,string to,string degree,string date_degree,string gpa ,string cer)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_cer_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@uni", uni);
        cmd.Parameters.AddWithValue("@place", place);
        cmd.Parameters.AddWithValue("@from", from);
        cmd.Parameters.AddWithValue("@to", to);
        cmd.Parameters.AddWithValue("@degree", degree);
        cmd.Parameters.AddWithValue("@date_degree", date_degree);
        cmd.Parameters.AddWithValue("@gpa", gpa);
        cmd.Parameters.AddWithValue("@cer", cer);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_lang_add(int emp_id, string lan_name, string lan_conversation, string lan_write, string lan_read, string lan_notes)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_lang_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@lan_name", lan_name);
        cmd.Parameters.AddWithValue("@lan_conversation", lan_conversation);
        cmd.Parameters.AddWithValue("@lan_write", lan_write);
        cmd.Parameters.AddWithValue("@lan_read", lan_read);
        cmd.Parameters.AddWithValue("@lan_notes", lan_notes);
       
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_exp_add(int emp_id,  string exp_name , string exp_addr , string exp_from , string exp_to , string exp_type )
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_exp_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@exp_name", exp_name);
        cmd.Parameters.AddWithValue("@exp_addr", exp_addr);
        cmd.Parameters.AddWithValue("@exp_from", exp_from);
        cmd.Parameters.AddWithValue("@exp_to", exp_to);
        cmd.Parameters.AddWithValue("@exp_type", exp_type);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_skills_add(int emp_id, string skills_name)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_skills_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@skills_name", skills_name);
        

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_extra_add(int emp_id, string extra)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_extra_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@extra", extra);


        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void hr_emp_identifier_add(int emp_id, string name,string job,string add)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_identifier_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@job", job);
        cmd.Parameters.AddWithValue("@add", add);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }


    public DataTable hr_cv_get(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_cv_get", conn);
        cmd.Parameters.AddWithValue("@id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public void hr_emp_p_img_add(int emp_id, Byte[] img)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_p_img_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@img", img);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    public DataTable hr_p_img_get(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_p_img_get", conn);
        cmd.Parameters.AddWithValue("@id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public void hr_emp_users_add (string emp_id, string pass,string mail)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_users_add", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@pass", pass);
        cmd.Parameters.AddWithValue("@mail", mail);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public DataTable hr_emp_users_get(string emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_users_get", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public void hr_emp_add_ID(string emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_add_ID", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }



    public void hr_login_att(string emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_login_att", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@ip", System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList.GetValue(0).ToString());
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }


    public DataTable hr_login(string emp_id,string pass)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_login", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.Parameters.AddWithValue("@pass", pass);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }


    public DataTable hr_emp_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_cer_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_cer_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_lang_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_lang_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_exp_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_exp_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_skills_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_skills_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_extra_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_extra_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_identifier_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_identifier_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_Future_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_Future_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_img_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_img_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_cv_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_cv_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable hr_emp_p_img_exist(int emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("hr_emp_p_img_exist", conn);
        cmd.Parameters.AddWithValue("@emp_id", emp_id);
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
}
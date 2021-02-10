using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Collections;
/// <summary>
/// Summary description for eLern
/// </summary>
public class eLern
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    public eLern()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    public DataTable e_exams_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_exams_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public string get_crs_name(string crs)
    {

        SqlDataAdapter DA = new SqlDataAdapter("	select * from [dbo].[crs_2020]  where crs_id='" + crs + "'", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
            return DT.Rows[0]["crs_name"].ToString();
        else
            return "0";

    }
    public DataTable e_exams_get1(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_exams_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }



    public DataTable e_files_get (string crs_id,int week,string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_files_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public string get_stst_lec(string lec,string dept)
    {

        SqlDataAdapter DA = new SqlDataAdapter("select dbo.calc_lec(user_id,N'"+dept+"') from e_login_log where user_id='"+lec+"'", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
            return DT.Rows[0][0].ToString();
        else
            return "0";
        
    }
    public DataTable get_stst_crs(string crs,string sec)
    {

        SqlDataAdapter DA = new SqlDataAdapter("select *, dbo.calc_files_sec(crs_id,'"+sec+ "') files ,dbo.calc_dialog_sec(crs_id,'" + sec + "') dialog,dbo.calc_links_sec(crs_id,'" + sec + "')links, dbo.calc_HomeWork_sec(crs_id,'" + sec + "') HomeWork, dbo.calc_Announcements_sec(crs_id,'" + sec + "')Announcements,dbo.calc_vids_sec(crs_id, N'داخلي','" + sec + "') internal ,dbo.calc_vids_sec(crs_id,N'خارجي','" + sec + "')external_vi FROM           crs_2020 where crs_id='" + crs+"'", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
            return DT;
        else
            return null;

    }
    public DataTable e_files_get1(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_files_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
       
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_vids_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_vids_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_dialog_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_dialog_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable Dialog_Replays_get(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("Dialog_Replays_get", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
      
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public string get_lec(string crs_id ,string sectionNum)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_lecViaCrs_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
       
        cmd.Parameters.Add(new SqlParameter("@sectionNum", sectionNum));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["lec"].ToString();
        else
            return "لا يوجد محاضر";
    }
    public DataTable e_Announcements_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_Announcements_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_links_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_links_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_HomeWork_answer_answer_get(string h_id, string std_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_answer_answer_get", conn);
        cmd.Parameters.Add(new SqlParameter("@h_id", h_id));
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_HomeWork_answer_answer_get1(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_answer_answer_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_homework_get(string crs_id, int week, string section)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_homework_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week));
 cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_homework_get1(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_homework_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
  public DataTable e_dialog_get1(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_dialog_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }

    public DataTable Dialog_Replays_del(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("Dialog_Replays_del", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
     
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable comments_del(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("comments_del", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_vids_get1(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_vids_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_crs_OverVeiw_get(string crs_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_crs_OverVeiw_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_Announcements_get1(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_Announcements_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_links_get1(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_links_get1", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public DataTable e_crs_syllbus_get(string crs_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_crs_syllbus_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public string e_login_log_get(string user_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_login_log_get", conn);
        cmd.Parameters.Add(new SqlParameter("@user_id", user_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return dt.Rows[0][0].ToString();
        else
            return "لم_يتم_التسجيل_مطلقا";
    }
    public DataTable e_crs_books_get(string crs_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_crs_books_get", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;
    }
    public bool e_if_admin(string emp_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_if_admin", conn);
        cmd.Parameters.Add(new SqlParameter("@emp_id", emp_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    public void e_files_add(string title,string crs_id, string week_id,string path,string det,string section, bool all_sec,string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_files_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@path", path));
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_exams_add(string title, string crs_id, string week_id, string start_dt, string det, string section, string all_sec, string lec,string crs_name,string link,string pass)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_exams_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@start_dt", start_dt));
    
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));

        cmd.Parameters.Add(new SqlParameter("@crs_name_ar", crs_name));
        cmd.Parameters.Add(new SqlParameter("@link", link));
        cmd.Parameters.Add(new SqlParameter("@pass", pass));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_Dialog_Replays_add(string d_id, string det, string who, string name, string role)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_Dialog_Replays_add", conn);
        cmd.Parameters.Add(new SqlParameter("@d_id", d_id));
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@who", who));
        cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.Parameters.Add(new SqlParameter("@role", role));
        
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    //public void MCQestion_add(string qas, string c1, string c2, string c3, string c4,string answer,string crs_id,string section )
    //{
    //    SqlDataAdapter da = new SqlDataAdapter();
    //    DataTable dt = new DataTable();
    //    SqlCommand cmd = new SqlCommand("MCQestion_add", conn);
    //    cmd.Parameters.Add(new SqlParameter("@qas", qas));
    //    cmd.Parameters.Add(new SqlParameter("@c1", c1));
    //    cmd.Parameters.Add(new SqlParameter("@c2", c2));
    //    cmd.Parameters.Add(new SqlParameter("@c3", c3));
    //    cmd.Parameters.Add(new SqlParameter("@c4", c4));

    //    cmd.Parameters.Add(new SqlParameter("@answer", answer));
    //    cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
    //    cmd.Parameters.Add(new SqlParameter("@section", section));

    //    cmd.CommandType = CommandType.StoredProcedure;
    //    conn.Open();
    //    cmd.ExecuteNonQuery();
    //    conn.Close();

    //}

    public void TFQestion_add(string qas, string answer, string crs_id, string section,string crs_name,string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("TFQestion_add", conn);
        cmd.Parameters.Add(new SqlParameter("@qas", qas));
       

        cmd.Parameters.Add(new SqlParameter("@answer", answer));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@crs_name", crs_name));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void reg_del(string std_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("reg_del", conn);
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));


        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void reg_add(string std_id,string courseCode,string arName, string sectionNum,string sectionid)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("reg_add", conn);
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));
        cmd.Parameters.Add(new SqlParameter("@courseCode", courseCode));
        cmd.Parameters.Add(new SqlParameter("@arName", arName));
        cmd.Parameters.Add(new SqlParameter("@sectionNum", sectionNum));
cmd.Parameters.Add(new SqlParameter("@sectionid", sectionid));


        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void Qestion_add(string qas, string crs_id, string section, string crs_name, string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("Qestion_add", conn);
        cmd.Parameters.Add(new SqlParameter("@qas", qas));


        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@crs_name", crs_name));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_comments_add(string std_id, string name, string comment, string re_id, string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_comments_add", conn);
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));
        cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.Parameters.Add(new SqlParameter("@comment", comment));
        cmd.Parameters.Add(new SqlParameter("@re_id", re_id));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void masseges_del(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("masseges_del", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void del_qestion(string id,string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("del_qestion", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void masseges_rep(string r_id, string r_name,string replay,string m_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("masseges_replay1", conn);
        cmd.Parameters.Add(new SqlParameter("@r_id", r_id));
        cmd.Parameters.Add(new SqlParameter("@r_name", r_name));
        cmd.Parameters.Add(new SqlParameter("@replay", replay));
        cmd.Parameters.Add(new SqlParameter("@m_id", m_id));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void masseges_seen(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("masseges_seen", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
       

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

  public void masseges_seen_Replays(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("masseges_seen_Replays", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
       

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    public void e_masseges_add(string sender_id, string sender_name, string title, string det, string to_id,string to_name)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_masseges_add", conn);
        cmd.Parameters.Add(new SqlParameter("@sender_id", sender_id));
        cmd.Parameters.Add(new SqlParameter("@sender_name", sender_name));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@to_id", to_id));
cmd.Parameters.Add(new SqlParameter("@to_name", to_name));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_HomeWork_Edit(string id, string week_id, string DeadLine, string det, string file_att,string mark)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_Edit", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@DeadLine", DeadLine));
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@file_att", file_att));
        cmd.Parameters.Add(new SqlParameter("@mark", mark));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    public void e_Announcements_update(string id, string title, string det)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_Announcements_update", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@det", det));
       

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void MCQestion_add(string qas, string c1, string c2, string c3, string c4,string answer,string crs_id, string section,string crs_name,string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("MCQestion_add", conn);
        cmd.Parameters.Add(new SqlParameter("@qas", qas));
        cmd.Parameters.Add(new SqlParameter("@c1", c1));
        cmd.Parameters.Add(new SqlParameter("@c2", c2));
        cmd.Parameters.Add(new SqlParameter("@c3", c3));
        cmd.Parameters.Add(new SqlParameter("@c4", c4));

        cmd.Parameters.Add(new SqlParameter("@answer", answer));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@section", section));

        cmd.Parameters.Add(new SqlParameter("@crs_name", crs_name));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_dialog_add(string title, string crs_id, string week_id, string deadline, string det, string section, bool all_sec, string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_dialog_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@deadline", deadline));
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_vids_add(string title, string crs_id, string week_id, string link, string section, bool all_sec, string lec,string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_vids_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@link", link));
    
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_HomeWork_answer_answer_GRADE(string id, string grad)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_answer_answer_GRADE", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@grad", grad));
      
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_seen(string id, string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("seen", conn);
        cmd.Parameters.Add(new SqlParameter("@id", id));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void seen_Re(string std_id, string name, string typ,string re_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("seen_Re", conn);
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));
cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.Parameters.Add(new SqlParameter("@typ", typ));
cmd.Parameters.Add(new SqlParameter("@re_id", re_id));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_HomeWork_answer_answer_add(string h_id, string std_id, string std_name, string det,string file_dir)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_answer_answer_add", conn);
        cmd.Parameters.Add(new SqlParameter("@h_id", h_id));
        cmd.Parameters.Add(new SqlParameter("@std_id", std_id));
        cmd.Parameters.Add(new SqlParameter("@std_name", std_name));
        cmd.Parameters.Add(new SqlParameter("@det", det));
 cmd.Parameters.Add(new SqlParameter("@file_dir", file_dir));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_HomeWork_add(string crs_id, string week_id, string DeadLine, string det,string section ,bool all_sec, string lec,string file_att,string mark)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_HomeWork_add", conn);
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@DeadLine", DeadLine));
        cmd.Parameters.Add(new SqlParameter("@det", det));
 cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
 cmd.Parameters.Add(new SqlParameter("@file_att", file_att));
        cmd.Parameters.Add(new SqlParameter("@mark", mark));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_Announcements_add(string title, string crs_id, string week_id, string det,string section, bool all_sec, string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_Announcements_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@det", det));
cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_links_add(string title, string crs_id, string week_id, string link, string section, bool all_sec, string lec)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_links_add", conn);
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
        cmd.Parameters.Add(new SqlParameter("@week_id", week_id));
        cmd.Parameters.Add(new SqlParameter("@link", link));
        cmd.Parameters.Add(new SqlParameter("@section", section));
        cmd.Parameters.Add(new SqlParameter("@all_sec", all_sec));
        cmd.Parameters.Add(new SqlParameter("@lec", lec));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void add_OverVeiw( string crs_id, string det)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("add_OverVeiw", conn);
       
        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));
       
        cmd.Parameters.Add(new SqlParameter("@det", det));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void add_syllbus(string crs_id, string path)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("add_syllbus", conn);

        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));

        cmd.Parameters.Add(new SqlParameter("@path", path));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_del(string id, string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_del", conn);

        cmd.Parameters.Add(new SqlParameter("@id", id));

        cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void add_books(string crs_id, string path)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("add_books", conn);

        cmd.Parameters.Add(new SqlParameter("@crs_id", crs_id));

        cmd.Parameters.Add(new SqlParameter("@path", path));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public void e_log(string user_id, string last_log,string ipp, string name)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_log", conn);

        cmd.Parameters.Add(new SqlParameter("@user_id", user_id));
   cmd.Parameters.Add(new SqlParameter("@last_log", last_log));
   cmd.Parameters.Add(new SqlParameter("@ipp", ipp));
        cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    public DataTable e_log1(string user_id)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("e_log1", conn);

        cmd.Parameters.Add(new SqlParameter("@user_id", user_id));

        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public DataTable comments_get(string r_id,string typ)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("comments_get", conn);

        cmd.Parameters.Add(new SqlParameter("@re_id", r_id));
 cmd.Parameters.Add(new SqlParameter("@typ", typ));
        cmd.CommandType = CommandType.StoredProcedure;
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public DataTable STD_COURS(string std)
    {

       var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetStudentRegisteredCourses?studentNumber=" + std+ "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result1 res = JsonConvert.DeserializeObject<Result1>(response.Content);
        DataTable dt=new DataTable ();
        dt.Columns.Add("courseId");
        dt.Columns.Add("courseCode");
        dt.Columns.Add("arName");
        dt.Columns.Add("sectionId");
        dt.Columns.Add("sectionNum");
        dt.Columns.Add("arName+sectionNum");
        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
           
            dt.Rows[i]["courseId"] = res.result[i].courseId;
dt.Rows[i]["sectionId"] = res.result[i].sectionId;
            dt.Rows[i]["courseCode"] = res.result[i].courseCode;
            if (res.result[i].courseId == "BADM4323")
                dt.Rows[i]["arName"] = "2لغة انجلزية اعمال";
            else
            dt.Rows[i]["arName"] = res.result[i].arName;

            dt.Rows[i]["sectionNum"] = res.result[i].sectionNum;
            dt.Rows[i]["arName+sectionNum"] = res.result[i].arName + " شعبة " + res.result[i].sectionNum;


        }
        return dt;
    }
    public DataTable STD_COURS1(string std)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetStudentRegisteredCourses?studentNumber=" + std + "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result1 res = JsonConvert.DeserializeObject<Result1>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("courseId");
       
        dt.Columns.Add("arName");
   
        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["courseId"] = res.result[i].courseId;
            
            dt.Rows[i]["arName"] = res.result[i].arName;
         


        }
        return dt;
    }
    public bool IF_STD_COURS(string std)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetStudentRegisteredCourses?studentNumber=" + std+ "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result1 res = JsonConvert.DeserializeObject<Result1>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("courseId");
        dt.Columns.Add("courseCode");
        dt.Columns.Add("arName");
        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["courseId"] = res.result[i].courseId;
            dt.Rows[i]["courseCode"] = res.result[i].courseCode;
            dt.Rows[i]["arName"] = res.result[i].arName;

        }
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    public class Result1
    {
        public List<Data1> result { get; set; }

    }
    public class Data1
    {
        public string courseId { get; set; }
        public string courseCode { get; set; }
        public string arName { get; set; }
        public string courseStatusId { get; set; }
        public string sectionNum { get; set; }
        public string sectionId { get; set; }


    }





    public DataTable lec_section(string lec,string crs_id)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetInstructorSections?employeeNo=" + lec + "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result2 res = JsonConvert.DeserializeObject<Result2>(response.Content);
        DataTable dt = new DataTable();
       
        dt.Columns.Add("courseCode");
        dt.Columns.Add("sectionNum");
      
        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["courseCode"] = res.result[i].courseCode;
            dt.Rows[i]["sectionNum"] = res.result[i].sectionNum;
        }

        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    if(dt.Rows[i]["courseCode"].ToString()!=crs_id)
        //    {
        //        dt.Rows.Remove();
        //    }

        //}
        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr = dt.Rows[i];
            if (dr["courseCode"].ToString() != crs_id)
                dr.Delete();
        }
        dt.AcceptChanges();

        return dt;
    }


    public DataTable lec_COURS(string lec,string sem)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetInstructorSections?employeeNo=" + lec+"&semesterId="+sem);
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result2 res = JsonConvert.DeserializeObject<Result2>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("courseCode");
        dt.Columns.Add("courseArName");
        dt.Columns.Add("collegeArName");

        dt.Columns.Add("departmentArName");
        dt.Columns.Add("sectionNum");
        dt.Columns.Add("branchId");
        dt.Columns.Add("courseArName+sectionNum");
        dt.Columns.Add("courseCode+sectionNum");
        dt.Columns.Add("files");
        dt.Columns.Add("dialog");
        dt.Columns.Add("links");
        dt.Columns.Add("HomeWork");
        dt.Columns.Add("Announcements");
        dt.Columns.Add("internal");
        dt.Columns.Add("external_vi");

        if (res.result !=null)
        {

        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["courseCode"] = res.result[i].courseCode;
            dt.Rows[i]["courseArName"] = res.result[i].courseArName;
            dt.Rows[i]["collegeArName"] = res.result[i].collegeArName;

            dt.Rows[i]["departmentArName"] = res.result[i].departmentArName;
            dt.Rows[i]["sectionNum"] = res.result[i].sectionNum;
            dt.Rows[i]["branchId"] = res.result[i].branchId;
            dt.Rows[i]["courseArName+sectionNum"] = res.result[i].courseArName+" شعبة ."+ res.result[i].sectionNum;
            dt.Rows[i]["courseCode+sectionNum"] = res.result[i].courseCode + " شعبة ." + res.result[i].sectionNum;
                DataTable dt_stat = get_stst_crs(res.result[i].courseCode, res.result[i].sectionNum);
                if (dt_stat != null)
                {
                    dt.Rows[i]["files"] = dt_stat.Rows[0]["files"];
                    dt.Rows[i]["dialog"] = dt_stat.Rows[0]["dialog"];
                    dt.Rows[i]["links"] = dt_stat.Rows[0]["links"];
                    dt.Rows[i]["HomeWork"] = dt_stat.Rows[0]["HomeWork"];
                    dt.Rows[i]["Announcements"] = dt_stat.Rows[0]["Announcements"];
                    dt.Rows[i]["internal"] = dt_stat.Rows[0]["internal"];
                    dt.Rows[i]["external_vi"] = dt_stat.Rows[0]["external_vi"];
                }
                else
                {
                    dt.Rows[i]["files"] ="0";
                    dt.Rows[i]["dialog"] = "0";
                    dt.Rows[i]["links"] = "0";
                    dt.Rows[i]["HomeWork"] = "0";
                    dt.Rows[i]["Announcements"] = "0";
                    dt.Rows[i]["internal"] = "0";
                    dt.Rows[i]["external_vi"] = "0";
                }
        }
        }
        return dt;
    }
    public Boolean If_lec_COURS(string lec)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetInstructorSections?employeeNo=" + lec + "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result2 res = JsonConvert.DeserializeObject<Result2>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("courseCode");
        dt.Columns.Add("courseArName");
        dt.Columns.Add("collegeArName");

        dt.Columns.Add("departmentArName");
        dt.Columns.Add("sectionNum");
        dt.Columns.Add("branchId");
        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["courseCode"] = res.result[i].courseCode;
            dt.Rows[i]["courseArName"] = res.result[i].courseArName;
            dt.Rows[i]["collegeArName"] = res.result[i].collegeArName;

            dt.Rows[i]["departmentArName"] = res.result[i].departmentArName;
            dt.Rows[i]["sectionNum"] = res.result[i].sectionNum;
            dt.Rows[i]["branchId"] = res.result[i].branchId;

        }
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    public class Result2
    {
        public List<Data2> result { get; set; }

    }
    public class Data2
    {
        public string courseCode { get; set; }
        public string courseArName { get; set; }
        public string collegeArName { get; set; }
        public string departmentArName { get; set; }
        public string sectionNum { get; set; }
        public string branchId { get; set; }
    }
   
    public DataTable std_data(string std)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/student/GetStudentDetails?studentId=" + std);
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response1 = client.Execute(request);

        Result3 data = new JavaScriptSerializer().Deserialize<Result3>(response1.Content);

        DataTable dt = new DataTable();
        dt.Columns.Add("name");
        dt.Columns.Add("college");
        dt.Columns.Add("department");

        dt.Columns.Add("gpauniversity");
        dt.Columns.Add("program");
        dt.Columns.Add("studentImage");

      
            dt.Rows.Add();
            dt.Rows[0]["name"] = data.result.name;
            dt.Rows[0]["college"] = data.result.college;
            dt.Rows[0]["department"] = data.result.department;

            dt.Rows[0]["gpauniversity"] = data.result.gpauniversity;
            dt.Rows[0]["program"] = data.result.program;
            dt.Rows[0]["studentImage"] = data.result.studentImage;
          
        
        return dt;
    }
    public DataTable GetSectionDetails(string sectionId)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/ELearning/GetSectionDetails?sectionId=" + sectionId);
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);

        //Result6 data6 = new JavaScriptSerializer().Deserialize<Result6>(response13.Content);
        Result6 res = JsonConvert.DeserializeObject<Result6>(response.Content);

        DataTable dt = new DataTable();
        dt.Columns.Add("instructor");
        dt.Columns.Add("employeeNo");

        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[0]["instructor"] = res.result[0].instructor;
            dt.Rows[0]["employeeNo"] = res.result[0].employeeNo;
        }
       


        return dt;
    }
    public class Result3
    {
        public Data3 result { get; set; }

    }

    public class Data3
    {
        public string id { get; set; }
        public string studentNo { get; set; }
        public string name { get; set; }
        public string college { get; set; }
        public string department { get; set; }
        public string gpauniversity { get; set; }
        public string program { get; set; }
        public string studentImage { get; set; }
    }



    public class Result6
    {
       
        public List<Data6> result { get; set; }

    }

    public class Data6
    {
        public string courseArName { get; set; }
        public string courseCode { get; set; }
        public string instructor { get; set; }
        public string instructorId { get; set; }
        public string employeeNo { get; set; }
        public string courseDepartment { get; set; }
       
    }

    public DataTable std_cours(string crs,string sectionNumber)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetOfferedCourseStudentsByCourseCode?courseCode=" + crs + "&semesterId=21&sectionNumber="+sectionNumber);
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Result4 res = JsonConvert.DeserializeObject<Result4>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("id");
        dt.Columns.Add("studentNo");
        dt.Columns.Add("nameInfo");
        dt.Columns.Add("ROW");

        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["id"] = res.result[i].id;
            dt.Rows[i]["studentNo"] = res.result[i].studentNo;
            dt.Rows[i]["nameInfo"] = res.result[i].nameInfo;
            dt.Rows[i]["ROW"] =i+1;
        }
        return dt;
    }
    public class Result4
    {
        public List<Data4> result { get; set; }

    }
    public class Data4
    {
        public string id { get; set; }
        public string studentNo { get; set; }
        public string nameInfo { get; set; }
    
    }

    public string lec_name(string lecNum)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/Employee/GetEmployeesList?EmployeeNo=" + lecNum);
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);

        try
        {

        
        string[] tokens = response.Content.ToString().Split(new[] { lecNum }, StringSplitOptions.None);

        string[] tokens1 = tokens[0].ToString().Split(new[] { "fullname" }, StringSplitOptions.None);

        string[] tokens2 = tokens1[1].ToString().Replace('"', ' ').Replace(',', ' ').Replace(':', ' ').ToString().Split(new[] { "employeeNo" }, StringSplitOptions.None);
      
        return tokens2[0].ToString();
        }
        catch
        {
            return "لايوجد";
        }
    }
    public DataTable coll_lect(string coll)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetCollegeInstructors?collegeId=" + coll + "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Resultcoll res = JsonConvert.DeserializeObject<Resultcoll>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("employeeNo");
        dt.Columns.Add("instructor");
        dt.Columns.Add("courseDepartment");
       
        dt.Columns.Add("lastLogin");
        dt.Columns.Add("count");
        dt.Columns.Add("crs_count");
        dt.Columns.Add("Id");


        dt.Columns["Id"].DataType = Type.GetType("System.Int32");

        dt.Columns["count"].DataType = Type.GetType("System.Int32");

        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["instructor"] = res.result[i].instructor;
            dt.Rows[i]["courseDepartment"] = res.result[i].courseDepartment;
            dt.Rows[i]["employeeNo"] = res.result[i].employeeNo;
            dt.Rows[i]["lastLogin"] = e_login_log_get(res.result[i].employeeNo);

            DataTable dt1 = lec_COURS(res.result[i].employeeNo, "20");
          
            for (int z = dt1.Rows.Count - 1; z >= 0; z--)
            {
                DataRow dr = dt1.Rows[z];
                if (dr["departmentArName"].ToString() != res.result[i].courseDepartment)
                    dr.Delete();
            }
            
            dt1 = RemoveDuplicateRows(dt1, "courseCode");
            dt1.AcceptChanges();
            dt.Rows[i]["crs_count"] = dt1.Rows.Count.ToString();
            dt.Rows[i]["count"] = get_stst_lec(res.result[i].employeeNo, res.result[i].courseDepartment); ;
         
        }
        return dt;
    }
    public DataTable coll_lect_dept(string coll,string dept)
    {

        var client = new RestClient("https://demoapi.israa.edu.ps/api/services/app/elearning/GetCollegeInstructors?collegeId=" + coll + "&semesterId=21");
        client.Timeout = -1;
        var request = new RestRequest(Method.GET);
        request.AlwaysMultipartFormData = true;
        IRestResponse response = client.Execute(request);
        Resultcoll res = JsonConvert.DeserializeObject<Resultcoll>(response.Content);
        DataTable dt = new DataTable();
        dt.Columns.Add("employeeNo");
        dt.Columns.Add("instructor");
        dt.Columns.Add("courseDepartment");

        dt.Columns.Add("lastLogin");
        dt.Columns.Add("count");
        dt.Columns.Add("Id");


        dt.Columns["Id"].DataType = Type.GetType("System.Int32");

        dt.Columns["count"].DataType = Type.GetType("System.Int32");

        for (int i = 0; i < res.result.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["instructor"] = res.result[i].instructor;
            dt.Rows[i]["courseDepartment"] = res.result[i].courseDepartment;
            dt.Rows[i]["employeeNo"] = res.result[i].employeeNo;
            dt.Rows[i]["lastLogin"] = e_login_log_get(res.result[i].employeeNo);

            dt.Rows[i]["count"] = get_stst_lec(res.result[i].employeeNo,dept);

        }
        return dt;
    }
    public DataTable all_lect()
    {

        SqlDataAdapter DA = new SqlDataAdapter("select distinct user_id,name,dbo.calc_dialog_lec1(user_id)نقاش ,dbo.calc_vids_lec1(user_id, N'داخلي')فيديو_داخلي,dbo.calc_vids_lec1(user_id, N'خارجي')فيديو_خارجي,dbo.calc_HomeWork_lec1(user_id)واجبات,dbo.calc_files_lec1(user_id)ملفات,dbo.calc_Announcements_lec1(user_id)اعلانات,dbo.calc_links_lec1(user_id)روابط,dbo.calc_lec1(user_id)كل_المصادر from e_login_log where user_id in (select std_id from std_crs where sectionid = -1) order by dbo.calc_lec1(user_id )desc", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);



        DataTable dt = new DataTable();
        dt.Columns.Add("رقم الموظف");
        dt.Columns.Add("الاسم");
        dt.Columns.Add("نقاش");

        dt.Columns.Add("فيديو_داخلي");
        dt.Columns.Add("فيديو_خارجي");

        dt.Columns.Add("واجبات");
        dt.Columns.Add("ملفات");

        dt.Columns.Add("اعلانات");
        dt.Columns.Add("روابط");
        dt.Columns.Add("كل_المصادر");

        dt.Columns.Add("عدد المساقات");


        dt.Columns["نقاش"].DataType = Type.GetType("System.Int32");
        dt.Columns["فيديو_داخلي"].DataType = Type.GetType("System.Int32");
        dt.Columns["فيديو_خارجي"].DataType = Type.GetType("System.Int32");
        dt.Columns["واجبات"].DataType = Type.GetType("System.Int32");
        dt.Columns["ملفات"].DataType = Type.GetType("System.Int32");
        dt.Columns["روابط"].DataType = Type.GetType("System.Int32");
        dt.Columns["كل_المصادر"].DataType = Type.GetType("System.Int32");
        dt.Columns["عدد المساقات"].DataType = Type.GetType("System.Int32");

        //  dt.Columns["Id"].DataType = Type.GetType("System.Int32");

        //dt.Columns["count"].DataType = Type.GetType("System.Int32");

        for (int i = 0; i < DT.Rows.Count; i++)
        {
            dt.Rows.Add();
            dt.Rows[i]["رقم الموظف"] = DT.Rows[i]["user_id"].ToString();
            dt.Rows[i]["الاسم"] = DT.Rows[i]["name"].ToString();
            dt.Rows[i]["نقاش"] = DT.Rows[i]["نقاش"].ToString();
            dt.Rows[i]["فيديو_داخلي"] = DT.Rows[i]["فيديو_داخلي"].ToString();

            dt.Rows[i]["فيديو_خارجي"] = DT.Rows[i]["فيديو_خارجي"].ToString();
            dt.Rows[i]["واجبات"] = DT.Rows[i]["واجبات"].ToString();
            dt.Rows[i]["اعلانات"] = DT.Rows[i]["اعلانات"].ToString();

            dt.Rows[i]["ملفات"] = DT.Rows[i]["ملفات"].ToString();

            dt.Rows[i]["روابط"] = DT.Rows[i]["روابط"].ToString();
            dt.Rows[i]["كل_المصادر"] = DT.Rows[i]["كل_المصادر"].ToString();




            DataTable dt1 = lec_COURS(DT.Rows[i]["user_id"].ToString(), "20");

            //for (int z = dt1.Rows.Count - 1; z >= 0; z--)
            //{
            //    DataRow dr = dt1.Rows[z];
            //    if (dr["departmentArName"].ToString() != res.result[i].courseDepartment)
            //        dr.Delete();
            //}

            dt1 = RemoveDuplicateRows(dt1, "courseCode");
            dt1.AcceptChanges();
            dt.Rows[i]["عدد المساقات"] = dt1.Rows.Count.ToString();



        }
        for (int z = dt.Rows.Count - 1; z >= 0; z--)
        {
            DataRow dr = dt.Rows[z];
            if (dr["عدد المساقات"].ToString() == "0")
                dr.Delete();
        }
        dt.AcceptChanges();
        return dt;
    }
    public class Resultcoll
    {
        public List<Datacoll> result { get; set; }

    }
    public class Datacoll
    {
        public string instructor { get; set; }
        public string courseDepartment { get; set; }
        public string instructorId { get; set; }
        public string employeeNo { get; set; }
       


    }
    public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    {
        Hashtable hTable = new Hashtable();
        ArrayList duplicateList = new ArrayList();

        //Add list of all the unique item value to hashtable, which stores combination of key, value pair.
        //And add duplicate item value in arraylist.
        foreach (DataRow drow in dTable.Rows)
        {
            if (hTable.Contains(drow[colName]))
                duplicateList.Add(drow);
            else
                hTable.Add(drow[colName], string.Empty);
        }

        //Removing a list of duplicate items from datatable.
        foreach (DataRow dRow in duplicateList)
            dTable.Rows.Remove(dRow);
        dTable.AcceptChanges();
        //Datatable which contains unique records will be return as output.
        return dTable;
    }


}
    
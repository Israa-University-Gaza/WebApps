using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            no.Visible = false;
        if (Request.QueryString["login"] != null)
        {
            log.Visible = true;
            Label1.Text = Request.QueryString["login"];
        }
        else
            log.Visible = false   ;

        SqlDataAdapter DA = new SqlDataAdapter("select count(id) from e_files", conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        file2.InnerText = DT.Rows[0][0].ToString();

        SqlDataAdapter DA1 = new SqlDataAdapter("select count(id) from e_HomeWork", conn);
        DataTable DT1 = new DataTable();
        DA1.Fill(DT1);
        how.InnerText = DT1.Rows[0][0].ToString();

        SqlDataAdapter DA2 = new SqlDataAdapter("select count(id) from e_Announcements ", conn);
        DataTable DT2 = new DataTable();
        DA2.Fill(DT2);
        ann.InnerText = DT2.Rows[0][0].ToString();

        SqlDataAdapter DA3 = new SqlDataAdapter("select count(id) from e_links ", conn);
        DataTable DT3 = new DataTable();
        DA3.Fill(DT3);
        hyp.InnerText = DT3.Rows[0][0].ToString();

        SqlDataAdapter DA4 = new SqlDataAdapter("select count(id) from [dbo].[e_HomeWork_answer_answer]", conn);
        DataTable DT4 = new DataTable();
        DA4.Fill(DT4);
        how1.InnerText = DT4.Rows[0][0].ToString();

        SqlDataAdapter DA5 = new SqlDataAdapter("select count(id) from e_dialog ", conn);
        DataTable DT5 = new DataTable();
        DA5.Fill(DT5);
        dia.InnerText = DT5.Rows[0][0].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        var url1 = "https://system.israa.edu.ps/app/login?token=elib&username=" + loginId.Text + "&password=" + password.Text.Replace("#", "%23").Replace("$", "%24").Replace("&", "%26").Replace("*", "%2A").Replace("+", "%2B");
        var request1 = WebRequest.Create(url1);
        var response1 = (HttpWebResponse)request1.GetResponse();
        var stream1 = response1.GetResponseStream();
        var reader1 = new StreamReader(stream1);
        var JsonString1 = reader1.ReadToEnd();
        reader1.Close();
        stream1.Close();
        response1.Close();
      // Response.Write(url1 + "<br>");

        List<User> user = new JavaScriptSerializer().Deserialize<List<User>>(JsonString1);

        //Response.Write(user[0].status);
        if (user[0].status == "1")
        {
            DataTable dt = r.e_log1(loginId.Text);
            Session["log"] = loginId.Text;
            Session["name"] = user[0].name;
            Session["role"] = user[0].type;
            Session["pass"] = password.Text;
            if (dt.Rows.Count > 0)
            {
  Session["last_log"] = dt.Rows[0]["last_log"].ToString();
            }
              
            else
            {
Session["last_log"] = " ";
            }
                
            if (user[0].type == "1")
            {
                if (r.If_lec_COURS(loginId.Text))
                {
                    string ipaddress;
                    ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (ipaddress == "" || ipaddress == null)
                        ipaddress = Request.ServerVariables["REMOTE_ADDR"];
                    r.e_log(loginId.Text, DateTime.Now.ToString(), ipaddress, user[0].name);
                    if (r.e_if_admin(loginId.Text))
                    {
                        Session["admin"] = "ok";
                    }
                   // mod.InnerHtml = "<iframe src =\"moodle/loginMoodle.aspx?user="+loginId.Text+"&pass="+password.Text+"\" ></iframe>";
                   if(loginId.Text=="244")
                Response.Redirect("Instructor/zoom.aspx");
else
                    Response.Redirect("Instructor");
                    
                }
                    
                else
                {
                    if (r.e_if_admin(loginId.Text))
                    {
                        Session["admin"] = "ok";
                    }
                    no.Visible = true;
  if(loginId.Text=="244")
                Response.Redirect("Instructor/zoom.aspx");
else
                    Response.Redirect("Instructor");
                  
                }
            }

            if (user[0].type == "2")
            {
                if(r.IF_STD_COURS(loginId.Text))
                {
                    string ipaddress;
                    ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (ipaddress == "" || ipaddress == null)
                        ipaddress = Request.ServerVariables["REMOTE_ADDR"];

                    r.e_log(loginId.Text, DateTime.Now.ToString(), ipaddress, user[0].name);
                    Session["id"] = user[0].id;
                    //  mod.InnerHtml = "<iframe hidden=\"hidden\" src =\"moodle/loginMoodle.aspx?user=" + loginId.Text + "&pass=" + password.Text + "\" ></iframe>";
                    if (Request.Browser.IsMobileDevice)
                        Response.Redirect("Students1");
                    else
                    Response.Redirect("Students");
                }
               
                else
                {
                    no.Visible = true;
                }
            }


        }
        else
        {
            if (user[0].msg == "اغلاق مالي")
                Response.Redirect("Login.aspx?login=عزيزي الطالب عليك مراجعة دائرة شؤون الطلبة .." );
            else

 Response.Redirect("Login.aspx?login=" + user[0].msg);
        }
           
    }

}

public class User
{
    public string status { get; set; }
    public string msg { get; set; }
    public string id { get; set; }
    public string name { get; set; }
    public string type { get; set; }
}


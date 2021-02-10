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

public partial class all : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "username") != null)
        {
            Label Label1 = (Label)e.Row.FindControl("Label1");
            string username = DataBinder.Eval(e.Row.DataItem, "username").ToString();
            string Password = DataBinder.Eval(e.Row.DataItem, "Password").ToString();
            var url1 = "https://system.israa.edu.ps/app/login?token=elib&username=" + username + "&password=" + Password.Trim().Replace("#", "%23").Replace("$", "%24").Replace("&", "%26").Replace("*", "%2A").Replace("+", "%2B");
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
            Label1.Text = user[0].msg;

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
}
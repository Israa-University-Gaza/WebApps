using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_w : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string data = "{message:'Test2'}";
        Label1.Text = SendPostRequest(data, "https://graph.facebook.com/v2.10/1396943963707247/feed?access_token=1972383083007716%7CQwXfESDyRI6m1wGHkeIV7NSVqLY");
    }


    public static string SendPostRequest(string data, string url)
    {
        HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(url);
        httpRequest.Method = "POST";
        httpRequest.ContentType = "application/x-www-form-urlencoded";
        httpRequest.ContentLength = data.Length;

        var streamWriter = new StreamWriter(httpRequest.GetRequestStream());
        streamWriter.Write(data);
        streamWriter.Close();


        HttpWebResponse x = (HttpWebResponse)httpRequest.GetResponse();

        String responseString = "";
        using (Stream stream = x.GetResponseStream())
        {
            StreamReader reader = new StreamReader(stream, Encoding.UTF8);
            responseString = reader.ReadToEnd();
        }

        return responseString;
    }
}
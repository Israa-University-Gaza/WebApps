using ASPSnippets.FaceBookAPI;
using System;
using System.Data;
using System.Web.Script.Serialization;

public partial class APP_HRM_fb : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "1972383083007716";
        FaceBookConnect.API_Secret = "6559d8b4bce2bb2f97c4a0c92b4a2e4e";

        if (!string.IsNullOrEmpty(Request.QueryString["code"]))
        {

            //string data = FaceBookConnect.Fetch(Request.QueryString["code"], "me?fields=id,name");
            string strURL1 = "https://graph.facebook.com/oauth/access_token?client_id=1972383083007716&client_secret=6559d8b4bce2bb2f97c4a0c92b4a2e4e&redirect_uri=http://hr.israa.edu.ps/APP_HRM/fb.aspx&code=" + Request.QueryString["code"];
            string data1 = GetHtmlPage(strURL1);
            UserAccessToken userAccessToken = new JavaScriptSerializer().Deserialize<UserAccessToken>(data1);

            string strURL = "https://graph.facebook.com/v2.10/me?fields=id,name&access_token=" + userAccessToken.access_token;
            string data = GetHtmlPage(strURL);
            FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);

            string facebookid = faceBookUser.Id;
            string name = faceBookUser.Name;

            DataTable DT = EmployeeFacebookDA.EmployeeFacebookAdd(UserID, facebookid, name);
            Label1.Text = DT.Rows[0]["msg"].ToString();
            //Label1.Text = "تم الإشتراك في التطبيق الخاص بجامعة الإسراء";
        }
        else
        {
            Response.Redirect("https://graph.facebook.com/oauth/authorize?redirect_uri=http://hr.israa.edu.ps/APP_HRM/fb.aspx&client_id=1972383083007716&scope=publish_actions");
            //FaceBookConnect.Authorize("publish_actions", Request.Url.AbsoluteUri.Split('?')[0]);
        }
    }

    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    public class UserAccessToken
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
    }
}
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Areas.FacebookShare.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using IsraaSystem.Core.Classic.FacebookShare;
using IsraaSystem.DataAccess.Sql.FacebookShare;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.FacebookShare.Controllers
{
    public class FBController : BaseController
    {
        public async Task<ActionResult> Index()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                Posts posts;
                using (HttpClient client = new HttpClient())
                {
                    string strURL1 = "https://graph.facebook.com/oauth/access_token?client_id=1972383083007716&client_secret=6559d8b4bce2bb2f97c4a0c92b4a2e4e&redirect_uri=" + Request.Url.AbsoluteUri.Split('?')[0] + "&code=" + Request.QueryString["code"];
                    string json = await client.GetStringAsync(strURL1);
                    UserAccessToken userAccessToken = new JavaScriptSerializer().Deserialize<UserAccessToken>(json);

                    string strURL2 = "https://graph.facebook.com/v2.10/1140207149338244/posts?fields=message,created_time,story,id,permalink_url&access_token=" + userAccessToken.access_token;
                    string json2 = await client.GetStringAsync(strURL2);
                    posts = new JavaScriptSerializer().Deserialize<Posts>(json2);
                }
                return View(posts);
            }
            else
            {
                Response.Redirect("https://graph.facebook.com/oauth/authorize?redirect_uri=" + Request.Url.AbsoluteUri.Split('?')[0] + "&client_id=1972383083007716&scope=manage_pages");
                return View();
            }
        }

        public async Task<ActionResult> Share(string link, string postId)
        {
            using (HttpClient client = new HttpClient())
            {
                DataTable DT = EmployeeFacebookDA.GetEmployeeFacebooks();
                foreach (DataRow row in DT.Rows)
                {
                    string json = "{\"link\":\"" + link + "\"}";
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    var response = await client.PostAsync("https://graph.facebook.com/v2.10/" + row["FacebookID"] + "/feed?access_token=1972383083007716%7CQwXfESDyRI6m1wGHkeIV7NSVqLY", new StringContent(json, Encoding.UTF8, "application/json"));
                    string s = await response.Content.ReadAsStringAsync();
                    EmployeeFacebookDA.EmployeeFacebookPostAdd(new EmployeeFacebookPost(Convert.ToInt32(row["EmployeeID"]), link, postId, s, GetEmployeeID()));
                }
            }
            return RedirectToAction("Index");
        }
    }
}
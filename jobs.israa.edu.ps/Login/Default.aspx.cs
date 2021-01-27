using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Default : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {

        

        msg.Visible = false;

        msgg.Visible = false;
        msg1.Visible = false;
        suc.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = m.hr_login(id.Text, pass.Text);
        if (dt.Rows.Count > 0)
        {
            Session["emp_id"] = id.Text;

            HttpCookie emp_id = new HttpCookie("emp_id");
            emp_id.Value = id.Text;
            emp_id.Expires = DateTime.Now.AddHours(1);
            Response.Cookies.Add(emp_id);

            m.hr_login_att(id.Text);
            Response.Redirect("../Default.aspx");
        }
        else
        {
            msg.Visible = true;
        }
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = m.hr_emp_users_get(IDD.Text);
        if (dt.Rows.Count > 0)
            msgg.Visible = true;
        else
        {
            msgg.Visible = false;
            string s = HttpRequestPost(IDD.Text);
            Result res = JsonConvert.DeserializeObject<Result>(s);
            if (res.DATA.Count == 0)
            {

                msg1.Visible = true;
            }

            else
            {
                m.hr_emp_users_add(IDD.Text, passs.Text, email.Text);
                m.hr_emp_add_ID(IDD.Text);
                //Response.Redirect("Login.aspx");
                suc.Visible = true;
            }
        }
    }
    public static string HttpRequestPost(string id)
    {
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://eservices.mtit.gov.ps/ws/gov-services/ws/getData");
        req.Method = "POST";
        req.ContentType = "application/json";
        string postData = "{\"WB_USER_NAME_IN\":\"ISRAA_UNIV4GOVDATA\",\"WB_USER_PASS_IN\":\"6CA03SS8GTULP36E82207C1D\",\"DATA_IN\":{\"package\":\"MOI_GENERAL_PKG\",\"procedure\":\"CITZN_INFO\",\"ID\":" + id + "},\"WB_AUDIT_IN\":{\"ip\":\"10.12.0.32\",\"pc\":\"hima-pc\"}}";
        req.ContentLength = postData.Length;

        StreamWriter stOut = new
        StreamWriter(req.GetRequestStream(),
        System.Text.Encoding.ASCII);
        stOut.Write(postData);
        stOut.Close();

        string strResponse;

        StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
        strResponse = stIn.ReadToEnd();
        stIn.Close();
        return strResponse;



    }
    public class Result
    {
        public List<Data> DATA { get; set; }
        public string MSG_TYPE_OUT { get; set; }
        public string MSG_OUT { get; set; }
    }
    public class Data
    {
        public string IDNO { get; set; }
        public string FNAME_ARB { get; set; }
        public string SNAME_ARB { get; set; }
        public string TNAME_ARB { get; set; }
        public string LNAME_ARB { get; set; }
        public string MOTHER_ARB { get; set; }
        public string PREV_LNAME_ARB { get; set; }
        public string DETH_DT { get; set; }
        public string ENG_NAME { get; set; }
        public string BIRTH_DT { get; set; }
        public string STREET_ARB { get; set; }
        public string SEX_CD { get; set; }
        public string SOCIAL_STATUS_CD { get; set; }
        public string REGION_CD { get; set; }
        public string CITY_CD { get; set; }
        public string RELIGION_CD { get; set; }
        public string BIRTH_MAIN_CD { get; set; }
        public string BIRTH_SUB_CD { get; set; }
        public string SEX { get; set; }
        public string SOCIAL_STATUS { get; set; }
        public string CI_REGION { get; set; }
        public string CI_CITY { get; set; }
        public string CI_RELIGION { get; set; }
        public string BIRTH_PMAIN { get; set; }
        public string BIRTH_PSUB { get; set; }
    }
}
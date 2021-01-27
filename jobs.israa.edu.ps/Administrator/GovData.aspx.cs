using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_GovData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        data.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        data.Visible = true;
        string s = HttpRequestPost(TextBox1.Text);
        Result res = JsonConvert.DeserializeObject<Result>(s);
        if (res.DATA.Count > 0)
        {
            n1.Text = res.DATA[0].FNAME_ARB;
            n2.Text = res.DATA[0].SNAME_ARB;
            n3.Text = res.DATA[0].TNAME_ARB;
            n4.Text = res.DATA[0].LNAME_ARB;
            gender.SelectedValue = res.DATA[0].SEX;
            BIRTH_DT.Text = res.DATA[0].BIRTH_DT;
            ID.Text = res.DATA[0].IDNO;
            addres.Text = res.DATA[0].CI_REGION + "-" + res.DATA[0].STREET_ARB + " " + res.DATA[0].CI_CITY;

            stat.Text = res.DATA[0].SOCIAL_STATUS;
            MOTHER_ARB.Text = res.DATA[0].MOTHER_ARB;
            PREV_LNAME_ARB.Text = res.DATA[0].PREV_LNAME_ARB;
            ENG_NAME.Text = res.DATA[0].ENG_NAME;
            pob.Text = res.DATA[0].BIRTH_PMAIN + "#" + res.DATA[0].BIRTH_PSUB;
            rel.Text = res.DATA[0].CI_RELIGION;

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
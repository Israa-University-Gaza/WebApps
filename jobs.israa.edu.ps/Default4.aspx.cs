using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = HttpRequestPost(Request.QueryString["id"]);
        Result res = JsonConvert.DeserializeObject<Result>(s);
        if (res.DATA.Count > 0)
        {
            Response.Write(res.DATA[0].IDNO + "<br />");
            Response.Write(res.DATA[0].FNAME_ARB + " " + res.DATA[0].SNAME_ARB + " " + res.DATA[0].TNAME_ARB + " " + res.DATA[0].LNAME_ARB + "<br />");
        }
        string s1 = HttpRequestPost1(Request.QueryString["id"]);

        Result1 res1 = JsonConvert.DeserializeObject<Result1>(s1);

        if (res1.DATA.Count > 0)
        {

            Response.Write(res1.DATA[0].ID + "<br />");
            Response.Write(res1.DATA[0].SRV_INF_NAME + " " + res1.DATA[0].ORG_NM_MON + " " + res1.DATA[0].SRV_TYPE_MAIN_NM + " " + res1.DATA[0].CURRENCY + " " + res1.DATA[0].RECP_AID_AMOUNT + " " + res1.DATA[0].RECP_DELV_DT + "<br />");
        }

        string s3 = HttpRequestPost3(Request.QueryString["id"]);
        Result3 res3 = JsonConvert.DeserializeObject<Result3>(s3);
        if (res3.DATA.Count > 0)
        {
            Response.Write(res3.DATA[0].MINISTRY_NAME + " "+ res3.DATA[0].JOB_START_DT + " "+ res3.DATA[0].EMP_STATE_DESC +" "+ res3.DATA[0].EMP_STATE_NOW_TXT+" "+ res3.DATA[0].JOB_DESC+ " " + res3.DATA[0].MINISTRY_UNIT_NAME+" "+ res3.DATA[0].MIN_DATA_SOURCE+" "+ res3.DATA[0].END_DATE+ "<br />");
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

    public static string HttpRequestPost1(string id)
    {
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://eservices.mtit.gov.ps/ws/gov-services/ws/getData");
        req.Method = "POST";
        req.ContentType = "application/json";
        string postData = "{\"WB_USER_NAME_IN\":\"ISRAA_UNIV4GOVDATA\",\"WB_USER_PASS_IN\":\"6CA03SS8GTULP36E82207C1D\",\"DATA_IN\":{\"package\":\"MOSA_GENERAL_PKG\",\"procedure\":\"GET_AID_RECIP_INFO_BYID\",\"ID\":" + id + "},\"WB_AUDIT_IN\":{\"ip\":\"10.12.0.32\",\"pc\":\"hima-pc\"}}";
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
    public class Result1
    {
        public List<Data1> DATA { get; set; }
        public string MSG_TYPE_OUT { get; set; }
        public string MSG_OUT { get; set; }
    }
    public class Data1
    {
        public string ID { get; set; }
        public string SRV_INF_NAME { get; set; }
        public string ORG_NM_MON { get; set; }
        public string SRV_TYPE_MAIN_NM { get; set; }
        public string CURRENCY { get; set; }
        public string RECP_AID_AMOUNT { get; set; }
        public string RECP_DELV_DT { get; set; }

    }

    public static string HttpRequestPost3(string id)
    {
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://eservices.mtit.gov.ps/ws/gov-services/ws/getData");
        req.Method = "POST";
        req.ContentType = "application/json";
        string postData = "{\"WB_USER_NAME_IN\":\"ISRAA_UNIV4GOVDATA\",\"WB_USER_PASS_IN\":\"6CA03SS8GTULP36E82207C1D\",\"DATA_IN\":{\"package\":\"LAB_EMP_FILE_PKG\",\"procedure\":\"GET_EMP_INFO_BYID_PR\",\"ID\":" + id + "},\"WB_AUDIT_IN\":{\"ip\":\"10.12.0.32\",\"pc\":\"hima-pc\"}}";
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
    public class Result3
    {
        public List<Data3> DATA { get; set; }
        public string MSG_TYPE_OUT { get; set; }
        public string MSG_OUT { get; set; }
    }
    public class Data3
    {
        public string EMP_NO { get; set; }
        public string EMP_DOC_ID { get; set; }
        public string EMP_FULL_NAME { get; set; }
        public string EMP_BIRTH_DT { get; set; }
        public string MINISTRY_CD { get; set; }
        public string MINISTRY_NAME { get; set; }
        public string JOB_START_DT { get; set; }

        public string CLASS_CD { get; set; }
        public string CLASS_NAME { get; set; }
        public string DEGREE_CD { get; set; }
        public string DEGREE_NAME { get; set; }
        public string EMP_STATE_CD { get; set; }
        public string EMP_STATE_DESC { get; set; }
        public string EMP_WORK_STATUS_CD { get; set; }
        public string EMP_WORK_STATUS { get; set; }
        public string EMP_STATE_NOW { get; set; }
        public string EMP_STATE_NOW_TXT { get; set; }
        public string JOB_CD { get; set; }
        public string JOB_DESC { get; set; }
        public string UNIT_NEW_CD { get; set; }
        public string MINISTRY_UNIT_NAME { get; set; }

        public string MIN_DATA_SOURCE_CD { get; set; }
        public string MIN_DATA_SOURCE { get; set; }
        public string END_DATE { get; set; }
    }

}





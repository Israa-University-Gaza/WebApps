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
        string s = HttpRequestPost3(TextBox1.Text);
        Result3 res = JsonConvert.DeserializeObject<Result3>(s);
        if (res.DATA.Count > 0)
        {
            n1.Text = res.DATA[0].EMP_NO;
            n2.Text = res.DATA[0].EMP_DOC_ID;
            n3.Text = res.DATA[0].EMP_FULL_NAME;
            n4.Text = res.DATA[0].EMP_BIRTH_DT;

            n5.Text = res.DATA[0].MINISTRY_NAME;
            n6.Text = res.DATA[0].JOB_START_DT;
            n7.Text = res.DATA[0].CLASS_NAME;
            n8.Text = res.DATA[0].DEGREE_NAME;

            n9.Text = res.DATA[0].EMP_STATE_DESC;
            n10.Text = res.DATA[0].EMP_WORK_STATUS;
            n11.Text = res.DATA[0].EMP_STATE_NOW_TXT;
            n12.Text = res.DATA[0].JOB_DESC;

            n13.Text = res.DATA[0].MINISTRY_UNIT_NAME;
            n14.Text = res.DATA[0].MIN_DATA_SOURCE;
            n15.Text = res.DATA[0].END_DATE;


        }
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
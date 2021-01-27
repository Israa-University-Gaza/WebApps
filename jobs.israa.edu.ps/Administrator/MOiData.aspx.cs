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
        string s = HttpRequestPost1(TextBox1.Text);
        Result1 res = JsonConvert.DeserializeObject<Result1>(s);
        if (res.DATA.Count > 0)
        {
            n1.Text = res.DATA[0].SRV_INF_NAME;
            n2.Text = res.DATA[0].ORG_NM_MON;
            n3.Text = res.DATA[0].SRV_TYPE_MAIN_NM;
            n4.Text = res.DATA[0].CURRENCY;

            n5.Text = res.DATA[0].RECP_AID_AMOUNT;
            n6.Text = res.DATA[0].RECP_DELV_DT;
           


        }
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


}
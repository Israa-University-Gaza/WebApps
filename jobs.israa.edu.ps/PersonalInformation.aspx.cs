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
public partial class _Default : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        DataTable DT = m.hr_add_emp_get(Convert.ToInt32(Session["emp_id"].ToString()));
        n1.Focus();
        if (!IsPostBack)
        {
            if (DT.Rows[0]["n1"].ToString() == "" ) 
            {
                string s = HttpRequestPost(Session["emp_id"].ToString());
                Result res = JsonConvert.DeserializeObject<Result>(s);
               
                    n1.Text = res.DATA[0].FNAME_ARB;
                    n2.Text = res.DATA[0].SNAME_ARB;
                    n3.Text = res.DATA[0].TNAME_ARB;
                    n4.Text = res.DATA[0].LNAME_ARB;
                    gender.SelectedValue = res.DATA[0].SEX;
                    dop.Text = res.DATA[0].BIRTH_DT;
                    ID.Text = res.DATA[0].IDNO;
                    addres.Text = res.DATA[0].CI_REGION + "-" + res.DATA[0].STREET_ARB + " " + res.DATA[0].CI_CITY;
                gender.SelectedValue = res.DATA[0].SEX;

                stat.Text = res.DATA[0].SOCIAL_STATUS;
                    //MOTHER_ARB.Text = res.DATA[0].MOTHER_ARB;
                    //PREV_LNAME_ARB.Text = res.DATA[0].PREV_LNAME_ARB;
                    ENG_NAME.Text = res.DATA[0].ENG_NAME;
                    pob.Text = res.DATA[0].BIRTH_PMAIN + "#" + res.DATA[0].BIRTH_PSUB;
                    rel.Text = res.DATA[0].CI_RELIGION;
            }
            else
            {
                n1.Text = DT.Rows[0]["n1"].ToString();
                n2.Text = DT.Rows[0]["n2"].ToString();
                n3.Text = DT.Rows[0]["n3"].ToString();
                n4.Text = DT.Rows[0]["n4"].ToString();
                age.Text = DT.Rows[0]["age"].ToString();
                dop.Text = DT.Rows[0]["dop"].ToString();
                ID.Text = DT.Rows[0]["ID"].ToString();
                p_ID.Text = DT.Rows[0]["p_ID"].ToString();
                addres.Text = DT.Rows[0]["addres"].ToString();
                stat.SelectedValue = DT.Rows[0]["stat"].ToString();
                tel.Text = DT.Rows[0]["tel"].ToString();
                email.Text = DT.Rows[0]["email"].ToString();
                nat.Text = DT.Rows[0]["nat"].ToString();
                nat1.Text = DT.Rows[0]["nat1"].ToString();
                pob.Text = DT.Rows[0]["pob"].ToString();
                rel.SelectedValue = DT.Rows[0]["rel"].ToString();
                n_has.Text = DT.Rows[0]["n_has"].ToString();
                w_has.Text = DT.Rows[0]["w_has"].ToString();
                d_mar.Text = DT.Rows[0]["d_mar"].ToString();
                h_stat.SelectedItem.Text = DT.Rows[0]["h_stat"].ToString();
                w_c_type.Text = DT.Rows[0]["w_c_type"].ToString();
                w_c_place.Text = DT.Rows[0]["w_c_place"].ToString();
                w_c_place.Text = DT.Rows[0]["w_c_place"].ToString();
                w_leav.SelectedValue = DT.Rows[0]["w_leav"].ToString();
                d_leave.Text = DT.Rows[0]["d_leave"].ToString();
                gender.SelectedValue = DT.Rows[0]["gender"].ToString();


            }
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
   
        m.hr_add_update_emp(Convert.ToInt32(Session["emp_id"].ToString()), n1.Text, n2.Text, n3.Text, n4.Text,dop.Text, age.Text, ID.Text, p_ID.Text, addres.Text, stat.SelectedItem.Text, tel.Text, email.Text, nat.Text, nat1.Text, pob.Text, rel.SelectedItem.Text, n_has.Text, w_has.Text, d_mar.Text, h_stat.SelectedItem.Text, w_c_type.Text, w_c_place.Text, w_c_place.Text, w_leav.SelectedItem.Text, d_leave.Text,gender.SelectedItem.Value);
        Response.Redirect("ScientificData.aspx");
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

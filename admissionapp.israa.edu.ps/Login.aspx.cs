using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
            Response.Redirect("~/AdmissionApp/Default.aspx");
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtStudentNo.Text != "" && txtTawjehyNo.Text != "")
        {
            DataTable DT = DA.IsValidAdmissionStudent(txtStudentNo.Text, txtTawjehyNo.Text);
            if (DT.Rows.Count > 0)
            {

                try
                {
                    var db = new Entities();
                    // Gov API
                    var studentPersonal = db.StudentPersonal.FirstOrDefault(x => x.StudentAcademic.StudentNo.ToString() == txtStudentNo.Text);
                    string s = HttpRequestPost(studentPersonal.SSN);
                    Result res = JsonConvert.DeserializeObject<Result>(s);

                    // var city = db.City.FirstOrDefault(c => c.ArName == res.DATA.FirstOrDefault().CI_CITY);
                    try
                    {
                        studentPersonal.PlaceOfBirth = res.DATA.FirstOrDefault().BIRTH_PSUB;
                    }
                    catch
                    {
                        studentPersonal.PlaceOfBirth = null;
                    }
                    studentPersonal.CReligionID = 8;
                    //if (city != null)
                    //{
                    //    studentPersonal.CityID = city.ID;
                    //}
                    try
                    {
                        studentPersonal.Gender = res.DATA.FirstOrDefault().SEX == "ذكر" ? 1 : 2;
                    }
                    catch
                    {

                    }
                    studentPersonal.AddressDetails = res.DATA.FirstOrDefault().STREET_ARB;
                    CultureInfo provider = CultureInfo.InvariantCulture;
                    try
                    {
                        DateTime dateTime10 = DateTime.ParseExact(res.DATA.FirstOrDefault().BIRTH_DT, "dd/MM/yyyy", provider);
                        studentPersonal.DateOfBirth = dateTime10;

                    }
                    catch
                    {
                        studentPersonal.DateOfBirth = null;
                        // studentPersonal.DateOfBirth = Convert.ToDateTime("01/01/0001 ");
                    }

                    studentPersonal.AddressDetails = res.DATA.FirstOrDefault().STREET_ARB;
                    studentPersonal.EnFirstName = res.DATA.FirstOrDefault().ENG_NAME;
                    studentPersonal.MotherName = res.DATA.FirstOrDefault().MOTHER_ARB;
                    //studentPersonal.ArFamilyName = res.DATA.FirstOrDefault().LNAME_ARB;
                    //studentPersonal.ArSecoundName = res.DATA.FirstOrDefault().SNAME_ARB;
                    //studentPersonal.ArThirdName = res.DATA.FirstOrDefault().TNAME_ARB;
                    //studentPersonal.ArFirstName = res.DATA.FirstOrDefault().FNAME_ARB;

                    //db.Configuration.ValidateOnSaveEnabled = false;
                    db.Entry(studentPersonal).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();

                }
                catch
                {

                }
                if (!Convert.ToBoolean(DT.Rows[0]["AppAccreditation"].ToString()))
                {
                    FormsAuthentication.RedirectFromLoginPage(DT.Rows[0]["ID"].ToString(), true);
                }
                else
                {
                    if (Convert.ToBoolean(DT.Rows[0]["Accreditation"].ToString()))
                    {
                        loginResponse.Attributes.Add("Class", "alert fade in alert-success alert-dismissable");
                        lblMsg.Text = "لقد تم قبول طلبك .";
                    }
                    else
                    {
                        loginResponse.Attributes.Add("Class", "alert fade in alert-danger alert-dismissable");
                        lblMsg.Text = "لقد تم تعبئة الطلب بنجاح , بانتظار القبول .";
                    }
                }
            }
            else
            {
                loginResponse.Attributes.Add("Class", "alert fade in alert-danger alert-dismissable");
                lblMsg.Text = "خطأ في الرقم الجامعي أو رقم الجلوس .";
            }
        }
        else
        {
            if (txtStudentNo.Text == "")
                txtStudentNo.Attributes.Add("Class", "form-control placeholder-no-fix isra-error");
            if (txtTawjehyNo.Text == "")
                txtTawjehyNo.Attributes.Add("Class", "form-control placeholder-no-fix isra-error");
            loginResponse.Attributes.Add("Class", "alert fade in alert-danger alert-dismissable");
            lblMsg.Text = "الرجاء إدخال البيانات المطلوبة .";
        }
    }


    public static string HttpRequestPost(string id)
    {
        System.Net.ServicePointManager.Expect100Continue = false;
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
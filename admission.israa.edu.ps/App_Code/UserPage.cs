using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    String employeeID;
    ArrayList permissions;
    public UserPage()
    {
        employeeID = User.Identity.Name;
        permissions = DataAccess.GetEmployeeSystemActions(employeeID, "3");
    }
    public string EmployeeID
    {
        get
        {
            return employeeID;
        }
    }
    public ArrayList Permissions
    {
        get
        {
            return permissions;
        }
    }

    public bool IsPermissionsContains(string s)
    {
        foreach (String w in permissions)
        {
            if (w.StartsWith(s))
            {
                return true;
            }
        }
        return false;
    }

    public static void SendEmail(string to, string from, string subject, string body)
    {
        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();

        MailAddress fromAddress = new MailAddress("info@israa.edu.ps", "جامعة الإسراء  ");
        smtpClient.Host = "mail.israa.edu.ps";
        smtpClient.Credentials = new NetworkCredential("info@israa.edu.ps", "hasan@hasan.2015");
        smtpClient.Port = 25;
        message.From = fromAddress;
        message.To.Add(to);
        message.Subject = subject;
        message.IsBodyHtml = true;
        message.Body = body;
        smtpClient.Send(message);
    }

    public static void SendError(string text)
    {
        SendSMS("0599739919", text);
    }

    //public static bool SendSMS(string jawwal, string text)
    //{
    //    //string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=israa.ps&pass=wajed@israa.2017&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";

    //    string url = "http://gdm.tweetsms.ps/api.php?comm=sendsms&user=admission&pass=10203050&to=" + jawwal + "&message=" + text;
    //    //string url = "http://smsservice.hadara.ps/HandlerSMS.ashx/bulkservice/sessionvalue/sendMessage/"+ "?aid=" +"IsraaUniv"+ "&apd=" +"Israa@2014.israa" + "&to=" + jawwal + "&msg=" + text ;
    //    string response = GetHtmlPage(url);
    //    if (response.ToString().StartsWith("1:"))
    //    {
    //        return true;
    //    }
    //    return false;
    //}

    //public static string GetHtmlPage(string strURL)
    //{
    //    String strResult;
    //    WebResponse objResponse;
    //    WebRequest objRequest = HttpWebRequest.Create(strURL);
    //    objResponse = objRequest.GetResponse();
    //    using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
    //    {
    //        strResult = sr.ReadToEnd();
    //        sr.Close();
    //    }
    //    return strResult;
    //}


    public static bool SendSMS(string jawwal, string text)
    {
       //string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=admission&pass=10203050&&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
         string url = "http://smsservice.hadara.ps/HandlerSMS.ashx/bulkservice/sessionvalue/sendMessage/" + "?aid=" + "IsraaUniv" + "&apd=" + "IsraaUniv30062019" + "&to=" + jawwal + "&msg=" + text;
        string response = GetHtmlPage(url);
        if (response.ToString().Contains("<Status>1</Status>"))
        {
            return true;
        }
        return false;
    }

    public static string GetHtmlPage(string strURL)
    {
        String strResult;
        WebResponse objResponse;
        WebRequest objRequest = HttpWebRequest.Create(strURL);
        objResponse = objRequest.GetResponse();
        using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
        {
            strResult = sr.ReadToEnd();
            sr.Close();
        }
        return strResult;
    }
    public static void ShowToast(Page page, string message, string title, string type = "info")
    {
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_option", "toastr.options = {'closeButton': true,'debug': false,'positionClass': 'toast-top-right','onclick': null,'showDuration': '600','hideDuration': '1000','timeOut': '5000','extendedTimeOut': '3000','showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut'};", true);
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_message", String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), true);
    }

    public void EmptyControls(WebControl[] controls)
    {
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                ((TextBox)control).Text = "";
                ((TextBox)control).CssClass = "form-control";
            }
            else if (control is DropDownList)
            {
                ((DropDownList)control).SelectedIndex = 0;
                ((DropDownList)control).CssClass = "form-control";
            }
            else if (control is CheckBox)
            {
                ((CheckBox)control).Checked = false;
            }
            else if (control is Label)
            {
                ((Label)control).Text = "";
            }
        }
    }


    public bool ValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                if (txt.Text == "")
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
                else
                {
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                try
                {
                    if (Convert.ToInt32(ddl.SelectedValue) > 0)
                    {
                        ddl.CssClass = ddl.CssClass.Replace(" isra-error", "");

                    }
                    else
                    {
                        valid = false;
                        ddl.CssClass += " isra-error";
                    }
                }
                catch (Exception ex)
                {
                    valid = false;
                    ddl.CssClass += " isra-error";
                }

            }
        }
        return valid;
    }

    public bool IntValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                try
                {
                    int x = Convert.ToInt32(txt.Text);
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                try
                {
                    int x = Convert.ToInt32(ddl.SelectedValue);
                    ddl.CssClass = ddl.CssClass.Replace(" isra-error", "");
                }
                catch (Exception ex)
                {
                    valid = false;
                    ddl.CssClass += " isra-error";
                }
            }
        }
        return valid;
    }

    public bool DoubleValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                try
                {
                    double x = Convert.ToDouble(txt.Text);
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                try
                {
                    double x = Convert.ToDouble(ddl.SelectedValue);
                    ddl.CssClass = ddl.CssClass.Replace(" isra-error", "");
                }
                catch (Exception ex)
                {
                    valid = false;
                    ddl.CssClass += " isra-error";
                }
            }
        }
        return valid;
    }

    public bool DateValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                try
                {
                    Convert.ToDateTime(txt.Text);
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
            }
        }
        return valid;
    }

    public bool EmailValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match match = regex.Match(txt.Text);
                if (match.Success)
                {
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
                else
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
            }
        }
        return valid;
    }

    public bool IDValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                if (!CheckID(txt.Text))
                {
                    valid = false;
                    txt.CssClass += " isra-error";
                }
                else
                {
                    txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                }
            }
        }
        return valid;
    }

    public bool CheckID(string ssn)
    {
        bool valid = false;
        string ID_String = ssn.Trim();
        if (ID_String.Length == 9)
        {
            valid = true;
        }
        return valid;
    }
    //public bool CheckID(string ssn)
    //{
    //    bool valid = false;
    //    string ID_String = ssn.Trim();
    //    int IDSum = 0;

    //    if (ID_String.Length == 9)
    //    {
    //        for (int i = 1; i <= 7; i++)
    //        {
    //            int x = ((Convert.ToInt32(ID_String.Substring(i, 1))) * (((i % 2) == 0) ? 1 : 2));
    //            IDSum = (x > 9) ? IDSum + (x % 10) + 1 : IDSum + (x % 10);
    //        }
    //        IDSum = IDSum + Convert.ToInt32(ID_String.Substring(0, 1));
    //        valid = (Convert.ToInt32(ID_String.Substring(8, 1)) == (10 - Convert.ToInt32((IDSum.ToString()).Substring(1, 1))));
    //    }
    //    return valid;
    //}

public void ExcuteApI(string url)
    {
        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

    }

   public DataTable ToDataTable<T>(List<T> items)
    {
        DataTable dataTable = new DataTable(typeof(T).Name);
        //Get all the properties by using reflection   
        PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
        foreach (PropertyInfo prop in Props)
        {
            //Setting column names as Property names  
            dataTable.Columns.Add(prop.Name);
        }
        foreach (T item in items)
        {
            var values = new object[Props.Length];
            for (int i = 0; i < Props.Length; i++)
            {

                values[i] = Props[i].GetValue(item, null);
            }
            dataTable.Rows.Add(values);
        }

        return dataTable;
    }
}
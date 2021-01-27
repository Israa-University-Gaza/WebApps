using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    static String studentID;
    static String studentNo;

    public UserPage()
    {
        studentID = User.Identity.Name;
        studentNo = DA.StudentGet(StudentID).Rows[0]["StudentNo"].ToString();
    }

    public static string StudentID
    {
        get
        {

            return studentID;
        }
    }

    public static string StudentNo
    {
        get
        {
            return studentNo;
        }
    }

    public static void ShowToast(Page page, string message, string title, string type = "info")
    {
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_option", "toastr.options = {'closeButton': true,'debug': false,'positionClass': 'toast-top-right','onclick': null,'showDuration': '600','hideDuration': '1000','timeOut': '5000','extendedTimeOut': '3000','showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut'};", true);
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_message", String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), true);
    }

    public static void SendError(string text)
    {

    }

    public static bool SendSMS(string jawwal, string text)
    {
       //string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=admission&pass=10203050&&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
        string url = "http://smsservice.hadara.ps/HandlerSMS.ashx/bulkservice/sessionvalue/sendMessage/" + "?aid=" + "IsraaUniv" + "&apd=" + "As@411511" + "&to=" + jawwal + "&msg=" + text;
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
                    txt.CssClass = "form-control isra-error";
                }
                else
                {
                    txt.CssClass = "form-control";
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                if (Convert.ToInt32(ddl.SelectedValue) <= 0)
                {
                    valid = false;
                    ddl.CssClass = "form-control isra-error";
                }
                else
                {
                    ddl.CssClass = "form-control";
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
                    txt.CssClass = "form-control";
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass = "form-control isra-error";
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                try
                {
                    int x = Convert.ToInt32(ddl.SelectedValue);
                    ddl.CssClass = "form-control";
                }
                catch (Exception ex)
                {
                    valid = false;
                    ddl.CssClass = "form-control isra-error";
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
                    txt.CssClass = "form-control";
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass = "form-control isra-error";
                }
            }
            else if (control is DropDownList)
            {
                DropDownList ddl = (DropDownList)control;
                try
                {
                    int x = Convert.ToInt32(ddl.SelectedValue);
                    ddl.CssClass = "form-control";
                }
                catch (Exception ex)
                {
                    valid = false;
                    ddl.CssClass = "form-control isra-error";
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
                    txt.CssClass = "form-control";
                }
                catch (Exception ex)
                {
                    valid = false;
                    txt.CssClass = "form-control isra-error";
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
                    txt.CssClass = "form-control isra-error";
                }
                else
                {
                    txt.CssClass = "form-control";
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
}
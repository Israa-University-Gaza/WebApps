using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    String employeeID;
    ArrayList permissions;
    public UserPage()
    {
        employeeID = User.Identity.Name;
        permissions = DataAccess.GetEmployeeSystemActions(employeeID, "1");
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

    public static void ShowToast(Page page, string message, string title, string type = "info")
    {
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_option", "toastr.options = {'closeButton': true,'debug': false,'positionClass': 'toast-top-right','onclick': null,'showDuration': '600','hideDuration': '1000','timeOut': '5000','extendedTimeOut': '3000','showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut'};", true);
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "toastr_message", String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), true);
    }

    public static void SendError(string text)
    {
        SendSMS("0599739919", text);
    }

    public static bool SendSMS(string jawwal, string text)
    {
        //string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=israa.ps&pass=wajed@israa.2017&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
        string url = "http://smsservice.hadara.ps/HandlerSMS.ashx/bulkservice/sessionvalue/sendMessage/" + "?aid=" + "IsraaUniv" + "&apd=" + "As@411511" + "&to=" + jawwal + "&msg=" + text;
        string response = GetHtmlPage(url);
        if (response.ToString().StartsWith("1:"))
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
            if (control is Label)
            {
                ((Label)control).Text = "";
            }
            else if (control is TextBox)
            {
                ((TextBox)control).Text = "";
                ((TextBox)control).CssClass = ((TextBox)control).CssClass.Replace(" isra-error", "");
            }
            else if (control is DropDownList)
            {
                ((DropDownList)control).SelectedIndex = 0;
                ((DropDownList)control).CssClass = ((DropDownList)control).CssClass.Replace(" isra-error", "");
            }
            else if (control is CheckBox)
            {
                ((CheckBox)control).Checked = false;
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
                catch 
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
                catch 
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
                catch 
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
                catch 
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
                catch 
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
                catch 
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

   public void ExcuteApI(string url)
    {
        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

    }
}
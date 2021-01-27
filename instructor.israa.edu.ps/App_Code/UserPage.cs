using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    String employeeID;
    public UserPage()
    {
        employeeID = User.Identity.Name;
    }
    public string EmployeeID
    {
        get
        {
            return employeeID;
        }
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
        string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=israa.ps&pass=hw@israa.2015&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
        string response = GetHtmlPage(url);
        if (response.ToString().StartsWith("1:"))
        {
            return true;
        }
        return false;
    }

    public static bool SendEmail(string to, string subject, string body)
    {
        try
        {
            SmtpClient client = new SmtpClient();
            client.Port = 25;
            client.Host = "mail.aqarcircle.com";
            client.EnableSsl = true;
            client.Timeout = 10000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;

            client.Credentials = new System.Net.NetworkCredential("info@aqarcircle.com", "info@123");

            MailMessage mm = new MailMessage("info@aqarcircle.com", to, subject, body);
            mm.BodyEncoding = UTF8Encoding.UTF8;
            mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            client.Send(mm);
            return true;
        }
        catch
        {
            return false;
        }
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
}
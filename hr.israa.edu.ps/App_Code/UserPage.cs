﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Globalization;
using System.Net;
using System.IO;

public class UserPage : System.Web.UI.Page
{
    String userID;
    ArrayList permissions;
    public UserPage()
    {
        userID = User.Identity.Name;
        ArrayList permissions1 = DataAccess.GetEmployeeSystemActions(userID, "12");
        ArrayList permissions2 = DataAccess.GetEmployeeSystemActions(userID, "14");
        ArrayList permissions3 = DataAccess.GetEmployeeSystemActions(userID, "15");
        permissions = DataAccess.GetEmployeeSystemActions(userID, "10");

        permissions.AddRange(permissions1);
        permissions.AddRange(permissions2);
        permissions.AddRange(permissions3);
        //userID = "5";
    }
    public string UserID
    {
        get
        {
            return userID;
        }
    }

    public ArrayList Permissions
    {
        get
        {
            return permissions;
        }
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
                // ((TextBox)control).CssClass = "form-control";
            }
            else if (control is DropDownList)
            {
                ((DropDownList)control).SelectedIndex =-1;
                // ((DropDownList)control).CssClass = "form-control";
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

    public void DisableControls(WebControl[] controls)
    {
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                ((TextBox)control).Enabled = false;
                // ((TextBox)control).CssClass = "form-control";
            }
            else if (control is DropDownList)
            {
                ((DropDownList)control).Enabled = false;
                // ((DropDownList)control).CssClass = "form-control";
            }
            else if (control is CheckBox)
            {
                ((CheckBox)control).Enabled = false;
            }
            else if (control is Label)
            {
                ((Label)control).Enabled = false;
            }
            else if (control is Button)
            {
                ((Button)control).Enabled = false;
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
            //else if (control is DropDownList)
            //{
            //    DropDownList ddl = (DropDownList)control;
            //    try
            //    {
            //        if (Convert.ToInt32(ddl.SelectedValue) <= 0)
            //        {
            //            valid = false;
            //            ddl.CssClass += " isra-error";
            //        }
            //        else
            //        {
            //            ddl.CssClass = ddl.CssClass.Replace(" isra-error", "");
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        valid = false;
            //        ddl.CssClass += " isra-error";
            //    }
            //}
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

    public bool DecimalValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                try
                {
                    decimal x = Convert.ToDecimal(txt.Text);
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
                    decimal x = Convert.ToDecimal(ddl.SelectedValue);
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



    public bool TimeValidateControls(WebControl[] controls)
    {
        bool valid = true;//fr-FR
        foreach (WebControl control in controls)
        {
            if (control is TextBox)
            {
                TextBox txt = (TextBox)control;
                try
                {
                    if (txt.Text.Length <= 6)
                    {
                        Convert.ToDateTime(txt.Text);
                        txt.CssClass = txt.CssClass.Replace(" isra-error", "");
                    }
                    else
                    {
                        valid = false;
                        txt.CssClass += " isra-error";
                    }
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


    //send SMS

    public static bool SendSMS(string jawwal, string text)
    {
        string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=israa.ps&pass=654321&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
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

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    String studentID;

    public UserPage()
    {
        studentID = User.Identity.Name;
    }

    public string StudentID
    {
        get
        {
            return studentID;
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
                ((TextBox)control).CssClass = "form-control";
            }
            else if (control is DropDownList)
            {
                ((DropDownList)control).SelectedIndex = 0;
                ((DropDownList)control).CssClass = "form-control";
            }
            else if (control is RadioButtonList)
            {
                ((RadioButtonList)control).SelectedValue = null;
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

    public bool RadioValidateControls(WebControl[] controls)
    {
        bool valid = true;
        foreach (WebControl control in controls)
        {
            if (control is RadioButtonList)
            {
                RadioButtonList rbl = (RadioButtonList)control;
                try
                {
                    if (Convert.ToInt32(rbl.SelectedValue) > 0)
                    {
                        rbl.CssClass = rbl.CssClass.Replace(" radio-error", "");

                    }
                    else
                    {
                        valid = false;
                        rbl.CssClass = " radio-error";
                    }
                }
                catch (Exception ex)
                {
                    valid = false;
                    rbl.CssClass = " radio-error";
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
        int IDSum = 0;

        if (ID_String.Length == 9)
        {
            for (int i = 1; i <= 7; i++)
            {
                int x = ((Convert.ToInt32(ID_String.Substring(i, 1))) * (((i % 2) == 0) ? 1 : 2));
                IDSum = (x > 9) ? IDSum + (x % 10) + 1 : IDSum + (x % 10);
            }
            IDSum = IDSum + Convert.ToInt32(ID_String.Substring(0, 1));
            valid = (Convert.ToInt32(ID_String.Substring(8, 1)) == (10 - Convert.ToInt32((IDSum.ToString()).Substring(1, 1))));
        }
        return valid;
    }
}
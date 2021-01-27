using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


public class UserPage : System.Web.UI.Page
{
    String employeeID;
    ArrayList permissions;

    public UserPage()
    {
        employeeID = User.Identity.Name;
        permissions = DataAccess.GetEmployeeSystemActions(employeeID, "2");
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
                    Double x = Convert.ToDouble(txt.Text);
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
}
﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = Context.User.Identity.Name;
        if (lblEmployeeID.Text != "1004")
        {
            DataTable DT = DataAccess.EmployeeImageGet(lblEmployeeID.Text);
            if (DT.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
                {
                    byte[] imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    image1.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    image2.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
                else
                {
                    image1.Src = "../images/std.jpg";
                    image2.Src = "../images/std.jpg";
                }
            }
        }
        else {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
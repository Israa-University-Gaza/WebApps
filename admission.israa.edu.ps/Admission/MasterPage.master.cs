using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = Context.User.Identity.Name;
        DataTable DT = DataAccess.EmployeeImageGet(lblEmployeeID.Text);
        //if (DT.Rows.Count > 0)
        //{
        //    if (Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
        //    {
        //        //byte[] imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
        //        //string imgString = Convert.ToBase64String(imgBytes);
        //        //image1.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
        //        //image2.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
        //    }
        //    else
        //    {
        //        image1.Src = "http://system.israa.edu.ps/Uploads/Employees/Profile/"+ lblEmployeeID.Text + "_49.34.02.14.02.2018.png";
        //        //image2.Src = "../images/std.jpg";
        //        image2.Src = "http://system.israa.edu.ps/Uploads/Employees/Profile/"+ lblEmployeeID.Text + "_49.34.02.14.02.2018.png";

        //    }
        //}
    }
    protected void lb_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}

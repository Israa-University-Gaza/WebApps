using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = Context.User.Identity.Name;
        if (!IsPostBack)
        {
            DataTable DTphoto = DataAccess.EmployeePhoto_Get(lblEmployeeID.Text);
            if (DTphoto.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DTphoto.Rows[0]["Emp_Picture"]))
                {
                    // Get the byte array from image file
                    byte[] imgBytes = (byte[])DTphoto.Rows[0]["Emp_Picture"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    //Set the source with data:image/bmp
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    Image1.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
            }

        }
    }
    protected void lb_Click(object sender, EventArgs e)
    {
        Session["Emp_ID"] = null;
        FormsAuthentication.SignOut();
        Response.Redirect("~/Login.aspx");
        
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["Emp_ID"] = null;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
    }
}

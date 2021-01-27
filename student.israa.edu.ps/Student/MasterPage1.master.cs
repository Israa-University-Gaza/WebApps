using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStudentID.Text = Context.User.Identity.Name;
        lblSemesterID.Text = "16";
        DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
        if (DT.Rows.Count > 0)
        {
            if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
            {
                byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                string imgString = Convert.ToBase64String(imgBytes);
                image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                Img1.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
            }
            else
            {
                image.Src = "../images/std.jpg";
                Img1.Src = "../images/std.jpg";
            }
        }
        // خاص بتنبيهات الكتب المعارة وغير مرجعة من قبل الطالب
        DataTable DT2 = DataAccess.StudentMainDataGet(lblStudentID.Text);
        string id = DT2.Rows[0]["StudentNo"].ToString();
        DataTable DT3 = DataAccess.StudentNotify(id);
        if (DT3.Rows.Count > 0)
        {
            notify1.Visible = true;
            if (DT3.Rows[0]["status"].ToString() == "3") notify1.Attributes.Add("class", "alert alert-danger");
            if (DT3.Rows[0]["status"].ToString() == "2") notify1.Attributes.Add("class", "alert alert-warning");
            if (DT3.Rows[0]["status"].ToString() == "1") notify1.Attributes.Add("class", "alert alert-warning");
      
           Notify.Text = DT3.Rows[0]["msg"].ToString();
        }

        //خاص بإكمال معلومات الطالب
        int result = DataAccess.IsStudentDataFinished(lblStudentID.Text);
        if (result == 0)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if(!url.Contains("complete_data"))
            Response.Redirect("complete_data.aspx");
        }

    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}

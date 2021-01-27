using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default11 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");


        DataTable dt= m.hr_cv_get(Convert.ToInt32(Session["emp_id"].ToString()));
        if (dt.Rows.Count == 0)
        {
            cv_up.Visible = false;
            no.Visible = true;

        }
        else
        {
            cv_up.Visible = true;
            no.Visible = false;
            Button1.Text = "تعديل";
            cv_up.Src = "ShowCV.ashx";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

      


        FileUpload img = (FileUpload)FileUpload1;
        Byte[] imgByte = null;
        string[] fname = FileUpload1.FileName.Split('.');
        string ext = fname[fname.Length - 1];

        if (ext.ToLower().Equals("pdf"))
        {
            if (FileUpload1.PostedFile.ContentLength <= 2048576)
            {
                HttpPostedFile File = FileUpload1.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);
                m.add_cv(Convert.ToInt32(Session["emp_id"].ToString()), imgByte);
                Response.Redirect("Image.aspx");
            }
            else
            {
                msg.Visible = true;
                msg.InnerText = "اقصى حجم 2 ميجا ";
            }
        }
        else
        {
            msg.Visible = true;
            msg.InnerText = "امتداد خاطئ";
        }

    }
}
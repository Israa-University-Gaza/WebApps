using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Image : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        DataTable dt = m.hr_p_img_get(Convert.ToInt32(Session["emp_id"].ToString()));
        if (dt.Rows.Count == 0)
        {
            Image1.Visible = false;
           

        }
        else
        {
          
            Button1.Text = "تعديل";
            Image1.ImageUrl = "ShowImage_p.ashx";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       

        FileUpload img = (FileUpload)FileUpload1;
        Byte[] imgByte = null;
        string[] fname = FileUpload1.FileName.Split('.');
        string ext = fname[fname.Length - 1];

        if (ext.ToLower().Equals("jpg") || ext.ToLower().Equals("jpeg") || ext.ToLower().Equals("png"))
        {
            if (FileUpload1.PostedFile.ContentLength <= 1048576)
            {
                HttpPostedFile File = FileUpload1.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);
                m.hr_emp_p_img_add(Convert.ToInt32(Session["emp_id"].ToString()), imgByte);
                Response.Redirect("Default.aspx");
            }
            else
            {
                msg.Visible = true;
                msg.InnerText = "اقصى حجم 1 ميجا ";
            }
        }
        else
        {
            msg.Visible = true;
            msg.InnerText = "امتداد خاطئ";
        }

    }
}
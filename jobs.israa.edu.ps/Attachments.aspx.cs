using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default9 : System.Web.UI.Page
{
    Marq m = new Marq();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
            Response.Redirect("Login.aspx");

        if (Session["lock"] != null)
            Response.Redirect("Lock.aspx");

        h1.HRef = "PracticalLife.aspx";
        h2.HRef = "cv.aspx";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {




    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload img = (FileUpload)FileUpload1;
        Byte[] imgByte = null;
        string[] fname = FileUpload1.FileName.Split('.');
        string ext = fname[fname.Length - 1];

        if (ext.ToLower().Equals("jpg") || ext.ToLower().Equals("jpeg") || ext.ToLower().Equals("png"))
        {
            if (FileUpload1.PostedFile.ContentLength <= 3145728)
            {
                HttpPostedFile File = FileUpload1.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);
                m.add_img(Convert.ToInt32(Session["emp_id"].ToString()), imgByte, typ.SelectedItem.Value);
                GridView1.DataBind();
            }
            else
            {
                msg.Visible = true;
                msg.InnerText = "اقصى حجم 3 ميجا ";
            }
        }
        else
        {
            msg.Visible = true;
            msg.InnerText = " الرجاء ادخال صورة jpg ";
        }


    }



}

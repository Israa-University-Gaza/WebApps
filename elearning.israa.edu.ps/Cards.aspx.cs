using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.IO;
using System.Data;

using System.Text;

public partial class Default2 : System.Web.UI.Page
{
  
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["coll"] == null)
            DataList1.DataSourceID = "SqlDataSource1";
        else
            DataList1.DataSourceID = "SqlDataSource2";

        if (Request.QueryString["dept"] != null)
            DataList1.DataSourceID = "SqlDataSource3";

        DataList1.DataBind();
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    { System.Web.UI.WebControls.Image Image1 = (System.Web.UI.WebControls.Image)e.Item.FindControl("Image1");
        Label std_id=(Label) e.Item.FindControl("std_id");

        Panel pl = e.Item.FindControl("Panel1") as Panel;
        try
        { 
      
   
           DataTable dt1 = r.std_data(DataBinder.Eval(e.Item.DataItem, "StudentID").ToString());
      

        Image1.ImageUrl = "data:image/png;base64," + dt1.Rows[0]["studentImage"].ToString();

            //if (DataBinder.Eval(e.Item.DataItem, "StudentNo").ToString() == "20201785")
            //    Response.Write(dt1.Rows[0]["studentImage"].ToString().Length);
            if (dt1.Rows[0]["studentImage"].ToString().Length == 0)
            {
 e.Item.Visible = false;
                pl.Attributes.Add("style", "display:none;");
                e.Item.Height = Unit.Pixel(0);

               
            }
               

        }
        catch
        {
            Image1.ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Student_icon.svg/512px-Student_icon.svg.png";
        }

        
        PlaceHolder PlaceHolder1 = (PlaceHolder)e.Item.FindControl("PlaceHolder1");
        string std_id1 = DataBinder.Eval(e.Item.DataItem, "StudentNo").ToString();
        string code = std_id1;
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        imgBarCode.Height = 39;
        imgBarCode.Width = 40;
        imgBarCode.Attributes.Add("style", "padding-right:192px");
        using (System.Drawing.Bitmap bitMap = qrCode.GetGraphic(20))
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }

            PlaceHolder1.Controls.Add(imgBarCode);
         
        }

        PlaceHolder PlaceHolder2 = (PlaceHolder)e.Item.FindControl("PlaceHolder2");
        string Mobile = DataBinder.Eval(e.Item.DataItem, "Mobile").ToString();
        string code1 = Mobile;
        QRCodeGenerator qrGenerator1 = new QRCodeGenerator();
        QRCodeGenerator.QRCode qrCode1 = qrGenerator.CreateQrCode(code1, QRCodeGenerator.ECCLevel.Q);
        System.Web.UI.WebControls.Image imgBarCode1 = new System.Web.UI.WebControls.Image();
        imgBarCode1.Height = 39;
        imgBarCode1.Width = 40;
        using (System.Drawing.Bitmap bitMap1 = qrCode.GetGraphic(20))
        {
            using (MemoryStream ms1 = new MemoryStream())
            {
                bitMap1.Save(ms1, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage1 = ms1.ToArray();
                imgBarCode1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage1);
            }

            //PlaceHolder2.Controls.Add(imgBarCode1);

        }

    }
}